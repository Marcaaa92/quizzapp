package f2.quizzapp.controller;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.auth0.jwt.interfaces.JWTVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.gson.Gson;
import f2.quizzapp.DTO.userDTO.*;
import f2.quizzapp.DTOMapper.UserDTOMapper.InsertUserDTOMapper;
import f2.quizzapp.model.user.User;
import f2.quizzapp.service.user.UserService;
import f2.quizzapp.util.AESEncoder;
import f2.quizzapp.util.CaptchaValidator;
import f2.quizzapp.util.Mail;
import f2.quizzapp.util.ResponseEntityUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.Objects;

import static org.springframework.http.HttpStatus.*;

@CrossOrigin
@Controller
@SuppressWarnings("unused")
public class UserController {

    private final Logger loggerUser;
    private final Gson gson;
    private final Mail mail;
    private final UserService userService;
    private final InsertUserDTOMapper insertUserDTOMapper;
    private final BCryptPasswordEncoder encoder;
    private final String baseUrl;
    private final String SECRET;
    private final SecretKeySpec key;

    @Autowired
    public UserController(Logger loggerUser, Gson gson, Mail mail, UserService userService, InsertUserDTOMapper insertUserDTOMapper, BCryptPasswordEncoder encoder, String baseUrl, String SECRET, String secret) {
        this.loggerUser = loggerUser;
        this.gson = gson;
        this.mail = mail;
        this.userService = userService;
        this.insertUserDTOMapper = insertUserDTOMapper;
        this.encoder = encoder;
        this.baseUrl = baseUrl;
        this.SECRET = SECRET;
        byte[] bytes = new BigInteger("7F" + secret, 16).toByteArray();
        key = new SecretKeySpec(bytes, 1, bytes.length - 1, "AES");
    }

    @RequestMapping(path = "/registration", method = RequestMethod.POST)
    ResponseEntity<String> registrationSendMail(@Valid @RequestBody InsertUserDTO userJson, HttpServletRequest request) {
        User user = insertUserDTOMapper.apply(userJson);
        if (!userService.existByEmail(user.getEmail())) {
            User userNew = new User(user.getName(), user.getEmail(), encoder.encode(user.getPassword()));
            try {
                Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
                String tokenJwt = JWT.create().withIssuer("marca").withSubject(gson.toJson(userNew)).withExpiresAt(Date.from(ZonedDateTime.now().plusMinutes(5).toInstant())).sign(algorithm);
                String token = AESEncoder.encode(tokenJwt, key);
                mail.sendMail(user.getEmail(), "Click on this link to confirm your registration: " + baseUrl + "register/" + token);
                return ResponseEntityUtils.response(OK, "Check your inbox", request);
            } catch (Exception e) {
                loggerUser.error(e.toString());
                return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot elaborate and user token", request);
            }
        } else {
            return ResponseEntityUtils.response(CONFLICT, "Email already exist", request);
        }
    }

    @RequestMapping(path = "/registration/confirm", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> registrationVerification(@Valid @RequestBody TokenDTO tokenDTO, HttpServletRequest request) {

        try {
            Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
            JWTVerifier verifier = JWT.require(algorithm).withIssuer("marca").build();
            String tokenJwt = AESEncoder.decode(tokenDTO.token(), key);
            System.out.println(tokenJwt);
            DecodedJWT decodedJWT = verifier.verify(tokenJwt);
            User user = gson.fromJson(decodedJWT.getSubject(), User.class);
            User userToken = new User(user.getEmail(), user.getPassword());
            if (userService.existByEmail(user.getEmail())) {
                return ResponseEntityUtils.response(CONFLICT, "Email already confirmed", request);
            } else {
                try {
                    String tokenJwtU;
                    algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
                    tokenJwtU = JWT.create().withIssuer("marca").withSubject(gson.toJson(userToken)).withExpiresAt(Date.from(ZonedDateTime.now().plusMinutes(5).toInstant())).sign(algorithm);
                    String userTokenField = AESEncoder.encode(tokenJwtU, key);
                    user.setToken(userTokenField);
                    userService.saveUser(user);
                    return ResponseEntityUtils.response(OK, "User registered successfully", request);
                } catch (JWTCreationException e) {
                    loggerUser.error(e.toString());
                    return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot verify the user token", request);
                }
            }
        } catch (Exception e) {
            loggerUser.error(e.toString());
            return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot verify the user token", request);
        }
    }

    @RequestMapping(path = "/login", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> login(@Valid @RequestBody LoginDTO loginDTO, HttpServletRequest request) {
        if (CaptchaValidator.validate(loginDTO.recaptcha(), SECRET)) {
            User userFromDb = userService.findByEmail(loginDTO.email());
            if (encoder.matches(loginDTO.password(), userFromDb.getPassword())) {
                JSONObject user = new JSONObject();
                user.put("name", userFromDb.getName());
                user.put("email", userFromDb.getEmail());
                user.put("token", userFromDb.getToken());
                loggerUser.info("user " + userFromDb.getId() + " logged");
                return ResponseEntityUtils.response(OK, user, request);
            } else {
                return ResponseEntityUtils.response(UNAUTHORIZED, "Wrong credentials", request);
            }
        } else {
            return ResponseEntityUtils.response(BAD_REQUEST, "Captcha failed", request);
        }
    }

    @RequestMapping(path = "/login-google", method = RequestMethod.POST)
    public ResponseEntity<String> loginGoogle(@Valid @RequestBody TokenDTO tokenDTO, HttpServletRequest request) {
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(), new GsonFactory()).build();
        try {
            GoogleIdToken token = verifier.verify(tokenDTO.token());

            Payload pl = token.getPayload();
            User userFromDb = userService.findByEmail((String) pl.get("email"));
            JSONObject user = new JSONObject();
            user.put("name", userFromDb.getName());
            user.put("email", userFromDb.getEmail());
            user.put("token", userFromDb.getToken());
            loggerUser.info("user " + userFromDb.getId() + " logged");
            return ResponseEntityUtils.response(OK, user, request);
        } catch (GeneralSecurityException | IOException e) {
            loggerUser.error(e.toString());
            return ResponseEntityUtils.response(HttpStatus.BAD_REQUEST, "something went wrong", request);
        }
    }

    @RequestMapping(path = "/change-password", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> changePassword(@Valid @RequestBody ChangePasswordDTO changePasswordDTO, HttpServletRequest request) {
        if (!Objects.equals(changePasswordDTO.password(), changePasswordDTO.oldPassword())) {
            User userFromDb = userService.findByEmail(changePasswordDTO.email());
            if (encoder.matches(changePasswordDTO.oldPassword(), userFromDb.getPassword())) {
                userFromDb.setPassword(encoder.encode(changePasswordDTO.password()));
                User userToken = new User(userFromDb.getEmail(), userFromDb.getPassword());
                try {
                    Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
                    String tokenJwt = JWT.create().withIssuer("marca").withSubject(gson.toJson(userToken)).sign(algorithm);
                    String token = AESEncoder.encode(tokenJwt, key);
                    userFromDb.setToken(token);
                } catch (Exception e) {
                    loggerUser.error(e.toString());
                    return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot elaborate and user token", request);
                }
                userService.editUser(userFromDb);
                return ResponseEntityUtils.response(OK, "Password changed", request);
            } else {
                return ResponseEntityUtils.response(UNAUTHORIZED, "Wrong credentials", request);
            }
        } else {
            return ResponseEntityUtils.response(BAD_REQUEST, "Password cannot be the same", request);
        }
    }

    @RequestMapping(path = "/change-email", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> changeEmail(@Valid @RequestBody ChangeEmailDTO changeEmailDTO, HttpServletRequest request) {
        if (!Objects.equals(changeEmailDTO.email(), changeEmailDTO.newEmail())) {
            User userFromDb = userService.findByEmail(changeEmailDTO.email());
            if (userService.existByEmail(changeEmailDTO.email())) {
                if (encoder.matches(changeEmailDTO.password(), userFromDb.getPassword())) {
                    userFromDb.setEmail(changeEmailDTO.newEmail());
                    try {
                        Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
                        String tokenJwt = JWT.create().withIssuer("marca").withSubject(userFromDb.toString()).withExpiresAt(Date.from(ZonedDateTime.now().plusMinutes(5).toInstant())).sign(algorithm);
                        String token = AESEncoder.encode(tokenJwt, key);
                        mail.sendMail(changeEmailDTO.newEmail(), "Click on this link to change your password: " + baseUrl + "change-email/" + token);
                        return ResponseEntityUtils.response(OK, "Mail sent", request);
                    } catch (Exception e) {
                        loggerUser.error(e.toString());
                        return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot elaborate and user token", request);
                    }
                } else {
                    return ResponseEntityUtils.response(UNAUTHORIZED, "Wrong credentials", request);
                }
            } else {
                return ResponseEntityUtils.response(BAD_REQUEST, "Email is already used", request);
            }
        } else {
            return ResponseEntityUtils.response(BAD_REQUEST, "Email cannot be the same", request);
        }
    }

    @RequestMapping(path = "/change-email/confirm", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> changeEmailSetNew(@Valid @RequestBody TokenDTO tokenDTO, HttpServletRequest request) {
        try {
            Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
            JWTVerifier verifier = JWT.require(algorithm).withIssuer("marca").build();
            String token = AESEncoder.decode(tokenDTO.token(), key);
            DecodedJWT decodedJWT = verifier.verify(token);
            User user = gson.fromJson(decodedJWT.getSubject(), User.class);
            User userToken = new User(user.getEmail(), user.getPassword());
            if (userService.existByEmail(user.getEmail())) {
                return ResponseEntityUtils.response(CONFLICT, "Email already confirmed", request);
            } else {
                try {
                    String tokenJwt;
                    algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
                    tokenJwt = JWT.create().withIssuer("marca").withSubject(gson.toJson(userToken)).withExpiresAt(Date.from(ZonedDateTime.now().plusMinutes(5).toInstant())).sign(algorithm);
                    String tokenEncoded = AESEncoder.encode(tokenJwt, key);
                    user.setToken(tokenEncoded);
                    userService.editUser(user);
                    return ResponseEntityUtils.response(OK, "Email changed successfully", request);
                } catch (JWTCreationException e) {
                    loggerUser.error(e.toString());
                    return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot create the user token", request);
                }
            }
        } catch (Exception e) {
            loggerUser.error(e.toString());
            return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot verify the user token", request);
        }
    }

    @RequestMapping(path = "/reset-password", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> resetPassword(@Valid @RequestBody ResetPasswordDTO resetPasswordDTO, HttpServletRequest request) {
        if (userService.existByEmail(resetPasswordDTO.email())) {
            User userFromDb = userService.findByEmail(resetPasswordDTO.email());
            try {
                Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
                String tokenJwt = JWT.create().withIssuer("marca").withSubject(userFromDb.toString()).withExpiresAt(Date.from(ZonedDateTime.now().plusMinutes(5).toInstant())).sign(algorithm);
                String token = AESEncoder.encode(tokenJwt, key);
                mail.sendMail(resetPasswordDTO.email(), "Click on this link to perform password recovery: " + baseUrl + "reset-password/" + token);
            } catch (Exception e) {
                loggerUser.error(e.toString());
                return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot elaborate and user token", request);
            }
        }
        return ResponseEntityUtils.response(OK, "If email exist you'll receive a link to reset your password", request);
    }

    @RequestMapping(path = "/reset-password/new-password", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> resetPasswordConfirm(@Valid @RequestBody ResetPasswordNewPasswordDTO resetPasswordNewPasswordDTO, HttpServletRequest request) {
        try {
            Algorithm algorithm = Algorithm.HMAC512("zlatan_ibrahimovic");
            String token = AESEncoder.decode(resetPasswordNewPasswordDTO.token(), key);
            JWTVerifier verifier = JWT.require(algorithm).withIssuer("marca").build();
            DecodedJWT decodedJWT = verifier.verify(token);
            User user = gson.fromJson(decodedJWT.getSubject(), User.class);
            User userFromDb = userService.findByEmail(user.getEmail());
            if (!encoder.matches(resetPasswordNewPasswordDTO.password(), userFromDb.getPassword())) {
                userFromDb.setPassword(encoder.encode(resetPasswordNewPasswordDTO.password()));
                User userToken = new User(userFromDb.getEmail(), userFromDb.getPassword());
                try {
                    String tokenJwt = JWT.create().withIssuer("marca").withSubject(gson.toJson(userToken)).sign(algorithm);
                    String tokenEncoded = AESEncoder.encode(tokenJwt, key);
                    userFromDb.setToken(tokenEncoded);
                    userService.editUser(userFromDb);
                    return ResponseEntityUtils.response(OK, "Password changed", request);
                } catch (JWTCreationException e) {
                    loggerUser.error(e.toString());
                    return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot create user token", request);
                }
            } else {
                return ResponseEntityUtils.response(BAD_REQUEST, "The password is the same as the previous ones or you have already changed it", request);
            }
        } catch (Exception e) {
            loggerUser.error(e.toString());
            return ResponseEntityUtils.response(INTERNAL_SERVER_ERROR, "The server cannot verify the user token", request);
        }
    }

    @RequestMapping(path = "/account-deletion", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> accountDeletion(@Valid @RequestBody AccountDeletionDTO accountDeletionDTO, HttpServletRequest request) {
        User userFromDb = userService.findByEmail(accountDeletionDTO.email());
        if (encoder.matches(accountDeletionDTO.password(), userFromDb.getPassword())) {
            userFromDb.setActive(false);
            userService.editUser(userFromDb);
            return ResponseEntityUtils.response(OK, "Deleted", request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Wrong credentials", request);
        }
    }

    @RequestMapping(path = "/check-token-validity", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> checkTokenValidity(@Valid @RequestBody TokenDTO tokenDTO, HttpServletRequest request) {
        User userFromDb = userService.findByToken(tokenDTO.token());
        return ResponseEntityUtils.response(OK, "token valid", request);
    }
}
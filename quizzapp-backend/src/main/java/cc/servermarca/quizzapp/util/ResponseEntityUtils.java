package cc.servermarca.quizzapp.util;

import cc.servermarca.quizzapp.controller.UserController;
import jakarta.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseEntityUtils {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    public static ResponseEntity<String> response(HttpStatus httpStatus, JSONObject body, HttpServletRequest request) {
        JSONObject objectFakeArray = new JSONObject();
        objectFakeArray.put("statusCode", httpStatus.value());
        objectFakeArray.put("msg", body);
        logger.info(request.getRemoteAddr() + " request to " + request.getRequestURI() + " response finished with " + httpStatus.value());
        return ResponseEntity.status(httpStatus).body(objectFakeArray.toString());
    }

    public static ResponseEntity<String> response(HttpStatus httpStatus, Object body, HttpServletRequest request) {
        JSONObject objectFakeArray = new JSONObject();
        objectFakeArray.put("statusCode", httpStatus.value());
        objectFakeArray.put("msg", body);
        logger.info(request.getRemoteAddr() + " request to " + request.getRequestURI() + " response finished with " + httpStatus.value());
        return ResponseEntity.status(httpStatus).body(objectFakeArray.toString());
    }

    public static ResponseEntity<String> response(HttpStatus httpStatus, String body, HttpServletRequest request) {
        JSONObject objectFakeArray = new JSONObject();
        objectFakeArray.put("statusCode", httpStatus.value());
        objectFakeArray.put("msg", body);
        logger.info(request.getRemoteAddr() + " request to " + request.getRequestURI() + " response finished with " + httpStatus.value());
        return ResponseEntity.status(httpStatus).body(objectFakeArray.toString());
    }
}

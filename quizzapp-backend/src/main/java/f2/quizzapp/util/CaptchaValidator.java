package f2.quizzapp.util;

import f2.quizzapp.model.captcha.CaptchaResult;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

public class CaptchaValidator {

    private static final String URL = "https://www.google.com/recaptcha/api/siteverify";

    public static boolean validate(String captcha, String SECRET) {
        String reqBody = "secret=" + SECRET + "&response=" + captcha;

        HttpHeaders reqHeaders = new HttpHeaders();
        reqHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        HttpEntity<String> requestC = new HttpEntity<String>(reqBody, reqHeaders);

        RestTemplate rt = new RestTemplate();

        CaptchaResult result = rt.postForEntity(URL, requestC, CaptchaResult.class).getBody();
        assert result != null;
        return result.isSuccess();
    }
}

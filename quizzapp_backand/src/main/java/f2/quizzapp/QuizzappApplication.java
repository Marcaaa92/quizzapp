package f2.quizzapp;

import com.google.gson.Gson;
import f2.quizzapp.controller.QuizController;
import f2.quizzapp.controller.UserController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.security.SecureRandom;

@SpringBootApplication
public class QuizzappApplication {
    @Value("${server.baseUrl}")
    private String baseUrl;
    @Value("${server.capchakey}")
    private String SECRET;
    @Value("${server.AESSECRET}")
    private String secret;

    @Autowired
    public static void main(String[] args) {
        SpringApplication.run(QuizzappApplication.class, args);

    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder(12, new SecureRandom());
    }

    @Bean
    public Logger loggerUser() {
        return LoggerFactory.getLogger(UserController.class);
    }

    @Bean
    public Logger loggerQuiz() {
        return LoggerFactory.getLogger(QuizController.class);
    }

    @Bean
    public String baseUrl() {
        return baseUrl;
    }

    @Bean
    String SECRET() {
        return SECRET;
    }

    @Bean
    String secret() {
        return secret;
    }

    @Bean
    public Gson gson() {
        return new Gson();
    }
}

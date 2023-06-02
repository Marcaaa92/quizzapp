package f2.quizzapp.exceptionHandler;

import f2.quizzapp.exception.quiz.AnswerNotFoundException;
import f2.quizzapp.exception.quiz.QuestionNotFoundException;
import f2.quizzapp.exception.quiz.QuizNotFoundException;
import f2.quizzapp.exception.quiz.QuizResultNotFoundException;
import f2.quizzapp.exception.user.UserNotFoundException;
import f2.quizzapp.util.ResponseEntityUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.stream.Collectors;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> responseEntity(UserNotFoundException userNotFoundException, HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.UNAUTHORIZED, userNotFoundException.getMessage(), request);
    }

    @ExceptionHandler(QuizNotFoundException.class)
    public ResponseEntity<String> responseEntity(QuizNotFoundException quizNotFoundException, HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.UNAUTHORIZED, quizNotFoundException.getMessage(), request);
    }

    @ExceptionHandler(QuestionNotFoundException.class)
    public ResponseEntity<String> responseEntity(QuestionNotFoundException questionNotFoundException, HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.UNAUTHORIZED, questionNotFoundException.getMessage(), request);
    }

    @ExceptionHandler(AnswerNotFoundException.class)
    public ResponseEntity<String> responseEntity(AnswerNotFoundException answerNotFoundException, HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.UNAUTHORIZED, answerNotFoundException.getMessage(), request);
    }

    @ExceptionHandler(QuizResultNotFoundException.class)
    public ResponseEntity<String> responseEntity(QuizResultNotFoundException quizResultNotFoundException, HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.UNAUTHORIZED, quizResultNotFoundException.getMessage(), request);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<String> handleInsertUtenteArgumentsException(MethodArgumentNotValidException methodArgumentNotValidException, HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.BAD_REQUEST, methodArgumentNotValidException.getBindingResult()
                .getFieldErrors()
                .stream()
                .map(DefaultMessageSourceResolvable::getDefaultMessage)
                .collect(Collectors.toList()), request);
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<String> responseEntity(HttpServletRequest request) {
        return ResponseEntityUtils.response(HttpStatus.BAD_REQUEST, "Json sintax error", request);
    }

}


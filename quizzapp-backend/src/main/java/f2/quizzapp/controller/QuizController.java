package f2.quizzapp.controller;

import com.google.gson.Gson;
import f2.quizzapp.DTO.quizDTO.AnswerDTO;
import f2.quizzapp.DTO.quizDTO.QuestionDTO;
import f2.quizzapp.DTO.quizDTO.QuizDTO;
import f2.quizzapp.DTO.quizDTO.SaveQuizDTO;
import f2.quizzapp.DTO.userDTO.TokenDTO;
import f2.quizzapp.DTOMapper.quizDTOMapper.AnswerDTOMapper;
import f2.quizzapp.DTOMapper.quizDTOMapper.QuestionDTOMapper;
import f2.quizzapp.DTOMapper.quizDTOMapper.QuizDTOMapper;
import f2.quizzapp.model.quiz.Answer;
import f2.quizzapp.model.quiz.Question;
import f2.quizzapp.model.quiz.Quiz;
import f2.quizzapp.model.quiz.QuizResult;
import f2.quizzapp.model.user.User;
import f2.quizzapp.service.quiz.AnswerService;
import f2.quizzapp.service.quiz.QuestionService;
import f2.quizzapp.service.quiz.QuizResultService;
import f2.quizzapp.service.quiz.QuizService;
import f2.quizzapp.service.user.UserService;
import f2.quizzapp.util.ResponseEntityUtils;
import jakarta.persistence.Tuple;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

import static org.springframework.http.HttpStatus.*;

@CrossOrigin
@Controller
@SuppressWarnings("unused")
public class QuizController {

    private final UserService userService;
    private final QuizService quizService;
    private final QuizResultService quizResultService;
    private final QuestionService questionService;
    private final AnswerService answerService;
    private final QuizDTOMapper quizDTOMapper;
    private final QuestionDTOMapper questionDTOMapper;
    private final AnswerDTOMapper answerDTOMapper;
    private final Gson gson;

    @Autowired
    public QuizController(UserService userService, QuizService quizService, QuizResultService quizResultService, QuestionService questionService, AnswerService answerService, QuizDTOMapper quizDTOMapper, QuestionDTOMapper questionDTOMapper, AnswerDTOMapper answerDTOMapper, Gson gson) {
        this.userService = userService;
        this.quizService = quizService;
        this.quizResultService = quizResultService;
        this.questionService = questionService;
        this.answerService = answerService;
        this.quizDTOMapper = quizDTOMapper;
        this.questionDTOMapper = questionDTOMapper;
        this.answerDTOMapper = answerDTOMapper;
        this.gson = gson;
    }

    @RequestMapping(value = "/new-quiz", method = RequestMethod.PUT)
    @SuppressWarnings("unused")
    ResponseEntity<String> newQuiz(@Valid @RequestBody QuizDTO quizRequestDTO, HttpServletRequest request) {
        if (this.userService.existByToken(quizRequestDTO.token())) {
            User userFromDb = userService.findByToken(quizRequestDTO.token());
            Quiz quiz = quizDTOMapper.apply(quizRequestDTO);
            quiz.setUser(userFromDb);
            quiz.setPublished(false);
            quizService.saveQuiz(quiz);
            ArrayList<Question> questions = new ArrayList<>();
            ArrayList<Answer> answers = new ArrayList<>();
            for (QuestionDTO questionDTO : quizRequestDTO.questions()) {
                Question question = questionDTOMapper.apply(questionDTO);
                question.setQuiz(quiz);
                questions.add(question);
                for (AnswerDTO answerDTO : questionDTO.answers()) {
                    Answer answer = answerDTOMapper.apply(answerDTO);
                    answer.setQuestion(question);
                    answers.add(answer);
                }
            }
            questionService.saveAllQuestions(questions);
            answerService.saveAllAnswers(answers);
            return ResponseEntityUtils.response(HttpStatus.OK, quiz.getId(), request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/get-all", method = RequestMethod.PUT)
    @SuppressWarnings("unused")
    ResponseEntity<String> getAll(@Valid @RequestBody TokenDTO tokenDTO, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            List<Quiz> quiz = quizService.findAll();
            return ResponseEntityUtils.response(OK, gson.fromJson("{'quiz':" + quiz + "}", Object.class), request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/get-quizzes-by-user", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> getQuizzesByUser(@Valid @RequestBody TokenDTO tokenDTO, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            List<Quiz> quiz = quizService.findAll();
            List<Tuple> quizzesFromDb = quizService.findByUser(tokenDTO.token());
            JSONArray quizzes = new JSONArray();
            for (Tuple t : quizzesFromDb) {
                Map<String, Object> map = new HashMap<>();
                map.put("id", t.get("id"));
                map.put("title", t.get("title"));
                quizzes.put(map);
            }
            return ResponseEntityUtils.response(OK, quizzes, request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/get-by-id/{id}", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> getQuizById(@RequestBody TokenDTO tokenDTO, @PathVariable String id, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            User userFromDb = userService.findByToken(tokenDTO.token());
            Quiz quiz = quizService.findById(id);
            return ResponseEntityUtils.response(OK, gson.fromJson("{'quiz':" + quiz + "}", Object.class), request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/save-quiz", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> getQuizById(@Valid @RequestBody SaveQuizDTO saveQuizDTO, HttpServletRequest request) {
        if (this.userService.existByToken(saveQuizDTO.token())) {
            User userFromDb = userService.findByToken(saveQuizDTO.token());
            if (!quizResultService.checkIfCompleted(userFromDb.getId(), saveQuizDTO.quizId())) {
                Quiz quizFromDb = quizService.findById(saveQuizDTO.quizId());
                QuizResult quizResult = new QuizResult(Double.valueOf(saveQuizDTO.correctQuestions()), saveQuizDTO.quizCorrection());
                quizResult.setUser(userFromDb);
                quizResult.setQuiz(quizFromDb);
                quizResult.setId(UUID.randomUUID().toString());
                quizResultService.saveQuizResult(quizResult);
                return ResponseEntityUtils.response(OK, "Saved response", request);
            } else {
                return ResponseEntityUtils.response(BAD_REQUEST, "You have already completed this quiz", request);
            }
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/check-quiz-if-completed/{id}", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> checkQuizIfCompleted(@Valid @RequestBody TokenDTO tokenDTO, @PathVariable String id, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            User userFromDb = userService.findByToken(tokenDTO.token());
            Quiz quizFromDb = this.quizService.findById(id);
            if (!quizResultService.checkIfCompleted(userFromDb.getId(), id)) {
                return ResponseEntityUtils.response(OK, "Quiz not completed", request);
            } else {
                return ResponseEntityUtils.response(BAD_REQUEST, "Quiz completed", request);
            }
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/get-by-id/{id}/results", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> getQuizByIdResults(@Valid @RequestBody TokenDTO tokenDTO, @PathVariable String id, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            User userFromDb = userService.findByToken(tokenDTO.token());
            Quiz quiz = quizService.findById(id);
            if (quiz.getUser().getToken().equals(userFromDb.getToken())) {
                List<QuizResult> quizResults = quizResultService.findByQuizId(id);
                return ResponseEntityUtils.response(OK, gson.fromJson("{'quiz':" + quiz + ", 'results':" + quizResults + "}", Object.class), request);
            } else {
                return ResponseEntityUtils.response(UNAUTHORIZED, "You are not the quiz creator", request);
            }
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/get-by-id/{id}/results/user", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> getQuizByIdResultsByUser(@Valid @RequestBody TokenDTO tokenDTO, @PathVariable String id, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            User userFromDb = userService.findByToken(tokenDTO.token());
            Quiz quiz = quizService.findByIdAndPublished(id);
            List<QuizResult> quizResults = quizResultService.findByQuizIdAndUser(id, userFromDb.getId());
            return ResponseEntityUtils.response(OK, gson.fromJson("{'quiz':" + quiz + ", 'results':" + quizResults + "}", Object.class), request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }

    @RequestMapping(value = "/publish-results/{id}", method = RequestMethod.POST)
    @SuppressWarnings("unused")
    ResponseEntity<String> publishResults(@Valid @RequestBody TokenDTO tokenDTO, @PathVariable String id, HttpServletRequest request) {
        if (this.userService.existByToken(tokenDTO.token())) {
            Quiz quiz = quizService.findById(id);
            quiz.setPublished(!quiz.getPublished());
            quizService.editQuiz(quiz);
            return ResponseEntityUtils.response(OK, "ok", request);
        } else {
            return ResponseEntityUtils.response(UNAUTHORIZED, "Token not found", request);
        }
    }
}
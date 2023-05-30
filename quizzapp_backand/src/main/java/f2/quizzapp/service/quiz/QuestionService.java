package f2.quizzapp.service.quiz;

import f2.quizzapp.dao.quiz.QuestionDao;
import f2.quizzapp.exception.quiz.QuestionNotFoundException;
import f2.quizzapp.exception.quiz.QuizNotFoundException;
import f2.quizzapp.model.quiz.Question;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class QuestionService {
    private final QuestionDao questionDao;

    public QuestionService(QuestionDao questionDao) {
        this.questionDao = questionDao;
    }

    public Question findById(String id) throws QuizNotFoundException {
        Optional<Question> question = questionDao.findById(id);
        if (question.isPresent())
            return question.get();
        else
            throw new QuestionNotFoundException("The question does not exist");
    }

    public ArrayList<Question> findAllByQuizId(String token) throws QuizNotFoundException {
        Optional<ArrayList<Question>> question = questionDao.findAllByQuizId(token);
        if (question.isPresent())
            return question.get();
        else
            throw new QuestionNotFoundException("The the quiz does not exist");
    }

    public void saveQuestion(Question question) {
        questionDao.save(question);
    }

    public void saveAllQuestions(List<Question> question) {
        questionDao.saveAll(question);
    }

    public void editQuestions(Question question) throws QuizNotFoundException {
        if (questionDao.findById(question.getId()).isPresent()) {
            questionDao.save(question);
        } else {
            throw new QuestionNotFoundException("Question not found");
        }
    }

    public boolean existById(String id) {
        return questionDao.findById(id).isPresent();
    }
}

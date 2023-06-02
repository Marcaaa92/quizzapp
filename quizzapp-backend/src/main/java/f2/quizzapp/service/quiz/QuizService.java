package f2.quizzapp.service.quiz;

import f2.quizzapp.dao.quiz.QuizDao;
import f2.quizzapp.exception.quiz.QuizNotFoundException;
import f2.quizzapp.model.quiz.Quiz;
import jakarta.persistence.Tuple;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuizService {
    private final QuizDao quizDao;

    public QuizService(QuizDao quizDao) {
        this.quizDao = quizDao;
    }

    public Quiz findById(String id) throws QuizNotFoundException {
        Optional<Quiz> quiz = quizDao.findById(id);
        if (quiz.isPresent())
            return quiz.get();
        else
            throw new QuizNotFoundException("The quiz does not exist");
    }

    public Quiz findByIdAndPublished(String id) throws QuizNotFoundException {
        Optional<Quiz> quiz = quizDao.findById(id);
        if (quiz.isPresent() && quiz.get().getPublished())
            return quiz.get();
        else
            throw new QuizNotFoundException("The quiz does not exist or published");
    }

    public List<Quiz> findAll() throws QuizNotFoundException {
        List<Quiz> quizList = quizDao.findAll();
        if (!quizList.isEmpty()) {
            return quizList;
        } else {
            throw new QuizNotFoundException("Quizzes not found");
        }
    }

    public List<Tuple> findByUser(String token) throws QuizNotFoundException {
        Optional<List<Tuple>> quiz = quizDao.findByUser(token);
        if (quiz.isPresent())
            return quiz.get();
        else
            throw new QuizNotFoundException("The quiz does not exist");
    }

    public void saveQuiz(Quiz quiz) {
        quizDao.save(quiz);
    }

    public void editQuiz(Quiz quiz) throws QuizNotFoundException {
        if (quizDao.findById(quiz.getId()).isPresent()) {
            quizDao.save(quiz);
        } else {
            throw new QuizNotFoundException("Thw quiz does not exist");
        }
    }

    public boolean existById(String id) {
        return quizDao.findById(id).isPresent();
    }
}

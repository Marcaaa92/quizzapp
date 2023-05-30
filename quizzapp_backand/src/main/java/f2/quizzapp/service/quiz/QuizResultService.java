package f2.quizzapp.service.quiz;

import f2.quizzapp.dao.quiz.QuizResultDao;
import f2.quizzapp.exception.quiz.QuizResultNotFoundException;
import f2.quizzapp.model.quiz.QuizResult;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuizResultService {
    private final QuizResultDao quizResultDao;

    public QuizResultService(QuizResultDao quizResultDao) {
        this.quizResultDao = quizResultDao;
    }

    public QuizResult findById(String id) throws QuizResultNotFoundException {
        Optional<QuizResult> quizResult = quizResultDao.findById(id);
        if (quizResult.isPresent())
            return quizResult.get();
        else
            throw new QuizResultNotFoundException("The quizResult does not exist");
    }


    public void saveQuizResult(QuizResult quizResult) {
        quizResultDao.save(quizResult);
    }

    public void editQuestions(QuizResult quizResult) throws QuizResultNotFoundException {
        if (quizResultDao.findById(quizResult.getId()).isPresent()) {
            quizResultDao.save(quizResult);
        } else {
            throw new QuizResultNotFoundException("quizResult not found");
        }
    }

    public QuizResult findByUser(String userId) throws QuizResultNotFoundException {
        Optional<QuizResult> quizResult = quizResultDao.findByUser(userId);
        if (quizResult.isPresent()) {
            return quizResult.get();
        } else {
            throw new QuizResultNotFoundException("quizResult not found");
        }
    }

    public boolean checkIfCompleted(String userId, String quizId) {
        Optional<QuizResult> quizResult = quizResultDao.checkIfCompleted(userId, quizId);
        return quizResult.isPresent();
    }

    public List<QuizResult> findByQuizId(String quizId) throws QuizResultNotFoundException {
        Optional<List<QuizResult>> quizResult = quizResultDao.findByQuizId(quizId);
        if (quizResult.isPresent()) {
            return quizResult.get();
        } else {
            throw new QuizResultNotFoundException("quizResults not found");
        }
    }

    public List<QuizResult> findByQuizIdAndUser(String quizId, String userId) throws QuizResultNotFoundException {
        Optional<List<QuizResult>> quizResult = quizResultDao.findByQuizIdAndUser(quizId, userId);
        if (quizResult.isPresent()) {
            return quizResult.get();
        } else {
            throw new QuizResultNotFoundException("quizResults not found");
        }
    }

    public boolean existById(String id) {
        return quizResultDao.findById(id).isPresent();
    }
}

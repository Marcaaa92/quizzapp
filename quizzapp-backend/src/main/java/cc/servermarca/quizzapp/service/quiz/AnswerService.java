package cc.servermarca.quizzapp.service.quiz;

import cc.servermarca.quizzapp.dao.quiz.AnswerDao;
import cc.servermarca.quizzapp.exception.quiz.AnswerNotFoundException;
import cc.servermarca.quizzapp.model.quiz.Answer;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AnswerService {
    private final AnswerDao answerDao;

    public AnswerService(AnswerDao answerDao) {
        this.answerDao = answerDao;
    }

    public Answer findById(String id) throws AnswerNotFoundException {
        Optional<Answer> answer = answerDao.findById(id);
        if (answer.isPresent())
            return answer.get();
        else
            throw new AnswerNotFoundException("The answer does not exist");
    }


    public void saveAnswer(Answer answer) {
        answerDao.save(answer);
    }

    public void saveAllAnswers(List<Answer> answer) {
        answerDao.saveAll(answer);
    }

    public void editAnswer(Answer answer) throws AnswerNotFoundException {
        if (answerDao.findById(answer.getId()).isPresent()) {
            answerDao.save(answer);
        } else {
            throw new AnswerNotFoundException("Answer not found");
        }
    }

    public boolean existById(String id) {
        return answerDao.findById(id).isPresent();
    }
}

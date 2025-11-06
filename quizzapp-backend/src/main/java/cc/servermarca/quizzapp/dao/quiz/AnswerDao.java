package cc.servermarca.quizzapp.dao.quiz;

import cc.servermarca.quizzapp.model.quiz.Answer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public interface AnswerDao extends JpaRepository<Answer, String> {
    @Override
    Optional<Answer> findById(String id);
}
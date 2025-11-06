package cc.servermarca.quizzapp.dao.quiz;

import cc.servermarca.quizzapp.model.quiz.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Optional;

@Component
public interface QuestionDao extends JpaRepository<Question, String> {
    @Override
    Optional<Question> findById(String id);

    @Query(value = "SELECT * FROM question WHERE quiz_id = :quizId", nativeQuery = true)
    Optional<ArrayList<Question>> findAllByQuizId(@Param("quizId") String id);
}
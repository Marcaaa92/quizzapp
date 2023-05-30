package f2.quizzapp.dao.quiz;

import f2.quizzapp.model.quiz.Quiz;
import jakarta.persistence.Tuple;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public interface QuizDao extends JpaRepository<Quiz, String> {
    @Override
    Optional<Quiz> findById(String id);

    @Query(value = "SELECT quiz.id, quiz.title FROM quiz JOIN user ON user.id=quiz.user_id WHERE user.token = :token", nativeQuery = true)
    Optional<List<Tuple>> findByUser(String token);
}
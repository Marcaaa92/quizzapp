package f2.quizzapp.dao.quiz;

import f2.quizzapp.model.quiz.QuizResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public interface QuizResultDao extends JpaRepository<QuizResult, String> {
    @Query(value = "SELECT * FROM quiz_result WHERE user_id = :userId", nativeQuery = true)
    Optional<QuizResult> findByUser(String userId);

    @Query(value = "SELECT * FROM quiz_result WHERE user_id = :userId && quiz_id = :quizId", nativeQuery = true)
    Optional<QuizResult> checkIfCompleted(String userId, String quizId);

    @Query(value = "SELECT * FROM quiz_result WHERE quiz_id = :quizId", nativeQuery = true)
    Optional<List<QuizResult>> findByQuizId(String quizId);

    @Query(value = "SELECT * FROM quiz_result WHERE quiz_id = :quizId AND user_Id = :userId", nativeQuery = true)
    Optional<List<QuizResult>> findByQuizIdAndUser(String quizId, String userId);
}

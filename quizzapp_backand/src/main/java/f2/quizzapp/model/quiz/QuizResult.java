package f2.quizzapp.model.quiz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import f2.quizzapp.model.user.User;
import jakarta.persistence.*;

@Entity(name = "quiz_result")
public class QuizResult {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    @Column(name = "correct_question")
    Double correctQuestions;
    @Column(name = "correction", length = 65535)
    String correction;
    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    User user;
    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "quiz_id", referencedColumnName = "id")
    Quiz quiz;

    public QuizResult(Double correctQuestions, String correction) {
        this.correctQuestions = correctQuestions;
        this.correction = correction;
    }

    public QuizResult() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Double getCorrectQuestions() {
        return correctQuestions;
    }

    public void setCorrectQuestions(Double correctQuestions) {
        this.correctQuestions = correctQuestions;
    }

    public String getCorrection() {
        return correction;
    }

    public void setCorrection(String correction) {
        this.correction = correction;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public String toString() {
        return String.format("""
                {
                    "correctQuestions":"%s",
                    "correction":%s,
                    "user":%s
                }
                """, correctQuestions, correction, user.toStringRet());
    }
}

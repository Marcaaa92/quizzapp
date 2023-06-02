package f2.quizzapp.model.quiz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import f2.quizzapp.model.user.User;
import jakarta.persistence.*;

import java.util.List;

@Entity(name = "quiz")
public class Quiz {
    @Id
    String id;

    @Column(name = "title", length = 128)
    String title;

    @Column(name = "description")
    String description;
    @Column(name = "published", columnDefinition = "boolean default false")
    Boolean published;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    User user;
    @JsonIgnore
    @OneToMany(mappedBy = "quiz")
    private List<Question> questions;
    @JsonIgnore
    @OneToMany(mappedBy = "quiz")
    private List<QuizResult> quizResults;

    @SuppressWarnings("unused")
    public Quiz(String id, String title, String description) {
        this.id = id;
        this.title = title;
        this.description = description;
    }

    @SuppressWarnings("unused")
    public Quiz() {
    }

    @SuppressWarnings("unused")
    public User getUser() {
        return user;
    }

    @SuppressWarnings("unused")
    public void setUser(User user) {
        this.user = user;
    }

    @SuppressWarnings("unused")
    public List<Question> getQuestions() {
        return questions;
    }

    @SuppressWarnings("unused")
    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public Boolean getPublished() {
        return published;
    }

    public void setPublished(Boolean published) {
        this.published = published;
    }

    @SuppressWarnings("unused")
    public String getId() {
        return id;
    }

    @SuppressWarnings("unused")
    public void setId(String id) {
        this.id = id;
    }

    @SuppressWarnings("unused")
    public String getTitle() {
        return title;
    }

    @SuppressWarnings("unused")
    public void setTitle(String title) {
        this.title = title;
    }

    @SuppressWarnings("unused")
    public String getDescription() {
        return description;
    }

    @SuppressWarnings("unused")
    public void setDescription(String description) {
        this.description = description;
    }

    @SuppressWarnings("unused")
    public List<QuizResult> getQuizResults() {
        return quizResults;
    }

    @SuppressWarnings("unused")
    public void setQuizResults(List<QuizResult> quizResults) {
        this.quizResults = quizResults;
    }

    @Override
    public String toString() {
        return String.format("""
                {
                    "title":"%s",
                    "description":"%s",
                    "questions":%s,
                    "published":"%s"
                }
                """, title, description, questions, published);
    }
}

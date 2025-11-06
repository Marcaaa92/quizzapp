package cc.servermarca.quizzapp.model.quiz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

import java.util.List;

@Entity(name = "question")
public class Question {
    @Id
    String id;
    @Column(name = "title", length = 255)
    String title;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "quiz_id", referencedColumnName = "id")
    Quiz quiz;
    @OneToMany(mappedBy = "question")
    private List<Answer> answers;

    @SuppressWarnings("unused")
    public Question(String id, String title) {
        this.id = id;
        this.title = title;
    }

    @SuppressWarnings("unused")
    public Question() {
    }

    @SuppressWarnings("unused")
    public Quiz getQuiz() {
        return quiz;
    }

    @SuppressWarnings("unused")
    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    @SuppressWarnings("unused")
    public List<Answer> getAnswers() {
        return answers;
    }

    @SuppressWarnings("unused")
    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
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
    @Override
    public String toString() {
        return String.format("""
                {
                    "title":"%s",
                    "answers":%s
                }
                """, title, answers);
    }
}

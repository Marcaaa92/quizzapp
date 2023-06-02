package f2.quizzapp.model.quiz;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;

@Entity(name = "answer")
public class Answer {
    @Id
    String id;
    @Column(name = "text", length = 128)
    String text;
    Boolean correct;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "question_id", referencedColumnName = "id")
    Question question;

    @SuppressWarnings("unused")
    public Answer(String id, String text, Boolean correct) {
        this.id = id;
        this.text = text;
        this.correct = correct;
    }

    @SuppressWarnings("unused")
    public Answer() {
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
    public String toString() {
        return String.format("""
                {
                    "text":"%s",
                    "correct":%s
                }
                """, text, correct);
    }

    @SuppressWarnings("unused")
    public String getText() {
        return text;
    }

    @SuppressWarnings("unused")
    public void setText(String text) {
        this.text = text;
    }

    @SuppressWarnings("unused")
    public Boolean getCorrect() {
        return correct;
    }

    @SuppressWarnings("unused")
    public void setCorrect(Boolean correct) {
        this.correct = correct;
    }

    @SuppressWarnings("unused")
    public Question getQuestion() {
        return question;
    }

    @SuppressWarnings("unused")
    public void setQuestion(Question question) {
        this.question = question;
    }
}

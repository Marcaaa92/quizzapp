package f2.quizzapp.model.user;

import com.fasterxml.jackson.annotation.JsonIgnore;
import f2.quizzapp.model.quiz.Quiz;
import f2.quizzapp.model.quiz.QuizResult;
import jakarta.persistence.*;
import org.springframework.lang.NonNull;

import java.util.List;

@Entity(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    @Column(name = "name", length = 128)
    String name;

    @Column(name = "email", length = 128)
    String email;

    @Column(name = "password", length = 128)
    String password;

    @JsonIgnore
    @Column(name = "token", length = 1024)
    String token;
    @JsonIgnore
    @Column(name = "active")
    boolean active = true;

    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<QuizResult> quizResults;

    @SuppressWarnings("unused")
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Quiz> quizzes;

    @SuppressWarnings("unused")
    public User() {
    }

    @SuppressWarnings("unused")
    public User(@NonNull String name, @NonNull String email, @NonNull String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    @SuppressWarnings("unused")
    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    @SuppressWarnings("unused")
    public boolean isActive() {
        return active;
    }

    @SuppressWarnings("unused")
    public void setActive(boolean active) {
        this.active = active;
    }

    @SuppressWarnings("unused")
    @NonNull
    public String getToken() {
        return token;
    }

    @SuppressWarnings("unused")
    public void setToken(@NonNull String token) {
        this.token = token;
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
    @NonNull
    public String getName() {
        return name;
    }

    @SuppressWarnings("unused")
    public void setName(@NonNull String name) {
        this.name = name;
    }

    @SuppressWarnings("unused")
    @NonNull
    public String getEmail() {
        return email;
    }

    @SuppressWarnings("unused")
    public void setEmail(@NonNull String email) {
        this.email = email;
    }

    @SuppressWarnings("unused")
    @NonNull
    public String getPassword() {
        return password;
    }

    @SuppressWarnings("unused")
    public void setPassword(@NonNull String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return String.format("""
                {
                    "id":%s,
                    "name":"%s",
                    "email":"%s",
                    "password":"%s",
                    "active":%s
                }
                """, id, name, email, password, active);
    }

    public String toStringRet() {
        return String.format("""
                {
                    "name":"%s",
                    "email":"%s"
                }
                """, name, email);
    }
}

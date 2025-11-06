package cc.servermarca.quizzapp.dao.user;

import cc.servermarca.quizzapp.model.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public interface UserDao extends JpaRepository<User, String> {
    @Override
    Optional<User> findById(String id);

    @Query(value = "SELECT * FROM user WHERE email = :Email AND active=true", nativeQuery = true)
    Optional<User> findByEmail(String Email);

    @Query(value = "SELECT * FROM user WHERE token = :Token AND active=true", nativeQuery = true)
    Optional<User> findByToken(String Token);
}

package cc.servermarca.quizzapp.service.user;

import cc.servermarca.quizzapp.dao.user.UserDao;
import cc.servermarca.quizzapp.exception.user.UserAlreadyExistException;
import cc.servermarca.quizzapp.exception.user.UserNotFoundException;
import cc.servermarca.quizzapp.model.user.User;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public User findById(String id) {
        Optional<User> user = userDao.findById(id);
        if (user.isPresent())
            return user.get();
        else
            throw new UserNotFoundException("The user does not exist");
    }

    public User findByEmail(String email) {
        Optional<User> user = userDao.findByEmail(email);
        if (user.isPresent() && user.get().isActive())
            return user.get();
        else
            throw new UserNotFoundException("The mail does not exist");
    }

    public User findByToken(String token) {
        Optional<User> user = userDao.findByToken(token);
        if (user.isPresent())
            return user.get();
        else
            throw new UserNotFoundException("The token does not exist");
    }

    public void saveUser(User user) {
        if (userDao.findByEmail(user.getEmail()).isPresent()) {
            throw new UserAlreadyExistException("The user is already exist");
        }
        userDao.save(user);
    }

    public void editUser(User user) {
        if (userDao.findById(user.getId()).isPresent()) {
            userDao.save(user);
        } else {
            throw new UserNotFoundException("L'utente non è stato trovato");
        }
    }

    public boolean existByEmail(String email) {
        return userDao.findByEmail(email).isPresent();
    }

    public boolean existByToken(String token) {
        return userDao.findByToken(token).isPresent();
    }

}

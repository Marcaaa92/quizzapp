package cc.servermarca.quizzapp.DTOMapper.UserDTOMapper;

import cc.servermarca.quizzapp.DTO.userDTO.InsertUserDTO;
import cc.servermarca.quizzapp.model.user.User;
import org.springframework.stereotype.Service;

import java.util.function.Function;

@Service
public class InsertUserDTOMapper implements Function<InsertUserDTO, User> {
    @Override
    public User apply(InsertUserDTO user) {
        return new User(
                user.name(),
                user.email(),
                user.password());
    }
}

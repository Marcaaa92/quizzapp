package f2.quizzapp.DTOMapper.UserDTOMapper;

import f2.quizzapp.DTO.userDTO.InsertUserDTO;
import f2.quizzapp.model.user.User;
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

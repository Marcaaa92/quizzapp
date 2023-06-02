package f2.quizzapp.DTO.userDTO;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record TokenDTO(@NotNull(message = "Token is required.")
                       @Size(min = 2, message = "The token must be at least 2 characters")
                       String token) {
}

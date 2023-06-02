package f2.quizzapp.DTO.userDTO;

import jakarta.validation.constraints.NotNull;

public record LoginDTO(@NotNull(message = "Email is required.")
                       String email,
                       @NotNull(message = "Password is required.")
                       String password,
                       @NotNull(message = "recaptcha is required.")
                       String recaptcha
) {
}

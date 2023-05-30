package f2.quizzapp.DTO.userDTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record ChangeEmailDTO(@NotNull(message = "Email is required.")
                             String email,
                             @NotNull(message = "newEmail is required.")
                             @Size(max = 128, message = "The newEmail must be 128 characters maximum")
                             @Email(message = "The newEmail field must be filled in and must contain a valid email")
                             String newEmail,
                             @NotNull(message = "password is required.")
                             String password
) {
}

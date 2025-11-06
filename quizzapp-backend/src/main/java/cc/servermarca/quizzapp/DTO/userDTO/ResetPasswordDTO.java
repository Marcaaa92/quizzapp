package cc.servermarca.quizzapp.DTO.userDTO;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record ResetPasswordDTO(@NotNull(message = "Email is required.")
                               @Size(min = 2, message = "The email must be at least 2 characters")
                               String email) {
}

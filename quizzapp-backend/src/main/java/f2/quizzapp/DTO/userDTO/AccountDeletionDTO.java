package f2.quizzapp.DTO.userDTO;

import jakarta.validation.constraints.NotNull;

public record AccountDeletionDTO(@NotNull(message = "Email is required.")
                                 String email,
                                 @NotNull(message = "Password is required.")
                                 String password
) {
}

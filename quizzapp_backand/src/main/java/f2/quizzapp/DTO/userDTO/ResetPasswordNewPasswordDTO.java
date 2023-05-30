package f2.quizzapp.DTO.userDTO;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record ResetPasswordNewPasswordDTO(@NotNull(message = "Token is required.")
                                          String token,
                                          @NotNull(message = "Password is required.")
                                          @Size(min = 8, max = 128, message = "The password must be at least 8 characters and 128 characters")
                                          @Pattern(regexp = "^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!#$%&?\\.\"]).*$", message = "The password field must be completed and must be at least 8 characters long and contain at least an uppercase and lowercase letter, a number and special characters such as ! # $ % & ? .")
                                          String password
) {
}

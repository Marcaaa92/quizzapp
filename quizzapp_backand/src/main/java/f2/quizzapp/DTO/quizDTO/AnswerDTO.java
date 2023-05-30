package f2.quizzapp.DTO.quizDTO;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record AnswerDTO(
        @NotNull(message = "Text is required.")
        @Size(min = 2, max = 128, message = "The Text must be 128 characters maximum")
        String text,
        @NotNull(message = "correct is required.")
        boolean correct
) {
}

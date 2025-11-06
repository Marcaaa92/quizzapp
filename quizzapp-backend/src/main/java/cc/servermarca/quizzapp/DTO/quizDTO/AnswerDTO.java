package cc.servermarca.quizzapp.DTO.quizDTO;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public record AnswerDTO(
        @NotNull(message = "Text is required.")
        @Size(min = 1, max = 255, message = "The Text must be 128 characters maximum")
        String text,
        @NotNull(message = "correct is required.")
        boolean correct
) {
}

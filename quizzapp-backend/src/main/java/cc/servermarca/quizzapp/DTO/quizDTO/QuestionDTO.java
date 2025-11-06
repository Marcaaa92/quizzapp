package cc.servermarca.quizzapp.DTO.quizDTO;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

public record QuestionDTO(
        @NotNull(message = "Title is required.")
        @Size(min = 1, max = 255, message = "The title must be 128 characters maximum")
        String title,
        @Valid
        @NotNull(message = "Answers is required.")
        @Size(min = 1, message = "Answers is required.")
        List<AnswerDTO> answers
) {
}

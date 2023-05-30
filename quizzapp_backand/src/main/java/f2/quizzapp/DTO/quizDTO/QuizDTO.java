package f2.quizzapp.DTO.quizDTO;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

import java.util.List;

public record QuizDTO(@NotNull(message = "token is required.")
                      String token,
                      @NotNull(message = "Title is required.")
                      @Size(min = 2, max = 128, message = "The title must be 128 characters maximum")
                      String title,
                      @NotNull(message = "Description is required.")
                      @Size(min = 2, max = 255, message = "The description must be 128 characters maximum")
                      String description,
                      @Valid
                      @NotNull(message = "Questions is required.")
                      @Size(min = 1, message = "Questions is required.")
                      List<QuestionDTO> questions
) {
}

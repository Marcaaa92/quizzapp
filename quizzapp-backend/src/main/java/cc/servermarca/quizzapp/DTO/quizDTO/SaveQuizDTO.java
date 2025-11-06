package cc.servermarca.quizzapp.DTO.quizDTO;

import jakarta.validation.constraints.NotNull;

public record SaveQuizDTO(@NotNull(message = "token is required.")
                          String token,
                          @NotNull(message = "correctQuestions is required.")
                          String correctQuestions,
                          @NotNull(message = "quizCorrection is required.")
                          String quizCorrection,
                          @NotNull(message = "quizId is required.")
                          String quizId
) {
}

package f2.quizzapp.DTOMapper.quizDTOMapper;

import f2.quizzapp.DTO.quizDTO.QuizDTO;
import f2.quizzapp.model.quiz.Quiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.function.Function;

@Service
public class QuizDTOMapper implements Function<QuizDTO, Quiz> {
    @Autowired
    QuestionDTOMapper questionDTOMapper;

    @Override
    public Quiz apply(QuizDTO quizRequestDTO) {

        return new Quiz(UUID.randomUUID().toString(), quizRequestDTO.title(), quizRequestDTO.description());
    }
}

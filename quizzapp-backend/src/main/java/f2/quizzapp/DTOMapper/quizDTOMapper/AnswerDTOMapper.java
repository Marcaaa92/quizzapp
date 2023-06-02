package f2.quizzapp.DTOMapper.quizDTOMapper;

import f2.quizzapp.DTO.quizDTO.AnswerDTO;
import f2.quizzapp.model.quiz.Answer;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.function.Function;

@Service
public class AnswerDTOMapper implements Function<AnswerDTO, Answer> {

    @Override
    public Answer apply(AnswerDTO answerDTO) {
        return new Answer(UUID.randomUUID().toString(), answerDTO.text(), answerDTO.correct());
    }
}

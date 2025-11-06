package cc.servermarca.quizzapp.DTOMapper.quizDTOMapper;

import cc.servermarca.quizzapp.DTO.quizDTO.AnswerDTO;
import cc.servermarca.quizzapp.model.quiz.Answer;
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

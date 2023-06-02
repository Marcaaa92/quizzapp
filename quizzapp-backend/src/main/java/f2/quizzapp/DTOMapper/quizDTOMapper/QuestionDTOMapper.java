package f2.quizzapp.DTOMapper.quizDTOMapper;

import f2.quizzapp.DTO.quizDTO.QuestionDTO;
import f2.quizzapp.model.quiz.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.function.Function;

@Service
public class QuestionDTOMapper implements Function<QuestionDTO, Question> {
    @Autowired
    AnswerDTOMapper answerDTOMapper;

    @Override
    public Question apply(QuestionDTO questionDTO) {

        return new Question(UUID.randomUUID().toString(), questionDTO.title());
    }
}

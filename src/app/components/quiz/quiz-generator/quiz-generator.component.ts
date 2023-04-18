import { Component } from '@angular/core';
import { Question } from '../../../models/Question';
import { Answer } from '../../../models/Answer';
import { Quiz } from '../../../models/Quiz';
import { ApiQuizService } from '../../../services/api/api-quiz.service';

@Component({
  selector: 'app-quiz-generator',
  templateUrl: './quiz-generator.component.html',
  styleUrls: ['./quiz-generator.component.css'],
})
export class QuizGeneratorComponent {
  title = 'app';
  quiz: Quiz = new Quiz('', '');
  valid: boolean = false;
  feedback: string = '';
  constructor(private service: ApiQuizService) {
    this.addQuestion();
  }

  formValidator(text: string) {
    if (text.length == 0 || text == 'w') {
      console.log('p');
      let v = true;
      setTimeout(() => {
        if (this.quiz.title != '' && this.quiz.description != '') {
          for (let i = 0; i < this.quiz.questions!.length; i++) {
            if (this.quiz.questions![i].title == '') {
              v = false;
              break;
            }
            let v2 = 0;
            for (let j = 0; j < this.quiz.questions![i].answers!.length; j++) {
              if (this.quiz.questions![i].answers![j].text == '') {
                v = false;
                break;
              }
              if (this.quiz.questions![i].answers![j].correct == true) {
                v2++;
              }
            }
            if (v2 == 0) {
              v = false;
              break;
            }
          }
        } else {
          v = false;
        }
        this.valid = v;
      }, 10);
    }
  }

  addQuestion() {
    this.quiz.addQuestion(new Question(this.quiz.questions?.length! + 1, ''));
    this.addAnswer(this.quiz.questions?.length!);
    this.addAnswer(this.quiz.questions?.length!);
    this.valid = false;
  }

  addAnswer(id: number) {
    this.quiz.questions![id - 1].addAnswer(
      new Answer(this.quiz.questions![id - 1].answers!.length + 1, '', false)
    );
    this.valid = false;
  }
  resetForm(){
    this.quiz=new Quiz("","")
    this.addQuestion()
  }
  test() {
    var json = sessionStorage.getItem('user');
    if (json) {
      var dataSessionStorage = JSON.parse(json);
      if (dataSessionStorage) {
        var token = dataSessionStorage['token'];
        this.quiz.token = token;
        this.service.newQuiz(this.quiz).subscribe((response) => {
          if (response.statusCode == 200) {
            this.feedback = 'quiz aggiunto con successo!';
            this.resetForm()
          } else {
            this.feedback = response.msg;
          }
        });
      }
    } else {
      this.feedback = "non sei autenticato"
    }
  }
}

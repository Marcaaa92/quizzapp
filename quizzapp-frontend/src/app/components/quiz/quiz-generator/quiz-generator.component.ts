import { Component, ElementRef, ViewChild } from '@angular/core';
import { Question } from '../../../models/Question';
import { Answer } from '../../../models/Answer';
import { Quiz } from '../../../models/Quiz';
import { ApiQuizService } from '../../../services/api/api-quiz.service';
import { Environment } from 'src/environments/environment';

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
  canView: boolean = false;
  quizLink!: string;
  @ViewChild('submit') submit!: ElementRef;

  constructor(private service: ApiQuizService) {
    var token = Environment.getToken();
    if (token) {
      this.canView = true;
      this.addQuestion();
    }
    else {
      this.feedback = "non sei loggato!";
    }
  }

  formValidator(text: string) {
    if (text.length == 0 || text == 'w') {
      console.log('p');
      let v = true;
      setTimeout(() => {
        if (this.quiz.title != '' && this.quiz.description != '') {
          if (this.quiz.questions!.length > 0) {
            for (let i = 0; i < this.quiz.questions!.length; i++) {
              if (this.quiz.questions![i].title == '') {
                v = false;
                break;
              }
              let v2 = 0;
              if (this.quiz.questions![i].answers!.length > 1) {
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
              else {
                v = false;
              }
            }
          } else {
            v = false;
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
    setTimeout(() => { window.scrollTo(0, document.body.scrollHeight); }, 10)
  }

  addAnswer(id: number) {
    this.quiz.questions![id - 1].addAnswer(
      new Answer(this.quiz.questions![id - 1].answers!.length + 1, '', false)
    );
    this.valid = false;
    setTimeout(() => { window.scrollTo(0, document.body.scrollHeight); }, 10)
  }
  deleteAnswer(i: number, answer: Answer) {
    this.quiz.questions![i - 1].deleteAnswer(answer);
    this.valid=false;
  }
  deleteQuestion(question: Question) {
    this.quiz.deleteQuestion(question);
    this.valid=false;
  }
  resetForm() {
    this.quiz = new Quiz("", "")
    this.addQuestion()
  }
  generate() {
    this.submit.nativeElement.disabled = true;
    this.canView = false;
    var token = Environment.getToken();
    if (token) {
      this.quiz.token = token as unknown as string;
      this.service.newQuiz(this.quiz).subscribe((response) => {
        if (response.statusCode == 200) {
          this.feedback = 'quiz aggiunto con successo!';
          this.quizLink = Environment.siteUrl + '/quiz-viewer/' + response.msg
          this.resetForm()
        } else {
          this.canView = true;
          this.feedback = response.msg;
        }
      });
    } else {
      this.feedback = "non sei autenticato"
    }
  }
}
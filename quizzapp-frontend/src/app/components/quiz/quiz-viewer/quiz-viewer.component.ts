import { Component, ElementRef, ViewChild } from '@angular/core';
import { ActivatedRoute} from '@angular/router';
import { Quiz } from 'src/app/models/Quiz';
import { ApiQuizService } from 'src/app/services/api/api-quiz.service';
import { Environment } from 'src/environments/environment';

@Component({
  selector: 'app-quiz-viewer',
  templateUrl: './quiz-viewer.component.html',
  styleUrls: ['./quiz-viewer.component.css']
})
export class QuizViewerComponent {
  quizId: string | null;
  quiz!: Quiz;
  quizCorrect!: Quiz;
  allCompiled: boolean = false;
  feedback: string = '';
  answerCorrect: number = 0;
  canView: boolean = false;
  @ViewChild('submit') submit!: ElementRef;
  index:number = 0;
  arrowLeftStyle:boolean=false
  arrowRightStyle:boolean=false

  constructor(private route: ActivatedRoute, private service: ApiQuizService) {
    this.quizId = this.route.snapshot.paramMap.get('quizId');
  }

  ngOnInit() {
    var token = Environment.getToken();
    if (token) {
      this.service.checkQuizIfCompleted(token, this.quizId).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
            this.canView = true;
            this.service.getQuizById(token, this.quizId).subscribe({
              next: (response) => {
                if (response.statusCode == 200) {
                  this.quiz = structuredClone(response.msg.quiz as Quiz)
                  this.quizCorrect = structuredClone(response.msg.quiz as Quiz)
                  for (let i = 0; i < this.quiz.questions!.length; i++) {
                    for (let j = 0; j < this.quiz.questions![i].answers!.length; j++) {
                      this.quiz.questions![i].answers![j].correct = false;
                    }
                  }
                  if(this.quiz.questions!.length>1){this.arrowRightStyle=true}
                }
              },
              error: (error) => {
                if (error.error.statusCode == 404) {
                  this.feedback = "Il quiz non esiste"
                  this.canView = false;
                }
                if (error.error.statusCode == 401) {
                  this.feedback = "Non puoi vedere questo quiz"
                  this.canView = false;
                }
              },
            });
          }
        },
        error: (error) => {
          if (error.error.statusCode == 404) {
            this.feedback = "Il quiz non esiste"
            this.canView = false;
          }
          if (error.error.statusCode == 401) {
            this.feedback = "Non puoi vedere questo quiz"
            this.canView = false;
          }
          if (error.error.statusCode == 400) {
            this.feedback = "Hai già compilato il quiz"
            this.canView = false;
          }
        },
      });
    } else {
      this.feedback = "non sei autenticato"
    }
  }
  formValidator(text: string) {
    if (text.length == 0 || text == 'w') {
      console.log('p');
      let v = true;
      setTimeout(() => {
        for (let i = 0; i < this.quiz.questions!.length; i++) {
          let v2 = 0;
          for (let j = 0; j < this.quiz.questions![i].answers!.length; j++) {
            if (this.quiz.questions![i].answers![j].correct == true) {
              v2++;
            }
          }
          if (v2 == 0) {
            v = false;
            break;
          }
        }
        this.allCompiled = v;
      }, 10);
    }
  }
  submitQuiz() {
    this.submit.nativeElement.disabled=true;
    var token = Environment.getToken();
    if (token) {
      this.canView = false
      let questions: any[] = new Array();
      for (let i = 0; i < this.quiz.questions!.length; i++) {
        let userSelectedCorrect = 0;
        let rightAnswers = 0;
        let userSelected = 0;
        let answers: any[] = new Array();
        for (let j = 0; j < this.quiz.questions![i].answers!.length; j++) {
          let htmlReference = i + "-" + j;
          let answerStatus = "null"
          if (this.quizCorrect.questions![i].answers![j].correct == true) {
            answerStatus = "rightAnswers"
            rightAnswers++;
          }
          if (this.quiz.questions![i].answers![j].correct == true) {
            answerStatus = "userSelectedWrong"
            userSelected++;
          }
          if (this.quiz.questions![i].answers![j].correct == true && this.quizCorrect.questions![i].answers![j].correct == true) {
            answerStatus = "userSelectedCorrect"
            userSelectedCorrect++;
          }
          let answer = <JSON><unknown>{
            "htmlReference": htmlReference,
            "answerStatus": answerStatus,
          }
          answers.push(answer);
        }
        let question = <JSON><unknown>{
          "answers": answers,
        }
        questions.push(question)
        if (userSelected == rightAnswers) {
          if (userSelectedCorrect == rightAnswers) {
            this.answerCorrect++;
          }
        }
      }
      let quizCorrection = <JSON><unknown>{
        "questions": questions
      }
      let quizResult = <JSON><unknown>{
        "correctQuestions": this.answerCorrect,
        "quizId": this.quizId,
        "quizCorrection": JSON.stringify(quizCorrection),
        "token": token
      }
      this.service.saveQuiz(quizResult).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
            this.feedback = "Hai risposto correttamente a " + this.answerCorrect + " risposte";
            this.resetForm;
            this.answerCorrect = 0;
            this.canView = false
          }
        },
        error: (error) => {
          if (error.error.statusCode == 401) {
            this.canView = false;
            this.feedback = "Non sei loggato";
          }
          if (error.error.statusCode == 400) {
            this.feedback = "Quiz già compilato";
          }
        },
      });
    } else {
      this.feedback = "non sei autenticato"
    }
  }
  resetForm() {
    this.quiz = new Quiz("", "")
  }
  error(error: any) {

  }
  setCorrect(j:number){
    this.formValidator("w")
    if(this.quiz.questions![this.index].answers![j].correct)
    this.quiz.questions![this.index].answers![j].correct=false;
    else
    this.quiz.questions![this.index].answers![j].correct=true;
  }
  next(){
    if(this.index==this.quiz.questions!.length-1){
    }
    else{
      this.index++;
      if(this.index==this.quiz.questions!.length-1)
      this.arrowRightStyle=false
      else
      this.arrowRightStyle=true
      if(this.index==0)
      this.arrowLeftStyle=false
      else
      this.arrowLeftStyle=true
    }
    console.log(this.index)

  }
  previous(){
    if(this.index==0){

    }
    else{
      this.index--;
      if(this.index==this.quiz.questions!.length-1)
      this.arrowRightStyle=false
      else
      this.arrowRightStyle=true
      if(this.index==0)
      this.arrowLeftStyle=false
      else
      this.arrowLeftStyle=true
    }
    console.log(this.index)
  }
}
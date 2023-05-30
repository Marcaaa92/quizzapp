import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApiQuizService } from 'src/app/services/api/api-quiz.service';
import { Environment } from 'src/environments/environment';

@Component({
  selector: 'app-quiz-results-viewer',
  templateUrl: './quiz-results-viewer.component.html',
  styleUrls: ['./quiz-results-viewer.component.css']
})
export class QuizResultsViewerComponent {

  quizId: string | null;
  feedback: string = '';
  canView: boolean = false;
  usersResults: any;
  index: number = 0;
  arrowLeftStyle:string="hidden";
  arrowRightStyle:string="visible";
  constructor(private route: ActivatedRoute, private service: ApiQuizService) {
    this.quizId = this.route.snapshot.paramMap.get('quizId');
  }
  ngOnInit() { 
    var token = Environment.getToken();
    if (token) {
      this.service.getQuizResults(token, this.quizId).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
            this.usersResults = response.msg;
            if(this.usersResults['results'].length==1){
              this.arrowRightStyle="hidden"
            }
            console.log(this.usersResults['quiz']['published'])
            console.log(this.usersResults)
          }
        },
        error: (error) => {
          if (error.error.statusCode == 404) {
            this.feedback = "Il quiz non esiste"
            this.canView = false;
          }
          if (error.error.statusCode == 401) {
            this.feedback = "Non puoi vedere questa correzione del quiz"
            this.canView = false;
          }
        },
      });
    } else {
      this.feedback = "non sei autenticato"
    }
  }
  next(){
    if(this.index==this.usersResults['results'].length-1){
    }
    else{
      this.index++;
      if(this.index==this.usersResults['results'].length-1)
      this.arrowRightStyle="hidden"
      else
      this.arrowRightStyle="visible"
      if(this.index==0)
      this.arrowLeftStyle="hidden"
      else
      this.arrowLeftStyle="visible"
    }
    console.log(this.index)

  }
  previous(){
    if(this.index==0){

    }
    else{
      this.index--;
      if(this.index==this.usersResults['results'].length-1)
      this.arrowRightStyle="hidden"
      else
      this.arrowRightStyle="visible"
      if(this.index==0)
      this.arrowLeftStyle="hidden"
      else
      this.arrowLeftStyle="visible"
    }
    console.log(this.index)
  }
  showQuizCorrection(index: number) {
    this.index = index
  }
  getUserEmail(){
    return this.usersResults['results'][this.index]['user']['email']
  }
  getUserName(){
    return this.usersResults['results'][this.index]['user']['name']
  }
  getUserRightAnswers(){
    return Math.round(this.usersResults['results'][this.index]['correctQuestions'])
  }
  getTotalQuestions(){
    return this.usersResults['quiz'].questions.length
  }
  getRating(){
    return Math.round(this.usersResults['results'][this.index]['correctQuestions']/this.usersResults['quiz'].questions.length*100) 
  }
  publish(){
    var token = Environment.getToken();
    if (token) {
      this.service.publishQuiz(token, this.quizId).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
          }
        },
        error: (error) => {
          if (error.error.statusCode == 404) {
            this.feedback = "Il quiz non esiste"
            this.canView = false;
          }
          if (error.error.statusCode == 401) {
            this.feedback = "Non puoi pubblicare questo quiz"
            this.canView = false;
          }
        },
      });
    } else {
      this.feedback = "non sei autenticato"
    }
  }
}

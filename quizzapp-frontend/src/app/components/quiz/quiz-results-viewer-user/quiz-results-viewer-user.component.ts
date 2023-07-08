import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApiQuizService } from 'src/app/services/api/api-quiz.service';
import { Environment } from 'src/environments/environment';

@Component({
  selector: 'app-quiz-results-viewer-user',
  templateUrl: './quiz-results-viewer-user.component.html',
  styleUrls: ['./quiz-results-viewer-user.component.css']
})
export class QuizResultsViewerUserComponent {

  quizId: string | null;
  feedback: string = '';
  canView: boolean = false;
  usersResults: any;
  index: number = 0;
  constructor(private route: ActivatedRoute, private service: ApiQuizService) {
    this.quizId = this.route.snapshot.paramMap.get('quizId');
  }
  ngOnInit() { 
    var token = Environment.getToken();
    if (token) {
      this.service.getQuizResultsByUser(token, this.quizId).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
            this.usersResults = response.msg;
            console.log(this.usersResults)
          }
        },
        error: (error) => {
          if (error.error.statusCode == 401) {
            this.feedback = "Il quiz non esiste o correzione non ancora pubblicata"
            this.canView = false;
          }
        },
      });
    } else {
      this.feedback = "non sei autenticato"
    }
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
}

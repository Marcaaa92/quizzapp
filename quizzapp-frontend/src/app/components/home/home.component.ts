import { Component } from '@angular/core';
import { ApiQuizService } from 'src/app/services/api/api-quiz.service';
import { AuthService } from 'src/app/services/auth/auth-service.service';
import { Environment } from 'src/environments/environment';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  public quizzes!:any;
  constructor(public auth: AuthService, private service: ApiQuizService){

    var token = Environment.getToken();
    if (token) {
      this.service.getAllQuizzes(token).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
            this.quizzes = response.msg;
          }
        },
        error: (error) => {
          console.log(error)
        },
      });
    }
    else{
      
    }
  }
  ngOnInit(){
    this.quizzes=undefined;
  }
}

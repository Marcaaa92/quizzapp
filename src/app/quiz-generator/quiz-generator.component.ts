import { Component, Input } from '@angular/core';
import { Form, FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { Question } from '../Models/Question';
import { Answer } from '../Models/Answer';
import { Quiz } from '../Models/Quiz';
import { waitForAsync } from '@angular/core/testing';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-quiz-generator',
  templateUrl: './quiz-generator.component.html',
  styleUrls: ['./quiz-generator.component.css'],
})
export class QuizGeneratorComponent {
  title = 'app';
  quiz: Quiz = new Quiz("","")
  valid: boolean = false;
  feedback: string = ""
  constructor(private service: ApiService){
    this.addQuestion();
  }

  formValidator(text: string){
    if(text.length==0||text=="w"){
      console.log("p")
      let v = true; 
      setTimeout(()=>{
      if(this.quiz.title!=""&&this.quiz.description!=""){
        for(let i = 0; i<this.quiz.questions!.length; i++)
        {
          if(this.quiz.questions![i].title==""){
            v = false;
            break;
          }
          let v2 = 0; 
          for(let j = 0; j<this.quiz.questions![i].answers!.length; j++)
          {
            if(this.quiz.questions![i].answers![j].text==""){
              v = false;
              break;
            }
            if(this.quiz.questions![i].answers![j].correct==true){
              v2++;
            }
          }
          if(v2==0){
            v=false;
            break;
          }
        }
      }
      else{
        v=false;
      }
      this.valid=v;}, 10)
    }
  }

  addQuestion() {
    this.quiz.addQuestion(
      new Question(this.quiz.questions?.length!+1, '')
    );
    this.addAnswer(this.quiz.questions?.length!);
    this.addAnswer(this.quiz.questions?.length!);
    this.valid=false;
  }

  addAnswer(id: number) {
    this.quiz.questions![id-1].addAnswer(
      new Answer(this.quiz.questions![id-1].answers!.length+1, '', false)
    );
    this.valid=false;
  }
  test(form:any){
    console.log(JSON.stringify(this.quiz))
    console.log(form)
    this.service.sendDataDB(this.quiz).subscribe(response => {
    if(response.statusCode==200)
     this.feedback="quiz aggiunto con successo!"
     setTimeout(function(){
      window.location.reload();
      }, 5000);
    });
  }
}

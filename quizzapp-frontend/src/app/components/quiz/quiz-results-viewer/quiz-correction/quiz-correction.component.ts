import { Component, Input } from '@angular/core';
import { Quiz } from 'src/app/models/Quiz';

@Component({
  selector: 'app-quiz-correction',
  templateUrl: './quiz-correction.component.html',
  styleUrls: ['./quiz-correction.component.css']
})
export class QuizCorrectionComponent {
  @Input() quizCorrection!: any
  @Input() quiz!: Quiz;
  index:number = 0;
  arrowLeftStyle:boolean=false
  arrowRightStyle:boolean=false
  ngOnInit(){
    if(this.quiz.questions!.length>1){this.arrowRightStyle=true;}
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

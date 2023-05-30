import { Component, Input } from '@angular/core';
import { Quiz } from 'src/app/models/Quiz';

@Component({
  selector: 'app-quiz-correction-user',
  templateUrl: './quiz-correction-user.component.html',
  styleUrls: ['./quiz-correction-user.component.css']
})
export class QuizCorrectionUserComponent {
  @Input() quizCorrection!: any
  @Input() quiz!: Quiz;
}

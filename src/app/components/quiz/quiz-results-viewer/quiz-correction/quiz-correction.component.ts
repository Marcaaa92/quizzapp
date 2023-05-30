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
}

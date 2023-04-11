import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { QuizGeneratorComponent } from './quiz-generator/quiz-generator.component';

const routes: Routes = [
  { path: 'create', component: QuizGeneratorComponent },
  { path: "**", component: QuizGeneratorComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { 

}

import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NewQuizComponent } from './new-quiz/new-quiz.component';

const routes: Routes = [
  { path: 'create', component: NewQuizComponent },
  { path: "**", component: NewQuizComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { 

}

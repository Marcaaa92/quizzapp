import { NgModule, createComponent } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { QuizGeneratorComponent } from './components/quiz-generator/quiz-generator.component';
import { RegisterComponent } from './components/userAction/register/register.component';
import { RegisterConfirmComponent } from './components/userAction/register/confirm/confirm.component';
import { LoginComponent } from './components/userAction/login/login.component';
import { LogoutComponent } from './components/userAction/logout/logout.component';
import { LoginGuard } from './services/auth/guard/login.guard';
import { HomeGuard } from './services/auth/guard/home.guard';

const routes: Routes = [
  { path: 'create', component: QuizGeneratorComponent, canActivate:[LoginGuard]},
  { path: 'register', component: RegisterComponent, canActivate:[HomeGuard]},
  { path: 'register/:token', component: RegisterConfirmComponent , canActivate:[HomeGuard]},
  { path: 'login', component: LoginComponent, canActivate:[HomeGuard]},
  { path: 'logout', component: LogoutComponent, canActivate:[LoginGuard]},
  { path: "**", component: QuizGeneratorComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { 

}

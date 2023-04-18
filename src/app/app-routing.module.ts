import { NgModule} from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { QuizGeneratorComponent } from './components/quiz/quiz-generator/quiz-generator.component';
import { RegisterComponent } from './components/user-action/register/register.component';
import { RegisterConfirmComponent } from './components/user-action/register/confirm/confirm.component';
import { LoginComponent } from './components/user-action/login/login.component';
import { LogoutComponent } from './components/user-action/logout/logout.component';
import { LoginGuard } from './services/auth/guard/login.guard';
import { HomeGuard } from './services/auth/guard/home.guard';
import { ChangePasswordComponent } from './components/user-action/change-password/change-password.component';
import { ChangeEmailComponent } from './components/user-action/change-email/change-email.component';
import { ConfirmChangeEmailComponent } from './components/user-action/change-email/confirm/confirm.component';
import { ResetPasswordComponent } from './components/user-action/reset-password/reset-password.component';
import { ConfirmResetComponent } from './components/user-action/reset-password/confirm/confirm.component';
import { AccountDeletion } from './components/user-action/account-deletion/account-deleton.component';

const routes: Routes = [
  { path: 'register', component: RegisterComponent, canActivate:[HomeGuard]},
  { path: 'register/:token', component: RegisterConfirmComponent , canActivate:[HomeGuard]},
  { path: 'login', component: LoginComponent, canActivate:[HomeGuard]},
  { path: 'logout', component: LogoutComponent, canActivate:[HomeGuard]},
  { path: 'change-password', component: ChangePasswordComponent, canActivate:[LoginGuard]},
  { path: 'change-email', component: ChangeEmailComponent, canActivate:[LoginGuard]},
  { path: 'change-email/:token', component: ConfirmChangeEmailComponent,  canActivate:[HomeGuard]},
  { path: 'reset-password', component: ResetPasswordComponent, canActivate:[HomeGuard]},
  { path: 'account-deletion', component: AccountDeletion, canActivate:[LoginGuard]},
  { path: 'reset-password/:token', component: ConfirmResetComponent, canActivate:[HomeGuard]},
  { path: 'quiz-viewer', component: ConfirmResetComponent, canActivate:[LoginGuard]},
  { path: 'quiz-generator', component: QuizGeneratorComponent, canActivate:[LoginGuard]},
  { path: "**", component: QuizGeneratorComponent, canActivate:[LoginGuard]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { 

}

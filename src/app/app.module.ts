import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { QuizGeneratorComponent } from './components/quiz/quiz-generator/quiz-generator.component';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './components/user-action/register/register.component';
import { RegisterConfirmComponent } from './components/user-action/register/confirm/confirm.component';
import { LoginComponent } from './components/user-action/login/login.component';
import { LoginGuard } from './services/auth/guard/login.guard';
import { AuthService } from './services/auth/auth-service.service';
import { LogoutComponent } from './components/user-action/logout/logout.component';
import { HomeGuard } from './services/auth/guard/home.guard';
import { ChangePasswordComponent } from './components/user-action/change-password/change-password.component';
import { ChangeEmailComponent } from './components/user-action/change-email/change-email.component';
import { ConfirmChangeEmailComponent } from './components/user-action/change-email/confirm/confirm.component';
import { ResetPasswordComponent } from './components/user-action/reset-password/reset-password.component';
import { ConfirmResetComponent } from './components/user-action/reset-password/confirm/confirm.component';
import { QuizViewerComponent } from './components/quiz/quiz-viewer/quiz-viewer.component';
import { AccountDeletion } from './components/user-action/account-deletion/account-deleton.component';

@NgModule({
  declarations: [
    AppComponent,
    QuizGeneratorComponent,
    RegisterComponent,
    RegisterConfirmComponent,
    LoginComponent,
    LogoutComponent,
    ChangePasswordComponent,
    ChangeEmailComponent,
    ConfirmChangeEmailComponent,
    ResetPasswordComponent,
    ConfirmResetComponent,
    QuizViewerComponent,
    AccountDeletion
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [AuthService, LoginGuard, HomeGuard],
  bootstrap: [AppComponent]
})
export class AppModule { }

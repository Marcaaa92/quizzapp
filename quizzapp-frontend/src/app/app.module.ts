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
import { GoogleLoginProvider, SocialAuthServiceConfig, SocialLoginModule } from '@abacritt/angularx-social-login';
import {  GoogleSigninButtonModule } from '@abacritt/angularx-social-login';
import { QuizResultsViewerComponent } from './components/quiz/quiz-results-viewer/quiz-results-viewer.component';
import { QuizCorrectionComponent } from './components/quiz/quiz-results-viewer/quiz-correction/quiz-correction.component';
import { NotfoundComponent } from './components/notfound/notfound.component';
import { HomeComponent } from './components/home/home.component';
import { QuizResultsViewerUserComponent } from './components/quiz/quiz-results-viewer-user/quiz-results-viewer-user.component';
import { QuizCorrectionUserComponent } from './components/quiz/quiz-results-viewer-user/quiz-correction-user/quiz-correction-user.component';
import { RECAPTCHA_SETTINGS, RecaptchaFormsModule, RecaptchaModule, RecaptchaSettings } from 'ng-recaptcha';
import { Environment } from 'src/environments/environment';
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
    AccountDeletion,
    QuizResultsViewerComponent,
    QuizCorrectionComponent,
    QuizResultsViewerUserComponent,
    QuizCorrectionUserComponent,
    NotfoundComponent,
    HomeComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    SocialLoginModule,
    GoogleSigninButtonModule,
    RecaptchaModule,
    RecaptchaFormsModule,
  ],
  providers: [AuthService, LoginGuard, HomeGuard,
  {
    provide: 'SocialAuthServiceConfig',
    useValue: {
      autoLogin: false,
      providers: [
        {
          id: GoogleLoginProvider.PROVIDER_ID,
          provider: new GoogleLoginProvider(
            '320136785911-2r13rl75kjf8khrhecat4gbc3ts4v9la.apps.googleusercontent.com'
          )
        },
      ],
      onError: (err) => {
        console.error(err);
      }
    } as SocialAuthServiceConfig,
  },
  {
    provide: RECAPTCHA_SETTINGS,
    useValue: {
      siteKey: Environment.siteKey,
    } as RecaptchaSettings,
  },],
  bootstrap: [AppComponent]
})
export class AppModule { }

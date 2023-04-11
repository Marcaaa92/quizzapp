import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { QuizGeneratorComponent } from './components/quiz-generator/quiz-generator.component';
import { HttpClientModule } from '@angular/common/http';
import { RegisterComponent } from './components/userAction/register/register.component';
import { RegisterConfirmComponent } from './components/userAction/register/confirm/confirm.component';
import { LoginComponent } from './components/userAction/login/login.component';
import { LoginGuard } from './services/auth/guard/login.guard';
import { AuthService } from './services/auth/auth-service.service';
import { LogoutComponent } from './components/userAction/logout/logout.component';
import { HomeGuard } from './services/auth/guard/home.guard';

@NgModule({
  declarations: [
    AppComponent,
    QuizGeneratorComponent,
    RegisterComponent,
    RegisterConfirmComponent,
    LoginComponent,
    LogoutComponent
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

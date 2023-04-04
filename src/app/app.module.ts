import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NewQuizComponent } from './new-quiz/new-quiz.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import * as $ from 'jquery';
import { InputComponent } from './new-quiz/input/input.component';
import { QuizGeneratorComponent } from './quiz-generator/quiz-generator.component';

@NgModule({
  declarations: [
    AppComponent,
    NewQuizComponent,
    InputComponent,
    QuizGeneratorComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { Component, ElementRef, ViewChild, forwardRef } from '@angular/core';
import {
  FormBuilder,
  FormControl,
  FormGroup,
  Validators,
} from '@angular/forms';

@Component({
  selector: 'app-new-quiz',
  templateUrl: './new-quiz.component.html',
  styleUrls: ['./new-quiz.component.css'],
})
export class NewQuizComponent {
  callingFunction() {
    console.log(this.quizform);
    if (this.quizform.valid == false) alert();
  }

  quizform: FormGroup<any>;
  questionNb: number = 0;
  answerNb: number = 0;
  constructor() {
    this.quizform = new FormGroup({
      title: new FormControl('', [
        Validators.required,
        Validators.maxLength(128),
      ]),
      description: new FormControl('', [
        Validators.required,
        Validators.maxLength(255),
      ]),
    });

  }
  ngAfterContentInit() {
    this.addQuestion();
  }

  showForm() {
    console.log(this.quizform);
  }

  addQuestion() {
    this.answerNb = 0;
    this.questionNb++;
    document.getElementById('addquestion')?.remove();
    document.getElementById('addanswer')?.remove();
    this.labelMaker('questionTitle', 'titolo domanda ' + this.questionNb);
    this.brMaker();
    this.textMaker('questionTitle');
    this.buttonMaker('add answer', 'addanswer');
    this.brMaker();
    this.buttonMaker('add question', 'addquestion');
    this.addAnswer();
    this.addAnswer();
  }
  addAnswer() {
    this.answerNb++;
    document.getElementById('addquestion')?.remove();
    document.getElementById('submit')?.remove();
    this.labelMaker('answerText', 'testo risposta ' + this.answerNb);
    this.brMaker();
    this.textMaker('answerText');
    this.labelMaker('risposta', 'Vera? ');
    this.checkMaker('vero');
    this.brMaker();
    this.buttonMaker('add question', 'addquestion');
    this.buttonMaker('submit', 'submit');
  }

  buttonMaker(value: string, id: string) {
    var button = document.createElement('INPUT');
    button.setAttribute('type', 'button');
    button.setAttribute('value', value);
    button.setAttribute('id', id);
    if (id != 'submit')
      button.addEventListener('click', () => {
        if (id == 'addquestion') this.addQuestion();
        else this.addAnswer();
      });
    if (id == 'submit') button.setAttribute('type', 'submit');
    document.getElementById('form')?.appendChild(button);
  }

  textMaker(formControlName: string) {
    var text = document.createElement('INPUT');
    text.setAttribute('type', 'text');
    text.setAttribute('formControlName', formControlName);
    text.setAttribute('id', formControlName);
    if (formControlName == 'questionTitle') {
      text.setAttribute('class', 'questionTitle');
      this.quizform.addControl(
        formControlName + this.questionNb,
        new FormControl('')
      );
    } else {
      text.setAttribute('class', 'answerTitle');
      this.quizform.addControl(
        formControlName + this.questionNb + this.answerNb,
        new FormControl('', [Validators.required, Validators.maxLength(128)])
      );
    }
    document.getElementById('form')?.appendChild(text);
  }

  checkMaker(name: string) {
    var check = document.createElement('INPUT');
    check.setAttribute('type', 'checkbox');
    check.setAttribute('formControlName', name);
    check.setAttribute('id', name);
    this.quizform.addControl(
      name + this.questionNb + this.answerNb,
      new FormControl('')
    );
    document.getElementById('form')?.appendChild(check);
  }

  brMaker() {
    var br = document.createElement('br');
    document.getElementById('form')?.appendChild(br);
  }

  labelMaker(forWhat: string, text: string) {
    var label = document.createElement('label');
    label.setAttribute('for', forWhat);
    label.innerHTML = text;
    if (forWhat == 'questionTitle')
      label.setAttribute('class', 'questionLabel');
    else label.setAttribute('class', 'answerLabel');
    document.getElementById('form')?.appendChild(label);
  }
} 
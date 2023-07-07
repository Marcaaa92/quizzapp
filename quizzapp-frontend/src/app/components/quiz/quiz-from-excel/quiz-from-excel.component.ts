import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Answer } from 'src/app/models/Answer';
import { Question } from 'src/app/models/Question';
import { Quiz } from 'src/app/models/Quiz';
import { ApiQuizService } from 'src/app/services/api/api-quiz.service';
import { Environment } from 'src/environments/environment';
import * as XLSX from 'xlsx'


@Component({
  selector: 'app-quiz-from-excel',
  templateUrl: './quiz-from-excel.component.html',
  styleUrls: ['./quiz-from-excel.component.css']
})
export class QuizFromExcelComponent {
  @ViewChild('submit') submit!: ElementRef;
  @ViewChild('loader') loader!: ElementRef;
  feedback: string = '';
  form: FormGroup;
  excelData: any[] = new Array();
  questions: Question[] = new Array();
  canView: boolean = true;
  bodyRequest!: object;
  quizLink!:string;
  fileValid = false;
  constructor(private service: ApiQuizService) {
    this.form = new FormGroup({
      title: new FormControl('', [Validators.required]),
      description: new FormControl('', [Validators.required]),
      excelFile: new FormControl('', [Validators.required]),
    });
  }

  submitForm() {
    this.loader.nativeElement.style.display = "block";

    this.submit.nativeElement.disabled = true;
    this.canView = false;
    var token = Environment.getToken();
    if (token) {
      let quiz = new Quiz(this.form.get('title')!.value, this.form.get('description')!.value)
      quiz.questions=this.questions;
      quiz.token = token as unknown as string;
      this.service.newQuiz(quiz).subscribe((response) => {
        if (response.statusCode == 200) {
          this.loader.nativeElement.style.display = "none";
          this.feedback = 'quiz aggiunto con successo!';
          this.quizLink = Environment.siteUrl + '/quiz-viewer/' + response.msg
          this.form.reset()
        } else {
          this.loader.nativeElement.style.display = "none";
          this.canView = true;
          this.feedback = "caricamento fallito";
        }
      });
    } else {
      this.feedback = "non sei autenticato"
    }
  }

  fileChanged(e: any) {
    this.feedback = ""
    this.questions = new Array();
    let file = e.target.files[0];
    let fileReader = new FileReader();
    fileReader.readAsBinaryString(file);
    if (file.name.endsWith(".xlsx") || file.name.endsWith(".xls") && this.form.valid) {
      this.submit.nativeElement.disabled = false;
      fileReader.onload = (e) => {
        var workBook = XLSX.read(fileReader.result, { type: 'binary' });
        var sheetNames = workBook.SheetNames;
        this.excelData = XLSX.utils.sheet_to_json(workBook.Sheets[sheetNames[0]]);
        for (let i = 0; i < this.excelData.length; i++) {
          let question = new Question(i, this.excelData[i]["Domanda"].toString().replace(/"/g, '\\"'))
          let atLeastOneCorrect = 0;
          for (let j = 0; j < 4; j++) {
            if (this.excelData[i]["Risposta " + (j + 1)] == this.excelData[i]["Risposta di controllo"]) {
              question.addAnswer(new Answer(0, this.excelData[i]["Risposta " + (j + 1)].toString().replace(/"/g, '\\"'), true))
              atLeastOneCorrect++;
              console.log(this.excelData[i]["Risposta " + (j + 1)])
            }
            else {
              question.addAnswer(new Answer(0, this.excelData[i]["Risposta " + (j + 1)].toString().replace(/"/g, '\\"'), false))
            }
          }
          if (atLeastOneCorrect == 0) {
            this.feedback = "C'è una domanda che ha la risposta di controllo diversa da una delle 4 date "
            this.submit.nativeElement.disabled = true;
            this.questions = new Array()
            break
          }
          else {
            this.shuffle(question.answers!)
            this.questions.push(question)
          }

        }
      }
    }
    else {
      this.submit.nativeElement.disabled = true;
      this.feedback = "Bisogna inserire un file excel valido"
    }
  }
  shuffle(array: any[]) {
    let currentIndex = array.length, randomIndex;
    while (currentIndex != 0) {
      randomIndex = Math.floor(Math.random() * currentIndex);
      currentIndex--;

      [array[currentIndex], array[randomIndex]] = [
        array[randomIndex], array[currentIndex]];
    }

    return array;
  }
}

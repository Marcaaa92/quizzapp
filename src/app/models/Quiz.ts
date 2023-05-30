import { Question } from './Question';

export class Quiz {
  public title?: string;
  public description?: string;
  public questions?: Question[] = new Array();
  public token?: string;
  constructor(title?: string, description?: string) {
    this.description = description;
    this.title = title;
  }
  public addQuestion(questions: Question) {
    this.questions?.push(questions);
  }
  public setToken(token: string){
    this.token=token;
  }
  public deleteQuestion(question: Question) {
    const index = this.questions!.indexOf(question);
    if (index > -1) { 
      this.questions!.splice(index, 1); 
      for(let i=0; i<this.questions!.length; i++)
        this.questions![i].id=i+1;
    }
    console.log(this.questions)
  }
}

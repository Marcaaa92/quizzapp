import { Question } from './Question';

export class Quiz {
  public title: string;
  public description: string;
  public questions?: Question[] = new Array();
  public token?: string;
  constructor(title: string, description: string) {
    this.description = description;
    this.title = title;
  }
  public addQuestion(questions: Question) {
    this.questions?.push(questions);
  }
  public setToken(token: string){
    this.token=token;
  }
}

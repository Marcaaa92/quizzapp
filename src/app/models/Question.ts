import { Answer } from './Answer';
import { jsonIgnore } from 'json-ignore';

export class Question {
  @jsonIgnore()
  id: number;
  public title: string;
  public answers?: Answer[] = new Array();
  constructor(id: number, title: string) {
    this.id = id;
    this.title = title;
  }
  public addAnswer(answer: Answer) {
    this.answers?.push(answer);
  }
  public deleteAnswer(answer: Answer) {
    const index = this.answers!.indexOf(answer);
    if (index > -1) { 
      this.answers!.splice(index, 1); 
      for(let i=0; i<this.answers!.length; i++)
        this.answers![i].id=i+1;
    }
    console.log(this.answers)
  }
}

import { jsonIgnore } from 'json-ignore';

export class Answer {
  @jsonIgnore()
  id: number;
  public text: string;
  public correct: Boolean;
  constructor(id: number, text: string, correct: Boolean) {
    this.id = id;
    this.text = text;
    this.correct = correct;
  }
}

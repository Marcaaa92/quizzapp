import { jsonIgnore } from "json-ignore";

export class Answer {
    @jsonIgnore()
    id:number;
    public text: string;
    public correct: boolean;
    constructor(id: number, text: string, correct: boolean) {
        this.id=id;
        this.text = text;
        this.correct = correct;
    }
}
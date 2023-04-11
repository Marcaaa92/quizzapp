import { Answer } from "./Answer";
import { jsonIgnore } from "json-ignore";

export class Question {
    @jsonIgnore()
    id:number;
    public title: string;
    public answers?: Answer[] = new Array();
    constructor(id: number, title: string) {
        this.id=id;
        this.title = title;
    }
    public addAnswer(answer: Answer){
        this.answers?.push(answer)
    }
}
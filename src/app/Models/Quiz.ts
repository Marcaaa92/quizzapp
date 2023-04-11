import { Question } from "./Question";

export class Quiz {
    public title: string;
    public description: string;
    public questions?: Question[] = new Array();
    constructor(title: string, description: string) {
        this.description=description;
        this.title = title;
    }
    public addQuestion(questions: Question){
        this.questions?.push(questions)
    }
}
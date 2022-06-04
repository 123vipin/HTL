import { QuizConfig } from './quiz-config';
import { Question } from './question';

export class Quiz {
    id: number;
  name: string;
  time: any;
    description: string;
    config: QuizConfig;
    questions: Question[];

    constructor(data: any) {
        if (data) {
            this.id = data.id;
          this.name = data.name;
          this.time = data.time;
            this.description = data.description;
            this.config = new QuizConfig(data.config);
            this.questions = [];
            data.questions.forEach(q => {
                this.questions.push(new Question(q));
            });
        }
    }
}

import { Component, Inject, OnInit, ViewChild } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { CountdownComponent } from 'ngx-countdown';
import { Quiz, QuizConfig, Option, Question} from '../model';
import { CookieService } from 'ngx-cookie-service';
import { EncryptionService } from '../Common/EncryptionService';
import { ActivatedRoute, Router } from '@angular/router';
import { QuizService } from '../services/Customers/quiz-service';
@Component({
  selector: 'app-quiz',
  templateUrl: './quiz.component.html',
  styleUrls: ['./quiz.component.css']
})
export class QuizComponent implements OnInit {
  userId: any;
  testSeriesId: any;
  quizes;
timer:any;
  quiz: Quiz;
  clickindex: any;
  quizdyn: Quiz;
  isAnswer:string;
  mode = 'quiz';
  quizName: string;
  config: QuizConfig = {
    'allowBack': true,
    'allowReview': true,
    'autoMove': false,  // if true, it will move to next question automatically when answered.
    'duration': 0,  // indicates the time in which quiz needs to be completed. 0 means unlimited.
    'pageSize': 1,
    'requiredAll': false,  // indicates if you must answer all the questions before submitting.
    'richText': false,
    'shuffleQuestions': false,
    'shuffleOptions': false,
    'showClock': false,
    'showPager': true,
    'theme': 'none'
  };

  pager = {
    index: 0,
    size: 1,
    count: 1
  };
  @ViewChild('countdown') counter: CountdownComponent;
  constructor(@Inject(HttpClient) private _http: HttpClient, @Inject(CookieService) private cookieService: CookieService, @Inject(QuizService) private quizService: QuizService,
    @Inject(EncryptionService) private encrypt: EncryptionService, @Inject(ActivatedRoute) private route: ActivatedRoute, @Inject(Router) private router: Router) { }

  ngOnInit() {
    this.testSeriesId = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params.id);
    this.quizes = this.getAll();
    this.quizName = this.quizes[0].id;
    this.getQuizById();
  }

  //loadQuiz(quizName: string) {

  //  this.get(quizName).subscribe(res => {
  //  //  this.quiz = new Quiz(res);
  //    debugger
  //    this.getQuizById();
  //    this.pager.count = this.quiz.questions.length;
  //  });
  //  this.mode = 'quiz';
  //}
  getQuizById() {
    this.userId = this.cookieService.get('userId');
    this.quizService.getQuizById(this.userId, 10, 5, this.testSeriesId).subscribe(data => {
      if (data) {
        debugger
        this.quiz = new Quiz(data);
        this.pager.count = this.quiz.questions.length;
      }
    })
    this.mode = 'quiz';
  }
quizList()
{
    var encrypted = this.encrypt.set('123456$#@$^@1ERF', 1);
    this.router.navigate(['dashboard/quizList', encrypted]);
}
  finishTest() {
   
    this.onSubmit();
  }
  get filteredQuestions() {
    return (this.quiz.questions) ?
      this.quiz.questions.slice(this.pager.index, this.pager.index + this.pager.size) : [];
  }

  onSelect(question: Question, option: Option) {
 
      question.options.forEach((x) => { if (x.id !== option.id) x.selected = false; });
 
    if (this.config.autoMove) {
      this.goTo(this.pager.index + 1);
    }
  }

  goTo(index: number) {
    if (index >= 0 && index < this.pager.count) {
      this.pager.index = index;
      this.mode = 'quiz';
    }
  }

  isAnswered(question: Question) {
    return question.options.find(x => x.selected) ? 'Answered' : 'Not Answered';
  };

  isCorrect(question: Question) {
    return question.options.every(x => x.selected === x.isAnswer) ? 'correct' : 'wrong';
  };
  showAnswer(question) {
  
    var result = question.options.find(x => x.isAnswer == true)
    return result.name;
  }
  onSubmit() {
    debugger
    let answers = [];
    this.quiz.questions.forEach(x => answers.push({ 'quizId': this.quiz.id, 'questionId': x.id, 'answered': x.answered }));

    // Post your data to the server here. answers contains the questionId and the users' answer.
    this.quiz.time=0;
    this.mode = 'result';
  }

  getAll() {
    return [
      { id: 'assets/data/aspnet.json', name: 'Asp.Net' },
      { id: 'assets/data/csharp.json', name: 'C Sharp' },
      { id: 'assets/data/designPatterns.json', name: 'Design Patterns' }
    ];
  }


  get(url: string) {
    // return this._http.get(url).pipe(map(res => res['text']().length > 0 ? res['json']() : null))  
    return this._http.get(url).pipe(map(res => {
      return res;
    }));
  }
  //quiz service code ends here


}

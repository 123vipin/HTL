import { Component, Inject, OnInit } from '@angular/core';
import { Meta, Title } from '@angular/platform-browser';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { NgxSpinnerService } from 'ngx-spinner';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';
import { EncryptionService } from '../../Common/EncryptionService';
import { Question, Quiz, QuizConfig, Option } from '../../model';

import { QuizService } from '../../services/Customers/quiz-service';
import { TransfereDataService } from '../../services/Customers/TransfereDataService ';

@Component({
  selector: 'app-overview',
  templateUrl: './overview.component.html',
  styleUrls: ['./overview.component.css']
})
export class OverviewComponent implements OnInit {
  oneAtATime: boolean = true;
  userId: any;
    quizListAll: Object;
    resultAnswer: any;
  constructor(@Inject(EncryptionService) private encrypt: EncryptionService, @Inject(TransfereDataService) private commonService: TransfereDataService,
    @Inject(ActivatedRoute) private route: ActivatedRoute, @Inject(CookieService) private cookieService: CookieService, @Inject(ToastrService) private toastr: ToastrService,
    @Inject(QuizService) private quizService: QuizService, @Inject(Meta) private meta: Meta,
     @Inject(Router) private router: Router,@Inject(Title) private title: Title, @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) { }
  
  paperList: any;
  private subscription: Subscription;
    testSeriesId: any;
  quizes;
  timer: any;
  quiz: Quiz;
  clickindex: any;
  quizdyn: Quiz;
  isAnswer: string;
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
  ngOnInit() {
    this.userId = 0;//parseInt(this.cookieService.get('userId'));
    
    this.getQuizById(1);
    this.subscription = this.commonService.notifyObservable$.subscribe((res) => {
      if (res.hasOwnProperty('option') && res.option === 'onSubmit') {
        this.getAllPaperList(res.value);

      }
    });
  }

  getAllPaperList(text) {
    this.spinner.show();
   
    this.quizService.getAllPaperList(text).subscribe(data => {
      
      if (data) {

this.meta.addTag({ name:'author',content:'mygkpower.com'});    
this.meta.addTag({name:'keyword',content:text});  
        this.meta.addTag({ name: 'description', content: data[0].value });
        this.title.setTitle(text);    
  
        this.paperList = data;
        
      }
      this.spinner.hide();
    })


  }

  getQuizList(type) {
    this.spinner.show();
    
    this.quizService.getPaperList(1, 10, 5, type).subscribe(data => {
      
      if (data) {

        this.quizListAll = data;
        this.spinner.hide();
      }
    })


  }

  getQuizById(testSeriesId) {
    
    this.quizService.getQuizById(this.userId, 10, 5, testSeriesId).subscribe(data => {
      if (data) {
      debugger
        this.quiz = new Quiz(data);
        this.meta.updateTag({ name:'author',content:'mygkpower.com'});    
        this.meta.updateTag({name:'keyword',content:this.quiz.questions[0].name});    
        this.meta.updateTag({name:'description',content:this.quiz.questions[0].name}); 
        this.title.setTitle(this.quiz.name); 
        this.pager.count = this.quiz.questions.length;
      }
    })
    this.mode = 'quiz';
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
      this.meta.updateTag({name:'keyword',content:this.quiz.questions[index].name});  
      this.resultAnswer = '';
    }
  }

  isAnswered(question: Question) {
    return question.options.find(x => x.selected) ? 'Answered' : 'Not Answered';
  };

  isCorrect(question: Question) {
    return question.options.every(x => x.selected === x.isAnswer) ? 'correct' : 'wrong';
  };
  showAnswerValue(optionsv) {
    debugger
    var result = optionsv.options.find(x => x.isAnswer == true)

  this.resultAnswer= result.name;
  }
  onSubmit() {
    debugger
    let answers = [];
    this.quiz.questions.forEach(x => answers.push({ 'quizId': this.quiz.id, 'questionId': x.id, 'answered': x.answered }));

    // Post your data to the server here. answers contains the questionId and the users' answer.
    this.quiz.time = 0;
    this.mode = 'result';
  }

  Login() {
    debugger
    this.router.navigate(['/login']);
  }
  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

}

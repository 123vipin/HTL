import { Component, TemplateRef, ViewChild, ElementRef, Inject } from '@angular/core';
import { ProfileService } from '../../services/login/profile.service';
import { EncryptionService } from '../../Common/EncryptionService';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { QuizService } from '../../services/Customers/quiz-service';
@Component
  ({
    templateUrl: './quiz-list.html',
    styleUrls: ['./quiz-list.css']

  })
export class QuizListComponent {
  @ViewChild('table') table: ElementRef;
  public data: any;
  currentPage: any;
  p: number = 1;
  dataLength: any;
  userId: any;
  quizList: any;
  isDevies: string;
  constructor(@Inject(EncryptionService) private encrypt: EncryptionService,
    @Inject(ActivatedRoute) private route: ActivatedRoute, @Inject(CookieService) private cookieService: CookieService, @Inject(ToastrService) private toastr: ToastrService,
    @Inject(QuizService) private quizService: QuizService, @Inject(Router) private router: Router, @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) {
    this.isDevies = this.cookieService.get('isDevies');
    debugger
  }
  ngOnInit() {
    this.spinner.show();
    this.userId = parseInt(this.cookieService.get('userId'));
    var decrypted = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params.type);

      this.getQuizList(decrypted);
 
  
   

  }
  AttempSeries(id) {
    var encrypted = this.encrypt.set('123456$#@$^@1ERF', id);

    this.router.navigate(['dashboard/quiz', encrypted]);
  }
  back() {
    this.router.navigate(['/dashboard']);
  }

  getQuizList(type) {
    this.spinner.show();
   
    this.quizService.getLatestQuiz(this.userId, 10, 5, type).subscribe(data => {
      debugger
      if (data) {

        this.quizList = data;
        this.spinner.hide();
      }
    })

   
  }

  


 
 
}

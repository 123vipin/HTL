import { Component, TemplateRef, ViewChild, ElementRef, Inject } from '@angular/core';
import { EncryptionService } from '../../Common/EncryptionService';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { QuizService } from '../../services/Customers/quiz-service';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';

@Component
  ({
    templateUrl: './paperQuiz.html',
    styleUrls: ['./paperQuiz.css']

  })
export class PaperQuizListComponent {
  @ViewChild('table') table: ElementRef;
  public data: any;
  currentPage: any;
  dataLength: any;
  paperList: any;
  userId: any;
  paperAlllist: any;
  registerForm: FormGroup;
  submitted = false;
  isDevies: string;
  modalRef: BsModalRef;
  bsModalRef: BsModalRef;
  constructor(@Inject(EncryptionService) private encrypt: EncryptionService, @Inject(BsModalService) private modalService: BsModalService, @Inject(FormBuilder) private formBuilder: FormBuilder,
    @Inject(ActivatedRoute) private route: ActivatedRoute, @Inject(CookieService) private cookieService: CookieService, @Inject(ToastrService) private toastr: ToastrService,
    @Inject(QuizService) private quizService: QuizService, @Inject(Router) private router: Router, @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) {
    this.isDevies = this.cookieService.get('isDevies');
    debugger
  }
  @ViewChild('template') elementView: ElementRef;
  ngOnInit() {
 this.registerForm = this.formBuilder.group({
   Paper: ['', [Validators.required,]],
   time: ['', [Validators.required,]],
   questionUrl: ['', [Validators.required,]],
   answerUrl: ['', [Validators.required,]],
   description: ['', [Validators.required,]],
   paperType: ['', [Validators.required,]],
    
    });
    this.spinner.show();
      this.getPaper(3);
    this.spinner.hide();
  }
  get f() { return this.registerForm.controls; }

  addQuestion(quiz:any) {
    var encrypted = this.encrypt.set('123456$#@$^@1ERF', quiz.id);
    var name = this.encrypt.set('123456$#@$^@1ERF', quiz.name);

    this.router.navigate(['dashboard/question', encrypted,name]);
  }
  back() {
    this.router.navigate(['/dashboard']);
  }

  getPaper(type:any) {
    this.userId = this.cookieService.get('userId');
    debugger
    this.quizService.getPaper(this.userId, 10, 5, type).subscribe(data => {
      debugger
      if (data) {

        this.paperAlllist = data;
        this.spinner.hide();
      }
    })

   
  }
  publish(quiz:any) {
    this.quizService.publish(quiz.id).subscribe(data => {
      if (data) {
        this.toastr.success('Test Series has been published successfully.', 'Success');
        //this.getQuizList(3);
      }
    })
  }

  getAllPaperList() {
    this.spinner.show();
    this.userId = this.cookieService.get('userId');
    this.quizService.getAllPaperList(11).subscribe(data => {
      debugger
      if (data) {

        this.paperList = data;

      }
      this.spinner.hide();
    })


  }
  openModal(template: TemplateRef<any>) {
    this.modalRef = this.modalService.show(template);
    this.getAllPaperList();
   
  }
 onSubmit() {
    this.submitted = true;

    // stop here if form is invalid
    if (this.registerForm.invalid) {
      return;
   }
   debugger
   this.registerForm.value.userid = this.cookieService.get('userId');
   this.quizService.savePaperSeries(this.registerForm.value).subscribe((res): any => {
     if (res == 1) {
       this.toastr.success('Paper has been created successfully.', 'Success');
       this.getPaper(3);
       this.modalRef.hide();
      }
     else if (res == 2) {
       this.toastr.warning('Paper already exists.', 'Warning');
      }
      else {
        this.toastr.error('Please contact admin', 'Error');

      }
    });
  }

 
 
}

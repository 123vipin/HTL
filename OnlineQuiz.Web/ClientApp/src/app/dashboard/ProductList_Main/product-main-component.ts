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
import { ProductCategoryService } from '../../services/Product/product.service';

@Component
  ({
    templateUrl: './product-main.html',
    styleUrls: ['./product-main.css']

  })
export class ProductOrderComponent {
  @ViewChild('table') table: ElementRef;
  public data: any;
  currentPage: any;
  dataLength: any;
  questionList: any;
  userId: any;
 
  registerForm: FormGroup;
  submitted = false;
  isDevies: string;
  modalRef: BsModalRef;
  bsModalRef: BsModalRef;
  productList: Object;
  constructor(@Inject(EncryptionService) private encrypt: EncryptionService,
  @Inject(ProductCategoryService) private productCategoryService: ProductCategoryService,
   @Inject(BsModalService) private modalService: BsModalService, @Inject(FormBuilder) private formBuilder: FormBuilder,
    @Inject(ActivatedRoute) private route: ActivatedRoute, @Inject(CookieService) private cookieService: CookieService, @Inject(ToastrService) private toastr: ToastrService,
    @Inject(QuizService) private quizService: QuizService, @Inject(Router) private router: Router, @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) {
    this.isDevies = this.cookieService.get('isDevies');
    debugger
  }
  @ViewChild('template') elementView: ElementRef;
  ngOnInit() {
 this.registerForm = this.formBuilder.group({
      testSeries: ['', [Validators.required,]],
      time: [0, [Validators.required,]],
   description: ['', [Validators.required,]],
   questionType: [0, [Validators.required,]],
    
    });
    this.spinner.show();
      this.getQuizList(3);
    this.spinner.hide();
  }
  get f() { return this.registerForm.controls; }

  addQuestion(quiz,type) {
    var encrypted = this.encrypt.set('123456$#@$^@1ERF',quiz);
    var name = this.encrypt.set('123456$#@$^@1ERF',type);
    this.router.navigate(['dashboard/new-product', encrypted,name]);
  }
  back() {
    this.router.navigate(['/dashboard']);
  }

  getQuizList(type) {
    this.userId = 1;
    this.productCategoryService.getProductList(this.userId, 10, 5, type).subscribe(data => {
      if (data) {

        this.productList = data;
        this.spinner.hide();
      }
    })

   
  }

 onSubmit() {
    this.submitted = true;

    // stop here if form is invalid
    if (this.registerForm.invalid) {
      return;
   }
   this.registerForm.value.userid = parseInt(this.cookieService.get('userId'));
   this.registerForm.value.time = parseInt(this.registerForm.value.time);
   this.registerForm.value.questionType = parseInt(this.registerForm.value.questionType);
   this.quizService.saveTestSeries(this.registerForm.value).subscribe((res): any => {
     if (res == 1) {
       this.toastr.success('Test Series has been created successfully.', 'Success');
       this.getQuizList(3);
       this.modalRef.hide();
      }
     else if (res == 2) {
        this.toastr.warning('Test Series already exists.', 'Warning');
      }
      else {
        this.toastr.error('Please contact admin', 'Error');

      }
    });
  }

 
 
}

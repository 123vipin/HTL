import { Component, TemplateRef, ViewChild, ElementRef, Inject } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { LoginService } from '../services/login/login.service';

@Component
  ({
    templateUrl: './feedback.html',
    styleUrls: ['./feedback.css']

  })
export class FeedBackComponent {
  @ViewChild('table') table: ElementRef;
  public data: any;
  currentPage: any;
  dataLength: any;
  userId: any;
  submitted = false;
  registerForm: FormGroup;

  constructor(
    @Inject(ActivatedRoute) private route: ActivatedRoute,
    @Inject(LoginService) private loginService: LoginService, @Inject(FormBuilder) private formBuilder: FormBuilder,
    @Inject(CookieService) private cookieService: CookieService, @Inject(ToastrService) private toastr: ToastrService,
  @Inject(Router) private router: Router, @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) {
  
    debugger
  }
  ngOnInit() {

    this.registerForm = this.formBuilder.group({
      password: ['', [Validators.required]]

    });
  }

  // convenience getter for easy access to form fields
  get f() { return this.registerForm.controls; }


  onSubmit() {
    this.submitted = true;
    this.userId = this.cookieService.get('userId');
    // stop here if form is invalid
    if (this.registerForm.invalid) {
      return;
    }
    this.loginService.SaveSuggestion(this.registerForm.value, this.userId ).subscribe((data): any => {
      if (data == 3) {
        this.toastr.success('Suggestion has been submitted successfully', 'Success');
    //    this.router.navigate(['/login']);
      }
      else if (data == 2) {
        this.toastr.warning('Please contact admin.', 'Warning');
      }
      else {
        this.toastr.error('Please contact admin', 'Error');

      }
    });
  }

 
 
}

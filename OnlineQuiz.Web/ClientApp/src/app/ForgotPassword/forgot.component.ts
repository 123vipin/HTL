import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { MustMatch } from '../Common/MustMatch';
import { LoginService } from '../services/login/login.service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';

import { EncryptionService } from '../Common/EncryptionService';
@Component({
  selector: 'app-forgot',
  templateUrl: './forgot.component.html',
  styleUrls: ['./forgot.component.css']
})
export class ForgotComponent implements OnInit {

  registerForm: FormGroup;
  submitted = false;
  isHide = false;
  mobNumberPattern = "^((\\+91-?)|0)?[0-9]{10}$";  

  constructor(@Inject(FormBuilder)private formBuilder: FormBuilder,
    @Inject(Router)private router: Router,
    @Inject(LoginService) private loginService: LoginService
    , @Inject(EncryptionService) private encrypt: EncryptionService,
    @Inject(ToastrService) private toastr: ToastrService,) {
}

  ngOnInit() {
    this.registerForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
  
    });
  }

  // convenience getter for easy access to form fields
  get f() { return this.registerForm.controls; }
  
  onSubmit() {
    this.submitted = true;

    // stop here if form is invalid
    if (this.registerForm.invalid) {
      return;
    }
    var encrypted = this.encrypt.set('123456$#@$^@1ERF', this.registerForm.value);
    this.loginService.ForgotSendMailPassword(this.registerForm.value, encrypted).subscribe((data): any => {
      if (data == 1) {
        this.toastr.success('Reset Password Link has been send your registerd mail address . please check it .', 'Success');
        this.router.navigate(['/login']);
      }
      else if (data == 2) {
        this.toastr.warning('Account is not  exists.', 'Warning');
      }
      else {
        this.toastr.error('Please contact admin', 'Error');

      }
    });
  }

  onReset() {
    this.submitted = false;
    this.registerForm.reset();
  }
}

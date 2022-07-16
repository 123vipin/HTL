import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { MustMatch } from '../Common/MustMatch';
import { LoginService } from '../services/login/login.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router } from '@angular/router';

import { EncryptionService } from '../Common/EncryptionService';
@Component({
  selector: 'app-updatePassword',
  templateUrl: './updatePassword.component.html',
  styleUrls: ['./updatePassword.component.css']
})
export class UpdatePasswordComponent implements OnInit {

  registerForm: FormGroup;
  submitted = false;
  isHide = false;
  mobNumberPattern = "^((\\+91-?)|0)?[0-9]{10}$";  

  constructor(@Inject(FormBuilder)private formBuilder: FormBuilder,
    @Inject(Router)private router: Router,
    @Inject(LoginService) private loginService: LoginService,
    @Inject(ToastrService) private toastr: ToastrService,
    @Inject(ActivatedRoute) private route: ActivatedRoute,
    @Inject(EncryptionService) private encrypt: EncryptionService,) {
   }

  ngOnInit() {
    var decrypted = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params['email']);
    debugger
    this.registerForm = this.formBuilder.group({
      password: ['', [Validators.required, Validators.minLength(6)]]
  
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
    this.loginService.UpdatePassword(this.registerForm.value, this.route.snapshot.params['email']).subscribe((data): any => {
      if (data == 3) {
        this.toastr.success('Update password has been done successfully', 'Success');
        this.router.navigate(['/login']);
      }
      else if (data == 2) {
        this.toastr.warning('Please contact admin.', 'Warning');
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

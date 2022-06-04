import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { MustMatch } from '../Common/MustMatch';
import { LoginService } from '../services/login/login.service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup;
  submitted = false;
  isHide = false;
  mobNumberPattern = "^((\\+91-?)|0)?[0-9]{10}$";  
 
  constructor(@Inject(FormBuilder)private formBuilder: FormBuilder,
    @Inject(Router)private router: Router,
    @Inject(LoginService) private loginService: LoginService,
    @Inject(ToastrService) private toastr: ToastrService,) {
}

  ngOnInit() {
    this.registerForm = this.formBuilder.group({
      firstName: ['', [Validators.required,]],
      phone: ['',[]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
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
    this.loginService.SaveUser(this.registerForm.value).subscribe((data): any => {
      if (data == 3) {
        this.toastr.success('Account has been created successfully.', 'Success');
        this.router.navigate(['/login']);
      }
      else if (data == 1) {
        this.toastr.warning('Account already exists.', 'Warning');
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

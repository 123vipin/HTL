import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup, FormArray } from '@angular/forms';
import { LoginService } from '../services/login/login.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, Router } from '@angular/router';

import { EncryptionService } from '../Common/EncryptionService';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})
export class QuestionComponent implements OnInit {

  registerForm: FormGroup;
  submitted = false;
  isHide = false;
  public files: any[];
  totalQuestion: any;
  testSeriesId: any;
  testSeriesName: any;
  mobNumberPattern = "^((\\+91-?)|0)?[0-9]{10}$";  
 
  myForm: FormGroup;
  arr: FormArray;
  constructor(@Inject(FormBuilder)private formBuilder: FormBuilder,
    @Inject(Router)private router: Router,
    @Inject(LoginService) private loginService: LoginService,
    @Inject(HttpClient)  private http: HttpClient,
    @Inject(CookieService) private cookieService: CookieService,
    @Inject(ToastrService) private toastr: ToastrService,
    @Inject(EncryptionService) private encrypt: EncryptionService, @Inject(ActivatedRoute) private route: ActivatedRoute) {
  }

  ngOnInit() {

    this.testSeriesId = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params.id);
    this.testSeriesName = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params.name);
   
    this.registerForm = this.formBuilder.group({
      Name: ['', [Validators.required,]],
      Price: [''],
      Description: [''],
      isActive: [''],
     
    });
  }

  // convenience getter for easy access to form fields
  get f() { return this.registerForm.controls; }
 

  onFileChanged(event: any) {
    this.files = event.target.files;
  }
  
  public uploadFile = (files) => {
    if (files.length === 0) {
      return;
    }
  //  this.userId = this.cookieService.get('userId');
    debugger
    let fileToUpload = <File>files[0];
  
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);
    formData.append('userId', fileToUpload, '1');
    this.http.post('http://localhost:52395/api/Upload/UploadImage', formData, { reportProgress: true, observe: 'events' })
      .subscribe(event => {
        // if (event.type === HttpEventType.UploadProgress)
        //   this.progress = Math.round(100 * event.loaded / event.total);
        // else if (event.type === HttpEventType.Response) {
        //   this.message = 'Upload success.';
        //   this.onUploadFinished.emit(event.body);
        //   this.getImageList()
        //}
     });
  }
  BackQuiz() {
    this.router.navigate(['/dashboard/mainQuiz']);
  }
  addItem() {
    this.arr = this.myForm.get('arr') as FormArray;
   // this.arr.push(this.createItem());
  }

  onSubmit1() {
    debugger
    console.log(this.myForm.value);
  }
  onSubmit() {
    this.submitted = true;
    // stop here if form is invalid
    if (this.registerForm.invalid) {
      this.toastr.warning('Please enter Name.', 'Warning');
      return;
    }
    this.registerForm.value.testSeriesId = parseInt(this.testSeriesId);
    this.registerForm.value.option = (JSON.stringify(this.myForm.value));
    debugger
    this.loginService.AddQuestion(this.registerForm.value).subscribe((data): any => {
      debugger
      if (data>0) {
        this.toastr.success('Question has been added successfully.', 'Success');
        this.registerForm.reset();
        this.myForm.reset();
        this.totalQuestion = data;
      }
    
    });
  }

  onReset() {
    this.submitted = false;
    this.registerForm.reset();
  }
}

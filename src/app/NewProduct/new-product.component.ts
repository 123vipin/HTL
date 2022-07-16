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
  templateUrl: './new-product.component.html',
  styleUrls: ['./new-product.component.css']
})
export class ProductComponent implements OnInit {

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
  productData: any;
  productCategoryList: any;
  mainProductData: any;
  constructor(@Inject(FormBuilder)private formBuilder: FormBuilder,
    @Inject(Router)private router: Router,
    @Inject(LoginService) private loginService: LoginService,
    @Inject(HttpClient)  private http: HttpClient,
    @Inject(CookieService) private cookieService: CookieService,
    @Inject(ToastrService) private toastr: ToastrService,
    @Inject(EncryptionService) private encrypt: EncryptionService, @Inject(ActivatedRoute) private route: ActivatedRoute) {
  }

  ngOnInit() {

    this.testSeriesId = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params['id']);
    this.testSeriesName = this.encrypt.get('123456$#@$^@1ERF', this.route.snapshot.params['name']);
   
    this.registerForm = this.formBuilder.group({
      Name: ['', [Validators.required]],
      Price: ['', [Validators.required]],
      Description: [''],
      isActive: [''],
      ImageUrl: [''],
      quantity: [''],
      category:['0'],
     
    });
  
      this.getProductDataById(this.testSeriesId);
   
  
  }

  // convenience getter for easy access to form fields
  get f() { return this.registerForm.controls; }
 

  onFileChanged(event: any) {
    this.files = event.target.files;
  }
  
  public uploadFile = (files: string | any[]) => {
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
    this.router.navigate(['/dashboard/productList']);
  }
  addItem() {
    this.arr = this.myForm.get('arr') as FormArray;
   // this.arr.push(this.createItem());
  }


  onSubmit() {
    this.submitted = true;
    if (this.registerForm.invalid) {
      this.toastr.warning('Please fill all manadetory field.', 'Warning');
      return;
    }
    if(this.testSeriesName=='edit')
    {
      this.registerForm.value.Id=this.productData.id;
    }
    else{this.registerForm.value.Id=0;}
    
    this.registerForm.value.Userid=2;

    this.registerForm.value.Price= parseFloat(this.registerForm.value.Price)
    this.registerForm.value.quantity= parseInt(this.registerForm.value.quantity)
    this.registerForm.value.ImageUrl="https://images.app.goo.gl/9poRCNJS7jpULbdC6";
    this.loginService.saveItem(this.registerForm.value).subscribe((data): any => {
      debugger
      if (data>0) {
        if(this.testSeriesName=='edit')
        { this.toastr.success('Item has been updated successfully.', 'Success');
        }
        else
        {
          this.toastr.success('Item has been added successfully.', 'Success');
        }
       this.BackQuiz();
        this.registerForm.reset();
        this.myForm.reset();
        this.totalQuestion = data;
        
      }
    
    });
  }
  getProductDataById(id: any)
  {
    this.loginService.getproductDatabyId(id).subscribe((data): any => {
      debugger
      this.mainProductData=data;
      this.productData=this.mainProductData.dbTrade;
      this.productCategoryList=this.mainProductData.dbTradeList;
      if (data) {
     
        this.registerForm.controls['Price'].setValue(this.productData.price);
        this.registerForm.controls['Description'].setValue(this.productData.description);
        this.registerForm.controls['ImageUrl'].setValue(this.productData.imageUrl);
        this.registerForm.controls['Name'].setValue(this.productData.name);
        this.registerForm.controls['isActive'].setValue(this.productData.isActive);
        this.registerForm.controls['quantity'].setValue(this.productData.quantity);
        this.registerForm.controls['category'].setValue(this.productData.category);
      
      }
     
    });
  }
  onReset() {
    this.submitted = false;
    this.registerForm.reset();
  }
}

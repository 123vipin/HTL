import { Component, TemplateRef, ViewChild, ElementRef, Inject } from '@angular/core';
import { EncryptionService } from '../../Common/EncryptionService';
import { ActivatedRoute } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { NgxSpinnerService } from 'ngx-spinner';
import { BsModalRef } from 'ngx-bootstrap/modal/bs-modal-ref.service';
import { BsModalService } from 'ngx-bootstrap/modal';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ProductCategoryService } from '../../services/Product/product.service';
@Component
  ({
    templateUrl: './product-category.html',
    styleUrls: ['./product-category.css']

  })
export class ProductCategoryComponent {
  @ViewChild('table') table: ElementRef;
  public data: any;
  currentPage: any;
  p: number = 1;
  term:any;
  dataLength: any;
  registerForm: FormGroup;
  submitted = false;
  isHide = false;
  public files: any[];
 
  mobNumberPattern = "^((\\+91-?)|0)?[0-9]{10}$";  
  
  userId: any;
  categoryData: any;
  isDevies: string;
  modalRef: BsModalRef;
  testSeriesName: string;
  categoryId: any;
  constructor(@Inject(EncryptionService) private encrypt: EncryptionService,
  @Inject(FormBuilder)private formBuilder: FormBuilder,
  @Inject(ProductCategoryService) private productCategoryService: ProductCategoryService,
  @Inject(BsModalService) private modalService: BsModalService,
  @Inject(ActivatedRoute) private route: ActivatedRoute, @Inject(CookieService) private cookieService: CookieService,
   @Inject(ToastrService) private toastr: ToastrService,
    @Inject(Router) private router: Router, @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) {
    this.isDevies = this.cookieService.get('isDevies');
    
  }
  ngOnInit() {
    this.spinner.show();
    this.userId = parseInt(this.cookieService.get('userId'));
     this.getProductCategoryList();
     this.registerForm = this.formBuilder.group({
      Name: ['', [Validators.required,]],
      description: [''],
      isActive: [''],
     
     
    });

  }
  pageChange(newPage: any) {
		this.router.navigate([''], { queryParams: { page: newPage } });
	}
  get f() { return this.registerForm.controls; }
  back() {
    this.router.navigate(['/dashboard']);
  }
  openModal(template: TemplateRef<any>) {
    this.testSeriesName='add';
    this.modalRef = this.modalService.show(template);
  }
  editCategory(template: TemplateRef<any>,category: { id: any; description: null; name: any; isActive: any; })
  {
    
         this.testSeriesName='edit';
         this.categoryId=category.id;
        this.registerForm.controls['description'].setValue(category.description==null?'':category.description);
        this.registerForm.controls['Name'].setValue(category.name);
        this.registerForm.controls['isActive'].setValue(category.isActive);
        this.modalRef = this.modalService.show(template);

  }
  getProductCategoryList() {
    this.spinner.show();
    this.productCategoryService.getProductCategoryList(this.userId, 10, 5).subscribe(data => {
      if (data) {
        this.categoryData = data;
        this.spinner.hide();
      }
    })

   
  }

  onSubmit() {
    this.submitted = true;
    
    if(this.testSeriesName=='edit')
    {
      this.registerForm.value.Id=this.categoryId;
    }
    else{this.registerForm.value.Id=0;}
    
    this.registerForm.value.Userid=2;
    this.productCategoryService.saveProductCategory(this.registerForm.value).subscribe((data): any => {
      debugger
      if (data>0) {
        if(this.testSeriesName=='edit')
        { this.toastr.success('Product Category has been updated successfully.', 'Success');
        }
        else
        {
          this.toastr.success('Product category has been added successfully.', 'Success');
        }
       
       this.modalRef.hide();
       this.getProductCategoryList();
        this.registerForm.reset();
        
     
        
      }
      else
      {
        this.toastr.error('Please contact to admin.', 'Success');
      }
    
    });
  }
 
  onReset() {
    this.submitted = false;
    this.registerForm.reset();
  }

  


 
 
}

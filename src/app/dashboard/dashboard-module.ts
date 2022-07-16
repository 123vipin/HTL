import { NgModule, NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { DashboardRouteModule } from './dashboard-route.module';
import { DashboardContentComponent } from './dashboard-content/dashboard-content.component';
 // from ng2-bootstrap
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { DatePipe } from '@angular/common';
import { NgxSpinnerModule } from 'ngx-spinner';

import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import { TimepickerModule } from 'ngx-bootstrap/timepicker';

import { SessionlogoutComponent } from '../login/SessionLogoutComponent';


import { SearchPipe } from '../Common/customeFilter';

import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { OnlyNumber } from '../Common/onlyNumberDirective';

import { TwoDigitDecimaNumberDirective } from '../Common/two-digit-decimal-number-directive';

import { EncryptionService } from '../Common/EncryptionService';

import { SettingComponent } from '../Setting/setting-component';
import { QuizComponent } from '../Quiz/quiz.component';


import { PaperQuizListComponent } from './paper_Quiz/paperQuiz';
import { FeedBackComponent } from '../Feedback/feedback-component';
import { ProductCategoryComponent } from './ProductCategory/product-category-component';
import { ProductCategoryService } from '../services/Product/product.service';
import { ProductListComponent } from './ProductList/product-list-component';
import { ProductComponent } from '../NewProduct/new-product.component';


@NgModule({
  declarations: 
  [
    DashboardContentComponent,SettingComponent,  ProductCategoryComponent, ProductComponent,
    SessionlogoutComponent,ProductListComponent, QuizComponent, FeedBackComponent ,PaperQuizListComponent,
    OnlyNumber, TwoDigitDecimaNumberDirective, 
    SearchPipe
  ],
   

    
  imports: [
    DashboardRouteModule,
    CommonModule,
  
    FormsModule,
  
    BsDatepickerModule.forRoot(),

    ReactiveFormsModule,
  
    TimepickerModule.forRoot(),
 
    TabsModule.forRoot(),
    ModalModule.forRoot(), TabsModule.forRoot(),


    TooltipModule.forRoot(),
    CollapseModule.forRoot(),
     

  ],
 
  providers: [DatePipe, EncryptionService,ProductCategoryService],
  schemas: [
    CUSTOM_ELEMENTS_SCHEMA,
    NO_ERRORS_SCHEMA
  ]

})
export class DashboardMModule { }

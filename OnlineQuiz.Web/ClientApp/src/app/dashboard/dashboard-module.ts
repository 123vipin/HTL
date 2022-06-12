import { NgModule, NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { DashboardRouteModule } from './dashboard-route.module';
import { DashboardContentComponent } from './dashboard-content/dashboard-content.component';
import { Ng2TableModule } from 'ng2-table';
import { PaginationModule } from "ng2-bootstrap/pagination"; // from ng2-bootstrap
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { UiSwitchModule } from 'ngx-ui-switch';
import { DatePipe } from '@angular/common';
import { NgxSpinnerModule } from 'ngx-spinner';
import { MyDatePickerModule } from 'mydatepicker';
import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';
import { TimepickerModule } from 'ngx-bootstrap/timepicker';

import { BackButtonDisableModule } from 'angular-disable-browser-back-button';
import { ShowHidePasswordModule } from 'ngx-show-hide-password';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { SessionlogoutComponent } from '../login/SessionLogoutComponent';
import { NotifierModule, NotifierOptions } from 'angular-notifier';
import { NotifierService } from 'angular-notifier';
import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { NgxPaginationModule } from 'ngx-pagination';
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import { SearchPipe } from '../Common/customeFilter';
import { ExpandableListModule } from 'angular2-expandable-list';
import { PersistenceModule } from 'angular-persistence';
import { ProgressBarModule } from "angular-progress-bar";
import { ChartsModule } from 'ng2-charts';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { OnlyNumber } from '../Common/onlyNumberDirective';
import { Ng5SliderModule } from 'ng5-slider';
import { TwoDigitDecimaNumberDirective } from '../Common/two-digit-decimal-number-directive';
import { AutocompleteLibModule } from 'angular-ng-autocomplete';
import { EncryptionService } from '../Common/EncryptionService';
import { NgxGalleryModule } from 'ngx-gallery';
import { InfiniteScrollModule } from 'ngx-infinite-scroll';
import { ToastrModule } from 'ngx-toastr';
import { SettingComponent } from '../Setting/setting-component';
import { QuizComponent } from '../Quiz/quiz.component';

import { CountdownModule } from 'ngx-countdown';
import { PaperQuizListComponent } from './paper_Quiz/paperQuiz';
import { FeedBackComponent } from '../Feedback/feedback-component';
import { ProductCategoryComponent } from './ProductCategory/product-category-component';
import { ProductCategoryService } from '../services/Product/product.service';
import { ProductListComponent } from './ProductList/product-list-component';
import { ProductComponent } from '../NewProduct/new-product.component';
@NgModule({
  imports: [
    CommonModule,
    DashboardRouteModule,
    FormsModule,
    UiSwitchModule,
    BsDatepickerModule.forRoot(),
    MyDatePickerModule,
    AutocompleteLibModule,
    ReactiveFormsModule,
    NgMultiSelectDropDownModule.forRoot(),
   // NgxSpinnerModule,
    Ng2SearchPipeModule,
    BackButtonDisableModule.forRoot({
      preserveScrollPosition: true
    }),
    NgxPaginationModule,
    ExpandableListModule,
    TimepickerModule.forRoot(),
    PaginationModule.forRoot(),
    TabsModule.forRoot(),
    ModalModule.forRoot(), TabsModule.forRoot(),
    Ng2SmartTableModule,
    Ng5SliderModule,

    ConfirmationPopoverModule.forRoot({
      confirmButtonType: 'danger' // set defaults here
    }),
    ProgressBarModule,

    ChartsModule,
    NotifierModule.withConfig(),
    Ng2TableModule,
    InfiniteScrollModule,
    NgxGalleryModule,
  PersistenceModule,
    ShowHidePasswordModule,
    NgMultiSelectDropDownModule.forRoot(),
    TooltipModule.forRoot(),
    CollapseModule.forRoot(),
    CountdownModule 

  ],
  declarations: [SettingComponent, QuizComponent, FeedBackComponent ,PaperQuizListComponent,
    OnlyNumber, TwoDigitDecimaNumberDirective, ProductListComponent,
    DashboardContentComponent, ProductCategoryComponent, ProductComponent,
     SessionlogoutComponent, SearchPipe],
  providers: [DatePipe, NotifierService, EncryptionService,ProductCategoryService],
  schemas: [
    CUSTOM_ELEMENTS_SCHEMA,
    NO_ERRORS_SCHEMA
  ]

})
export class DashboardModule { }

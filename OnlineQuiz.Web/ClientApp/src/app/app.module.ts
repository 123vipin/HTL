import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown'
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { TabsModule } from 'ngx-bootstrap';
import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { CounterComponent } from './counter/counter.component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
import { HeaderComponent } from './header/header.component';
import { LoginComponent } from './login/login.component';
import { BannerComponent } from './home/banner/banner.component';
import { OverviewComponent } from './home/overview/overview.component';
import { VideoComponent } from './home/video/video.component';
import { DetailComponent } from './home/detail/detail.component';
import { FooterComponent } from './home/footer/footer.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { DashboardHeaderComponent } from './dashboard/dashboard-header/dashboard-header.component';
import { DashboardSidemenuComponent } from './dashboard/dashboard-sidemenu/dashboard-sidemenu.component';
import { DashboardFooterComponent } from './dashboard/dashboard-footer/dashboard-footer.component';
import { DashboardModule } from './dashboard/dashboard-module';
import { RegisterComponent } from './register/register.component';
import { LoginService } from './services/login/login.service';
import { CustomerService } from './services/Customers/customer.service';
import { ToastrModule } from 'ngx-toastr';
import { TransfereDataService } from './services/Customers/TransfereDataService ';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from './AuthGuard _Service/AuthService ';
import { AuthGuard } from './AuthGuard _Service/AuthGuard ';

import { config } from './UrlConfig';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { HttpModule } from '@angular/http';
import { AccordionModule } from 'ngx-bootstrap/accordion';
import { ShowHidePasswordModule } from 'ngx-show-hide-password';
import { EncrDecrService } from './services/CryptoService/EncrDecrService ';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { ChartsModule } from 'ng2-charts';
import { NotifierService } from 'angular-notifier';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';
import { NgxSpinnerModule, NgxSpinnerService } from 'ngx-spinner';
import { PushNotificationsService } from './Common/PushNotificationsService';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { TokenInterceptor } from './AuthGuard _Service/TokenInterceptor';
import { ForgotComponent } from './ForgotPassword/forgot.component';
import { NgxPaginationModule } from 'ngx-pagination';
import { Ng2SearchPipeModule } from 'ng2-search-filter';
import { UpdatePasswordComponent } from './UpdatePassword/updatePassword.component';
import { QuizService } from './services/Customers/quiz-service';

@NgModule({
  declarations: [
    AppComponent,
    
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    FetchDataComponent,
    HeaderComponent,
    LoginComponent,
    BannerComponent,
    OverviewComponent,
    VideoComponent,
    DetailComponent,
    FooterComponent,
    DashboardComponent,
    DashboardHeaderComponent,
    DashboardSidemenuComponent,
    DashboardFooterComponent,
    RegisterComponent,
    ForgotComponent,
    UpdatePasswordComponent
    

  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    DashboardModule,
    AccordionModule.forRoot(),
    ShowHidePasswordModule.forRoot(),
  
    NgxSpinnerModule,
    HttpModule,
    HttpClientModule,
    BrowserAnimationsModule,
    //UserIdleModule.forRoot({ idle: 1, timeout: 1, ping: 1 }),
    ToastrModule.forRoot({ preventDuplicates: true }), BsDropdownModule.forRoot(),
    TabsModule.forRoot(),
    NgMultiSelectDropDownModule.forRoot(),
    ReactiveFormsModule,
    Ng2SearchPipeModule,
    AccordionModule.forRoot(),
    NgxPaginationModule,
    TooltipModule.forRoot(),
    RouterModule.forRoot([
      {
        path: '', component: HomeComponent, pathMatch: 'full'
      },
      { path: 'counter', component: CounterComponent },
      { path: 'fetch-data', component: FetchDataComponent },
      { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
      { path: 'login', component: LoginComponent },
      { path: 'dashBoardSideMenu', component: DashboardSidemenuComponent, canActivate: [AuthGuard] },
      { path: 'dashBoardheader', component: DashboardHeaderComponent, canActivate: [AuthGuard] },
      { path: 'register', component: RegisterComponent },
      { path: 'forgotpassword', component: ForgotComponent },
      { path: 'updatePassword/:email', component: UpdatePasswordComponent },
      { path: '**', component: HomeComponent, canActivate: [AuthGuard] },


    ]),
    ChartsModule,
    TooltipModule.forRoot(),
  ],
  providers: [LoginService, PushNotificationsService, EncrDecrService, CustomerService, NotifierService,
    QuizService, config, TransfereDataService, CookieService, AuthService,
    AuthGuard, {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true
    },
    {
      provide: LocationStrategy,
      useClass: HashLocationStrategy,
    //  multi: true,
    }
  ],
  bootstrap: [AppComponent],

  schemas: [
    CUSTOM_ELEMENTS_SCHEMA
  ]
})
export class AppModule { }
//LocationStrategy  HashLocationStrategy

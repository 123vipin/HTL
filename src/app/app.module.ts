import { HashLocationStrategy, LocationStrategy } from '@angular/common';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { CookieService } from 'ngx-cookie-service';
import { FilterPipeModule } from 'ngx-filter-pipe';
import { NgxPaginationModule } from 'ngx-pagination';
import { ToastrModule ,ToastrService} from 'ngx-toastr';
import { config } from 'rxjs';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AuthGuard } from './AuthGuard _Service/AuthGuard ';
import { AuthService } from './AuthGuard _Service/AuthService ';
import { TokenInterceptor } from './AuthGuard _Service/TokenInterceptor';
import { PushNotificationsService } from './Common/PushNotificationsService';
import { CounterComponent } from './counter/counter.component';
import { DashboardFooterComponent } from './dashboard/dashboard-footer/dashboard-footer.component';
import { DashboardHeaderComponent } from './dashboard/dashboard-header/dashboard-header.component';
import { DashboardMModule } from './dashboard/dashboard-module';
import { DashboardSidemenuComponent } from './dashboard/dashboard-sidemenu/dashboard-sidemenu.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ProductOrderComponent } from './dashboard/ProductList_Main/product-main-component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
import { ForgotComponent } from './ForgotPassword/forgot.component';
import { HeaderComponent } from './header/header.component';
import { BannerComponent } from './home/banner/banner.component';
import { DetailComponent } from './home/detail/detail.component';
import { FooterComponent } from './home/footer/footer.component';
import { HomeComponent } from './home/home.component';
import { OverviewComponent } from './home/overview/overview.component';
import { VideoComponent } from './home/video/video.component';
import { LoginComponent } from './login/login.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { RegisterComponent } from './register/register.component';
import { EncrDecrService } from './services/CryptoService/EncrDecrService ';
import { CustomerService } from './services/Customers/customer.service';
import { QuizService } from './services/Customers/quiz-service';
import { TransfereDataService } from './services/Customers/TransfereDataService ';
import { LoginService } from './services/login/login.service';
import { UpdatePasswordComponent } from './UpdatePassword/updatePassword.component';
import { DashboardContentComponent } from './dashboard/dashboard-content/dashboard-content.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    FetchDataComponent,
    HeaderComponent,
    LoginComponent,
    ProductOrderComponent,
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
    DashboardMModule,
    BrowserModule,
    AppRoutingModule,
    
    
    FormsModule,
    ToastrModule.forRoot({ preventDuplicates: true }), 
    ReactiveFormsModule,
    NgxPaginationModule,
    FilterPipeModule,
    BrowserAnimationsModule,
    HttpClientModule,
    ToastrModule.forRoot(),
    
  ],
  providers: [LoginService, PushNotificationsService, EncrDecrService, CustomerService, 
    QuizService, TransfereDataService, CookieService, AuthService,ToastrService,
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
    CUSTOM_ELEMENTS_SCHEMA,NO_ERRORS_SCHEMA
  ]
})
export class AppModule { }

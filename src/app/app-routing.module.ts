import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './AuthGuard _Service/AuthGuard ';
import { CounterComponent } from './counter/counter.component';
import { DashboardHeaderComponent } from './dashboard/dashboard-header/dashboard-header.component';
import { DashboardSidemenuComponent } from './dashboard/dashboard-sidemenu/dashboard-sidemenu.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ProductOrderComponent } from './dashboard/ProductList_Main/product-main-component';
import { FetchDataComponent } from './fetch-data/fetch-data.component';
import { ForgotComponent } from './ForgotPassword/forgot.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { UpdatePasswordComponent } from './UpdatePassword/updatePassword.component';

const routes: Routes = [  {
  path: '', component: HomeComponent, pathMatch: 'full'
},
{ path: 'counter', component: CounterComponent },
{ path: 'fetch-data', component: FetchDataComponent },
{ path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
{ path: 'login', component: LoginComponent },
{ path: 'order', component: ProductOrderComponent },
{ path: 'dashBoardSideMenu', component: DashboardSidemenuComponent, canActivate: [AuthGuard] },
{ path: 'dashBoardheader', component: DashboardHeaderComponent, canActivate: [AuthGuard] },
{ path: 'register', component: RegisterComponent },
{ path: 'forgotpassword', component: ForgotComponent },
{ path: 'updatePassword/:email', component: UpdatePasswordComponent },
{ path: '**', component: HomeComponent, canActivate: [AuthGuard] },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

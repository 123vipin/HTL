import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard.component';
import { LoginComponent } from '../login/login.component';
import { DashboardContentComponent } from './dashboard-content/dashboard-content.component';
import { AuthGuard } from '../AuthGuard _Service/AuthGuard ';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';

import { SettingComponent } from '../Setting/setting-component';
import { QuizComponent } from '../Quiz/quiz.component';

import { PaperQuizListComponent } from './paper_Quiz/paperQuiz';
import { FeedBackComponent } from '../Feedback/feedback-component';
import { ProductCategoryComponent } from './ProductCategory/product-category-component';
import { ProductListComponent } from './ProductList/product-list-component';
import { ProductComponent } from '../NewProduct/new-product.component';

const routes: Routes = [
  {
    path: 'dashboard',
    component: DashboardComponent,
    children: [
      { path: '', component: DashboardContentComponent, pathMatch: 'full', canActivate: [AuthGuard] },
      { path: 'Dashboardpage', component: DashboardContentComponent, canActivate: [AuthGuard] },
      { path: 'logout', component: LoginComponent, canActivate: [AuthGuard] },
      { path: 'setting', component: SettingComponent, canActivate: [AuthGuard] },
      { path: 'feedback', component: FeedBackComponent, canActivate: [AuthGuard] },
      { path: 'quiz/:id', component: QuizComponent, canActivate: [AuthGuard] },
      { path: 'product-category', component: ProductCategoryComponent, canActivate: [AuthGuard] },
      { path: 'productList', component: ProductListComponent, canActivate: [AuthGuard] },
      { path: 'paperQuiz', component: PaperQuizListComponent, canActivate: [AuthGuard] },
      { path: 'new-product/:id/:name', component: ProductComponent, canActivate: [AuthGuard] },
    ]
  }
]; 

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  declarations: [],
  providers: [{ provide: LocationStrategy, useClass: HashLocationStrategy }]
})
export class DashboardRouteModule { }

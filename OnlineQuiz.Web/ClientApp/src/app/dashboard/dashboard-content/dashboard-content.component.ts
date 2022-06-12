import { Component, ElementRef, Inject, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { LoginService } from '../../services/login/login.service';

import { NgxSpinnerService } from 'ngx-spinner';
import { ToastrService } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { EncryptionService } from '../../Common/EncryptionService';


@Component({
  selector: 'app-dashboard-content',
  templateUrl: './dashboard-content.component.html',
  styleUrls: ['./dashboard-content.component.css']
})
export class DashboardContentComponent implements OnInit {
  dashBoard: any;
  userId: any;
  profileList: any;
  profileVisiorList: any;
  profileResponseList: any;
  profileAcceptedList: any;
  @ViewChild('widgetsContent') widgetsContent: ElementRef;
  constructor(@Inject(LoginService) private loginService: LoginService, @Inject(EncryptionService)private encrypt: EncryptionService,
    @Inject(Router) private router: Router, @Inject(CookieService) private cookieService: CookieService, @Inject(ToastrService)private toastr: ToastrService,
     @Inject(NgxSpinnerService) private spinner: NgxSpinnerService
  ) { }
  ngOnInit() {
    this.spinner.show();
    this.getAllDashBoardRecord();
    
    this.spinner.hide();
  }
  getAllDashBoardRecord() {
    this.userId = this.cookieService.get('userId');
    this.loginService.getAllDashBoardRecord(this.userId).subscribe((data): any => {
      debugger
      this.dashBoard = data;
    });
  }
  scrollLeft() {
    this.widgetsContent.nativeElement.scrollLeft -= 150;
  }

  scrollRight() {
    this.widgetsContent.nativeElement.scrollLeft += 150;
  }


  allProfileViewList(type) {
    var encrypted = this.encrypt.set('123456$#@$^@1ERF', type);
debugger
    this.router.navigate(['dashboard/quizList', encrypted]);
  }
}

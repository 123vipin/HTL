import { Component, Inject, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { EncryptionService } from '../../Common/EncryptionService';
@Component({
  selector: 'app-dashboard-sidemenu',
  templateUrl: './dashboard-sidemenu.component.html',
  styleUrls: ['./dashboard-sidemenu.component.css']
})
export class DashboardSidemenuComponent implements OnInit {
  userType: any;
  oneAtATime: boolean;
  constructor(@Inject(CookieService) private cookieService: CookieService, @Inject(Router) private router: Router, @Inject(EncryptionService) private encrypt: EncryptionService,) { }

  ngOnInit() {
    this.userType = this.cookieService.get('userType');
    this.oneAtATime = true;
    
  }
  allProfileViewList(type) {
    var encrypted = this.encrypt.set('123456$#@$^@1ERF', type);
    debugger
    this.router.navigate(['dashboard/quizList', encrypted]);
  }
}

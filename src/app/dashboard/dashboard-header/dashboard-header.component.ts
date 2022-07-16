import { Component, OnInit, Input, Output, EventEmitter, Inject } from '@angular/core';
import { Router } from '@angular/router';
import { LoginService } from '../../services/login/login.service';
import { CookieService } from 'ngx-cookie-service';
//AnimationStyles
@Component({
  selector: 'app-dashboard-header',
  templateUrl: './dashboard-header.component.html',
  styleUrls: ['./dashboard-header.component.css']
})
export class DashboardHeaderComponent implements OnInit {

  @Output() valueChange = new EventEmitter<any>();
  active: boolean = false;
  userName: any;
  userId: any;
  constructor(@Inject(LoginService) private loginService: LoginService,
    @Inject(Router) private router: Router, @Inject(CookieService) private cookieService: CookieService) { }

  ngOnInit() {
    this.userName = this.cookieService.get('userCookies');
    this.userId = this.cookieService.get('userId');    
    if (this.userName == "" || this.userName == "" || this.userName==null) {
      this.Logout();
    }
  }
  items: string[] = [
    'The first choice!',
    'And another choice for you.',
    'but wait! A third!'
  ];
  onHidden(): void {
    console.log('Dropdown is hidden');
  }
  onShown(): void {
    console.log('Dropdown is shown');
  }
  isOpenChange(): void {
    console.log('Dropdown state is changed');
  }

  navbarToggle(isActive:boolean) {
    this.active = !isActive;
    this.valueChange.emit(this.active);
  }
  Logout() {
    this.loginService.Logout().subscribe((data): any => {
      if (data) {
        sessionStorage.clear();
        localStorage.removeItem("LoggedInUser");
        this.cookieService.deleteAll('userCookies');        
        this.router.navigate(['/login']);
      }
      //this.valid = data;
    });
  }
}

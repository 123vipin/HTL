import { Component, OnInit, HostListener, Inject } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  
  constructor(  @Inject(CookieService) private cookieService: CookieService,) { }
  cookieValue: any;
  ngOnInit() {
    this.cookieValue = this.cookieService.get('Test');
   
  }

  navbarOpen = false;
  toggleNavbar() {
    this.navbarOpen = !this.navbarOpen;
  }
    
  IsHeaderfixed: boolean;

  @HostListener('window:scroll', [])
  OnWindowScroll() {
    if (window.scrollY > 82) {
      this.IsHeaderfixed = true;
    } else {
      this.IsHeaderfixed = false;
    }
  }
 
}

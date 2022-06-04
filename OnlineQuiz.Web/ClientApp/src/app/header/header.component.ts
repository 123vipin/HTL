import { Component, OnInit, HostListener, Inject, ViewChild } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { OverviewComponent } from '../home/overview/overview.component';
import { TransfereDataService } from '../services/Customers/TransfereDataService ';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  @ViewChild(OverviewComponent) private myChild: OverviewComponent;
  constructor(@Inject(CookieService) private cookieService: CookieService, @Inject(TransfereDataService) private cmmonService: TransfereDataService) { }
  cookieValue: any;

  ngOnInit() {
    this.cookieValue = this.cookieService.get('Test');
    this.getData('Reasoning');
  }

  navbarOpen = false;
  toggleNavbar() {
    this.navbarOpen = !this.navbarOpen;
  }

  getData(text) {
    
    this.cmmonService.notifyOther({ option: 'onSubmit', value: text });

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

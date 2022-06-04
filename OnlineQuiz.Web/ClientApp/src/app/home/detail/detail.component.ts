import { Component, OnInit, Inject} from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { LoginService } from '../../services/login/login.service';
@Component({
  selector: 'app-detail',
  templateUrl: './detail.component.html',
  styleUrls: ['./detail.component.css']
})
export class DetailComponent implements OnInit {
  userId: any;
  constructor(@Inject(Router) private router: Router,
    @Inject(LoginService) private loginService: LoginService, @Inject(CookieService) private cookieService: CookieService,) { }

  ngOnInit() {
    this.userId = this.cookieService.get('userId');
  }
  attemtQuiz() {
    if (this.userId > 0) {
      this.router.navigate(['/dashboard']);
    }
    else {
      this.router.navigate(['/login']);
    }
  
   
  }
}

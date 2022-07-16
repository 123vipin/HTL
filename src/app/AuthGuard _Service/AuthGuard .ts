
import { Inject, Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';

import { AuthService } from '../AuthGuard _Service/AuthService ';
import {Router} from '@angular/router';
import { Observable } from 'rxjs/internal/Observable';
@Injectable()
export class AuthGuard implements CanActivate {
  constructor(@Inject(AuthService)private auth: AuthService,
    @Inject(Router)private myRoute: Router){
  }
  
  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {  
    if (this.auth.isLoggednIn()) {

      return true;
    } else {      
      this.myRoute.navigate(["login"]);
      return false;
    }
  }
}

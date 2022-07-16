import { Inject, Injectable } from '@angular/core';
import { Router } from '@angular/router';
@Injectable()
export class AuthService {
  constructor(@Inject(Router)private myRoute: Router) {
    //setTimeout(() => {
    //  localStorage.clear();
    //  localStorage.removeItem("LoggedInUser");
    //}, 10);
  }
 
  sendToken(token: string) { 
    debugger
  localStorage.setItem("LoggedInUser", token)
  
}
  getToken() {
    debugger
  return localStorage.getItem("LoggedInUser")

}
  isLoggednIn() {
    
  return this.getToken() !== null;

}
  logout() {
    
  localStorage.removeItem("LoggedInUser");

  this.myRoute.navigate(["Login"]);

}


}

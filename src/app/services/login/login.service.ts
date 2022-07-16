import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class LoginService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
  loginUser(username :any, password :any) {
    const body: any = {
      userName: username,
      password: password
    }
debugger
    return this.http.post(this.rootUrl + '/api/Login/Login', body);
  }
  getAllDashBoardRecord(userId :any) {
    return this.http.get(this.rootUrl + '/api/Login/GetAllDashBoardRecord/' + userId);
  }
  Logout() {
    return this.http.get(this.rootUrl + '/api/Login/Logout');

  } 
  SaveUser(model :any) {
    debugger
    return this.http.post(this.rootUrl + '/api/Login/SaveUser', model);
  }
  ForgotSendMailPassword(model :any, mail :any) {
    model.encraptedMail = mail;
    
    return this.http.post(this.rootUrl + '/api/Login/ForgotSendMailPassword', model);
  }
  UpdatePassword(model :any, mail :any) {
    model.userId = mail;

    return this.http.post(this.rootUrl + '/api/Login/UpdatePassword', model);
  }

  sendOTP(mobileNo :any) {
    
    debugger
    return this.http.get(this.rootUrl + '/api/Login/SendOtpAsync/' + mobileNo);

  }
  saveItem(model :any) {
    debugger
    return this.http.post(this.rootUrl + '/api/Quiz/SaveProduct', model);
  }
  SaveSuggestion(model:any, mail :any) {
    model.userId = mail;

    return this.http.post(this.rootUrl + '/api/Login/SaveSuggestion', model);
  }
  getproductDatabyId(id:any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetproductDatabyId/' + id);
  }
}

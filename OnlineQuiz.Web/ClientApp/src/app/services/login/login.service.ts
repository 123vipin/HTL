import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class LoginService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
  loginUser(username, password) {
    const body: any = {
      userName: username,
      password: password
    }
debugger
    return this.http.post(this.rootUrl + '/api/Login/Login', body);
  }
  getAllDashBoardRecord(userId) {
    return this.http.get(this.rootUrl + '/api/Login/GetAllDashBoardRecord/' + userId);
  }
  Logout() {
    return this.http.get(this.rootUrl + '/api/Login/Logout');

  } 
  SaveUser(model) {
    debugger
    return this.http.post(this.rootUrl + '/api/Login/SaveUser', model);
  }
  ForgotSendMailPassword(model, mail) {
    model.encraptedMail = mail;
    
    return this.http.post(this.rootUrl + '/api/Login/ForgotSendMailPassword', model);
  }
  UpdatePassword(model, mail) {
    model.userId = mail;

    return this.http.post(this.rootUrl + '/api/Login/UpdatePassword', model);
  }

  sendOTP(mobileNo) {
    
    debugger
    return this.http.get(this.rootUrl + '/api/Login/SendOtpAsync/' + mobileNo);

  }
  AddQuestion(model) {
    debugger
    return this.http.post(this.rootUrl + '/api/Quiz/AddQuestion', model);
  }
  SaveSuggestion(model, mail) {
    model.userId = mail;

    return this.http.post(this.rootUrl + '/api/Login/SaveSuggestion', model);
  }

}

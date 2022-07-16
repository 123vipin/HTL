import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class ProfileViewService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
  
  getRecentJoinProfile(userId, GetValue, skipValue) {
    return this.http.get(this.rootUrl + '/api/ProfileView/GetAllRecentJoin/' + userId + '/' + GetValue + '/' + skipValue );

  }
  getprofileReceivedResponseList(userId, GetValue, skipValue, statusType) {
    return this.http.get(this.rootUrl + '/api/ProfileView/GetprofileReceivedResponseList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }

  getAllSendInterset(userId, GetValue, skipValue, statusType) {
    return this.http.get(this.rootUrl + '/api/ProfileView/GetAllSendInterset/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }
  
  connect(model) {
    return this.http.post(this.rootUrl + '/api/ProfileView/Connect' , model);

  }
  getprofileVisiorList(userId) {
    return this.http.get(this.rootUrl + '/api/ProfileView/Visitors/' + userId);

  }
  
} 

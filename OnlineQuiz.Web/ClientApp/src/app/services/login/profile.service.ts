import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class ProfileService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
  
  getHeightList() {
    return this.http.get(this.rootUrl + '/api/Profile/GetHeightList');

  }
  getCityList(stateId) {
    return this.http.get(this.rootUrl + '/api/Profile/GetCityList/' + stateId);

  } 
  SaveProfile(model) {
   
    debugger
    return this.http.post(this.rootUrl + '/api/Profile/SaveUserProfile', model);
  }
  getProfileData(userId) {
    return this.http.get(this.rootUrl + '/api/Profile/GetProfileData/' + userId );
  }
  getImageList(userId) {
    return this.http.get(this.rootUrl + '/api/Upload/GetImageList/' + userId);
  }
  deleteImage(model) {
    return this.http.post(this.rootUrl + '/api/Upload/DeleteImage' , model);
  }
  getProfileViewData(userId, profileUserid) {
   
    return this.http.get(this.rootUrl + '/api/Profile/GetProfileViewData/' + userId + '/' + profileUserid);
  }
  
  }

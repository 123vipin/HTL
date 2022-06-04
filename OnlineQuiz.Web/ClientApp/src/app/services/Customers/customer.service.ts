import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class CustomerService {
  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) { }
  addcustomer(formData) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/InsertCustomer', formData);
  }

  updateCustomer(formData) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/UpdateCustomer', formData);
  }

  getAllcustomer(userType) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetAllCustomers/' + userType);
  }

  getCustomer(id) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetCustomer/' + id);
  }

  getUserAccounts(id) {    
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetUserAccounts/' + id);
  }

  updateUserCredentials(formData, id, loginUserId) {
    formData[0].userId = id;
    formData[0].loginUserId = loginUserId;

    return this.http.post(this.rootUrl + '/api/ManageCustomers/UpdateUserCredentials', formData);
  }
  saveBookMaker(formData) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/SaveBookMaker', formData);
  }
  getBookMakersList(id) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetBookMakersList/' + id);
  }
  activeUserAccount(formData) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/ActiveUserAccount', formData);
  }
  updateUserStatusActive(id) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/UpdateUserStatusActive/' + id);
  }
  saveWalletDetails(formData) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/SaveWalletDetails', formData);
  }
  getWalletDetailsByUserId(id) {    
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetWalletDetailsByUserId/' + id);
  }
  getQuestionList() {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetQuestionList');
  }
  getClientAccountDetails(formData) {    
    return this.http.post(this.rootUrl + '/api/ManageCustomers/GetClientAccountDetails/',formData);
  }
  getAllUserBookMakersAccountLoginList() {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetAllUserLoginCheckList');
  }
  updateLoginCheckByClient(model) {    
    return this.http.post(this.rootUrl + '/api/ManageCustomers/UpdateLoginCheckByClient',model);
  }

}



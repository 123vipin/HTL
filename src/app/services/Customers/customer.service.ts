import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class CustomerService {
  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) { }
  addcustomer(formData :any) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/InsertCustomer', formData);
  }

  updateCustomer(formData :any) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/UpdateCustomer', formData);
  }

  getAllcustomer(userType :any) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetAllCustomers/' + userType);
  }

  getCustomer(id :any) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetCustomer/' + id);
  }

  getUserAccounts(id :any) {    
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetUserAccounts/' + id);
  }

  updateUserCredentials(formData :any, id :any, loginUserId :any) {
    formData[0].userId = id;
    formData[0].loginUserId = loginUserId;

    return this.http.post(this.rootUrl + '/api/ManageCustomers/UpdateUserCredentials', formData);
  }
  saveBookMaker(formData :any) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/SaveBookMaker', formData);
  }
  getBookMakersList(id :any) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetBookMakersList/' + id);
  }
  activeUserAccount(formData :any) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/ActiveUserAccount', formData);
  }
  updateUserStatusActive(id :any) {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/UpdateUserStatusActive/' + id);
  }
  saveWalletDetails(formData :any) {
    return this.http.post(this.rootUrl + '/api/ManageCustomers/SaveWalletDetails', formData);
  }
  getWalletDetailsByUserId(id :any) {    
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetWalletDetailsByUserId/' + id);
  }
  getQuestionList() {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetQuestionList');
  }
  getClientAccountDetails(formData :any) {    
    return this.http.post(this.rootUrl + '/api/ManageCustomers/GetClientAccountDetails/',formData);
  }
  getAllUserBookMakersAccountLoginList() {
    return this.http.get(this.rootUrl + '/api/ManageCustomers/GetAllUserLoginCheckList');
  }
  updateLoginCheckByClient(model :any) {    
    return this.http.post(this.rootUrl + '/api/ManageCustomers/UpdateLoginCheckByClient',model);
  }

}



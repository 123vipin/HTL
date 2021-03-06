import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class ProductCategoryService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
 
  saveProductCategory(model) {
    return this.http.post(this.rootUrl + '/api/Quiz/saveProductCategory', model);
  }
  getProductCategoryList(userId, GetValue, skipValue) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetProductCategoryList/' + userId + '/' + GetValue + '/' + skipValue );

  }
  
  getProductList(userId, GetValue, skipValue, statusType) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetProductList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }
  
}

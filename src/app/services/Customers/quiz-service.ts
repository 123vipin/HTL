import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class QuizService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
  

  getProductList(userId :any, GetValue :any, skipValue :any, statusType :any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetProductList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }
  getPaperList(userId :any, GetValue :any, skipValue :any, statusType :any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetPaperList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }
  getQuizById(userId :any, GetValue :any, skipValue :any, testId :any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetQuizById/' + userId + '/' + GetValue + '/' + skipValue + '/' + testId);

  }



  
  
  saveTestSeries(model :any) {
    debugger
    return this.http.post(this.rootUrl + '/api/Quiz/SaveTestSeries', model);

  }
  savePaperSeries(model :any) {
    return this.http.post(this.rootUrl + '/api/Quiz/SavePaperSeries', model);

  }
  publish(testId :any) {
    debugger
    return this.http.get(this.rootUrl + '/api/Quiz/Publish/' +  testId);

  }
  getQuestionList(userid :any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetQuestionType/' + userid);

  }
  getAllPaperList(userid:any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetAllPaperList/' + userid);

  }

  getPaper(userId :any, GetValue :any, skipValue :any, statusType :any) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetPaperAllList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }

} 


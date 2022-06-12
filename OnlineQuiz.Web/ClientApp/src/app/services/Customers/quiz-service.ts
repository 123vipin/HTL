import { Inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class QuizService {

  private rootUrl = config.getEnvironmentVariable('endPoint');
  constructor(@Inject(HttpClient)private http: HttpClient) {   
  }
  

  getProductList(userId, GetValue, skipValue, statusType) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetProductList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }
  getPaperList(userId, GetValue, skipValue, statusType) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetPaperList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }
  getQuizById(userId, GetValue, skipValue, testId) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetQuizById/' + userId + '/' + GetValue + '/' + skipValue + '/' + testId);

  }



  
  
  saveTestSeries(model) {
    debugger
    return this.http.post(this.rootUrl + '/api/Quiz/SaveTestSeries', model);

  }
  savePaperSeries(model) {
    return this.http.post(this.rootUrl + '/api/Quiz/SavePaperSeries', model);

  }
  publish(testId) {
    debugger
    return this.http.get(this.rootUrl + '/api/Quiz/Publish/' +  testId);

  }
  getQuestionList(userid) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetQuestionType/' + userid);

  }
  getAllPaperList(userid) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetAllPaperList/' + userid);

  }

  getPaper(userId, GetValue, skipValue, statusType) {
    return this.http.get(this.rootUrl + '/api/Quiz/GetPaperAllList/' + userId + '/' + GetValue + '/' + skipValue + '/' + statusType);

  }

} 



import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class PlacedBetStatusReport {
  private readonly rootUrl = config.getEnvironmentVariable('endPoint');

  constructor(private http: HttpClient) { }

  getAllLastPlacedBetStatus() {
    return this.http.get(this.rootUrl + '/api/BetPlacedStatusReport/GetAllLastPlacedBetStatus');
  }
  getOperatorList(model) {
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/GetAllEnterUrlCountClientWise',model);
  }

}


import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { config } from '../../UrlConfig';

@Injectable()
export class PlacedbetReportAnaylsis {
  private readonly rootUrl = config.getEnvironmentVariable('endPoint');

  constructor(private http: HttpClient) { }

  getTotalBetStatusReport(model) {

    return this.http.post(this.rootUrl + '/api/Tradefeeds/GetTotalStatsByUser', model);
  }
  getAllBetStatusReportDayWise(model) {

    return this.http.post(this.rootUrl + '/api/Tradefeeds/GetTotalStatsOfUserGroupByDate', model);
  }

  getAllBetPieChartResult(model) {

    return this.http.post(this.rootUrl + '/api/Tradefeeds/GetAllBetPieChartResult', model);
  }
  GetAllBetperformanceByOdds(model) {

    return this.http.post(this.rootUrl + '/api/Tradefeeds/GetAllBetperformanceByOdds', model);
  }
  getAllBetStatusReportDayWiseOnDashBoard(Type) {
    return this.http.get(this.rootUrl + '/api/Tradefeeds/GetAllBetStatusReportDayWiseOnDashBoard/' + Type);
  }
  getAllPlacedBetReportOnGraph(model, date) {
    model.startDate = date;
    model.endDate = date;
    return this.http.post(this.rootUrl + '/api/Tradefeeds/GetAllPlacedBetReportOnGraph', model);
  }

  getOddsVarianceExcelList(model) {
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/GenerateOddsVarianceExcel', model);
  }

  getBookmakerVarianceConstants(model) {
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/GetBookmakerVarianceConstants', model);
  }
  getOddsVarianceBookMakersList() {
    return this.http.get(this.rootUrl + '/api/TradefeedsOddsVariance/GetOddsVarianceBookMakersList');
  }
  getBookmakerVariance(model) {
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/GetBookmakerVariance', model);
  }
  getBookmakerVarianceConstantsList() {
    return this.http.get(this.rootUrl + '/api/TradefeedsOddsVariance/GetBookmakerVarianceConstantsList');
  }
  getAllBookmakers(model) {
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/GetAllBookmakers', model);
  }
  getAllBetReport(model, oddsRange) {
    model.type = oddsRange;
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/GetAllBetReport', model);
  }
  upadateOddsVariance(model, id) {
    model.id = id;
    return this.http.post(this.rootUrl + '/api/TradefeedsOddsVariance/UpdateBookmakerVarianceConstant', model);
  }
}

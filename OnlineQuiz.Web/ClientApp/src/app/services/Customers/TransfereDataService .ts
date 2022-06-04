import { Inject, Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Subject } from 'rxjs';
@Injectable()
export class TransfereDataService {

  constructor(@Inject(Router)private router: Router) { }
  private data;
  private notify = new Subject<any>();
  /**
   * Observable string streams
   */
  notifyObservable$ = this.notify.asObservable();
  setData(data) {
    this.data = data;
  }

  getData() {
    let temp = this.data;
    this.clearData();
    return temp;
  }

  clearData() {
    this.data = undefined;
  }
  public notifyOther(data: any) {
    if (data) {
      this.notify.next(data);
    }
  }

}

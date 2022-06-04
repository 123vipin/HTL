import { Inject, Injectable } from '@angular/core';
import {
  HttpInterceptor,
  HttpRequest,
  HttpResponse,
  HttpErrorResponse,
  HttpHandler,
  HttpEvent
} from '@angular/common/http';

import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/do';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
import { NgxSpinnerService } from "ngx-spinner";
import { Router } from '@angular/router';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {
 // constructor(@Inject(Router)private spinner: NgxSpinnerService) { }
  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    // add custom header
  //  this.spinner.show();
    const customReq = request.clone({
      headers: request.headers.set('app-author', 'Dzhavat')
    });
   
    console.log('processing request', customReq);

    // pass on the modified request object
    return next
      .handle(customReq)
      .do((ev: HttpEvent<any>) => {
        if (ev instanceof HttpResponse) {
          debugger
          console.log('processing response', ev);
       //   this.spinner.hide();
        }
      })
      .catch(response => {
        if (response instanceof HttpErrorResponse) {
          console.log('processing http error', response);
        }

        return Observable.throw(response);
      });
  }
}

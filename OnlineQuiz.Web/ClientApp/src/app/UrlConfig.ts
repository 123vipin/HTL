
import { Injectable, OnInit, Directive } from '@angular/core';
import { Http, Response } from '@angular/http';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
@Injectable()
export class config {
  data: any;
  constructor() { }
  public static getEnvironmentVariable(value) {
    var environment: string;
    var data = {};
    environment = window.location.hostname;
    switch (environment) {
      case 'localhost':
        data = {
          endPoint: 'http://localhost:52395'
        };
        break;
      default:
        data = {
          endPoint:'https://apinew12.azurewebsites.net',
        };
    }
    return data[value];
  }

}

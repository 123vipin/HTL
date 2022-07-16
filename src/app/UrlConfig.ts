
import { Injectable, OnInit, Directive } from '@angular/core';

@Injectable()
export class config {
  data: any;
  static data: string;
  constructor() { }
  public static getEnvironmentVariable(value:any) {
    var environment: string;
  
    environment = window.location.hostname;
    switch (environment) {
      case 'localhost':
        
          this.data= 'http://localhost:52395'
       
        break;
      default:
        
          this.data='https://apinew12.azurewebsites.net';
       
    }
    return this.data;
  }

}

import { Component, OnInit } from '@angular/core';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {

  isActive: boolean;
  constructor() { }

  ngOnInit() {
  }

  displayMenu($event: boolean){
    this.isActive = $event;
  }
  
}



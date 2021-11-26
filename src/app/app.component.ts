
import { Component,OnInit,DoCheck } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
import { BehaviorSubject } from 'rxjs';
import { LoginComponent } from './components/login/login.component';
import { ApiService } from './servicio/home.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  
  public title = 'WORKI - SOCIAL NETWORK';
  description = 'Benvenido a su nueva red social';
}




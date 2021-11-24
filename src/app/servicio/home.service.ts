import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../models/user'

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  URL_API = 'http://localhost:9898/AskEstadoExtensiones';

  constructor(private httpClient : HttpClient) { }

  getReporteS(){
    return this.httpClient.get<User>(this.URL_API);
   }
}

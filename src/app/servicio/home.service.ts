import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { LoginI } from '../models/login.interface';
import { ResponseI } from '../models/response.interface'
import { Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class ApiService {

  url:string = 'https://worki.azurewebsites.net/api/login/authenticate';
   
  //servicio para conectarse al post de login
  constructor(private http: HttpClient) { }
  loginByEmai(form:LoginI):Observable<ResponseI>{
    let direccion = this.url + "auth";
    return this.http.post<ResponseI>(direccion,form);

  }

}

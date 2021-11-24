
import{Component, OnInit} from '@angular/core';
import{FormGroup,FormControl,Validator, Validators}from '@angular/forms';
import{ApiService} from  '../../servicio/home.service';
import {LoginI} from '../../models/login.interface'
@Component({
    selector:'login',
    templateUrl:'./login.component.html'
})

export class LoginComponent implements OnInit {
    public title:string;
    loginForm = new FormGroup({
        usuario : new FormControl('',Validators.required),
        password : new FormControl('',Validators.required)
    })
    constructor(private api:ApiService){
        this.title = 'Iniciar sesion';   
    }
    ngOnInit(){
        console.log('Cargando componente de login...');
    }
    onLogin (form:LoginI){
    this.api.loginByEmai(form).subscribe(data =>{console.log(data);})
    }
    
}

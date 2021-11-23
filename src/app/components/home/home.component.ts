import{Component, OnInit} from '@angular/core';
@Component({
    selector:'home',
    templateUrl:'./home.component.html',
})

export class HomeComponent implements OnInit {
    public title:string;
    public nickname:string;
    public name:string;
    
    constructor(){
        this.title = 'BIENVENIDO A WORKI';
        this.nickname ='Nick de usuario';
        this.name ='nombre de usuario'
    }

    ngOnInit(){
        console.log('Cargando componente de HOME...');
    }
}
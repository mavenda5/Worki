import{ NgModule} from '@angular/core';
import{ Routes,RouterModule} from '@angular/router';

//importar componentes
import { LoginComponent } from './components/login/login.component';
import { HomeComponent }  from './components/home/home.component';

const appRoutes: Routes = [
    {path:'',component: HomeComponent},
    {path:'home',component: HomeComponent},
    {path:'login', component: LoginComponent}
    
];

export const appRoutingProviders: any []=[];
export const routing: NgModule = RouterModule.forRoot (appRoutes);
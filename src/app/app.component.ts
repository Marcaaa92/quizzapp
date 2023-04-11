import { Component } from '@angular/core';
import { LoginGuard } from './services/auth/guard/login.guard';
import { AuthService } from './services/auth/auth-service.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'quizzapp';
  constructor(private auth: LoginGuard, private authService: AuthService){
    if(sessionStorage.length==0){
      authService.logout();
    }
    else{
      authService.login();
    }
  }
}

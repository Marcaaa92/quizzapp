import { Component } from '@angular/core';
import { AuthService } from './services/auth/auth-service.service';
import { ApiUserService } from './services/api/api-user.service';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'quizzapp';
  baseUrl?: String;
  constructor(
    public authService: AuthService,
    private apiUserService: ApiUserService,
    ) {
    if (sessionStorage.length == 0) {
      authService.logout();
    } else {
      var json = sessionStorage.getItem('user');
      if (json) {
        var data = JSON.parse(json);
        if (data) {
          var token = data['token'];
          this.apiUserService.checkTokenValidity(token).subscribe({
            next: () => {
              authService.login();
            },
            error: () => {
              authService.logout();
            },
          });
        }
        else{
          authService.logout();
        }
      }
      else{
        authService.logout();
      }
    }
  }
}

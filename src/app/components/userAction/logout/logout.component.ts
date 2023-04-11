import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/services/auth/auth-service.service';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.css'],
})
export class LogoutComponent {
  constructor(private auth: AuthService, private router: Router) {
    auth.logout();
    sessionStorage.removeItem('user');
    this.router.navigate(['/login']);
  }
}

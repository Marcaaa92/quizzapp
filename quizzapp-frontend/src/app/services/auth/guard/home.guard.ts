import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../auth-service.service';

@Injectable({
  providedIn: 'root',
})
export class HomeGuard{
  constructor(private authService: AuthService, private router: Router) {}

  canActivate() {
    this.authService.isAuthenticated().then((authenticated) => {
      if (!authenticated) {
        return true;
      } else {
        this.router.navigate(['home']);
        return false;
      }
    });
  }
}

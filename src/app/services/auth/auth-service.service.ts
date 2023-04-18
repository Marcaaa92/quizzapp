import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  isLoggedIn = false;
  constructor() {}
  login() {
    this.isLoggedIn = true;
  }
  logout() {
    sessionStorage.clear()
    this.isLoggedIn = false;
  }
  isAuthenticated() {
    return new Promise<boolean>((resolve, reject) => {
      setTimeout(() => {
        resolve(this.isLoggedIn);
      }, 100);
    });
  }
}

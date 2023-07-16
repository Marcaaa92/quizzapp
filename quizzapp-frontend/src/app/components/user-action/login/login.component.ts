import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { SocialAuthService, SocialUser } from '@abacritt/angularx-social-login';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { AuthService } from 'src/app/services/auth/auth-service.service';
import { RedirectUtils } from 'src/app/utils/redirect.utils';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  feedback: string = '';
  form: FormGroup;
  @ViewChild('submit') submit!: ElementRef;
  user?: SocialUser;


  constructor(
    private service: ApiUserService,
    public auth: AuthService,
    private router: Router,
    private authService: SocialAuthService
  ) {
    this.form = new FormGroup({
      email: new FormControl('', [Validators.required]),
      password: new FormControl('', [Validators.required]),
      recaptcha: new FormControl([Validators.required])
    });
  }

  ngOnInit() {
    this.authService.authState.subscribe((user) => {
      this.user = user;
      this.service.loginGoogle(this.user.idToken).subscribe({
        next: (response) => {
          if (response.statusCode == 200) {
            sessionStorage.setItem('user', JSON.stringify(response.msg));
            this.form.reset();
            this.auth.login();
            this.feedback = 'Accesso effettuato, Reindirizzamento in corso...';
            new RedirectUtils(this.router, 0, 'home');
          }
        },
        error: (err) => {
          if (err.error.statusCode == 401) {
            this.form.reset();
            this.feedback = 'Credenziali errate';
          }
          if (err.error.statusCode == 404) {
            this.form.reset();
            this.feedback = 'Credenziali errate';
          }
        },
      });
    });
  }
  
  login() {
    this.submit.nativeElement.disabled=true;
    console.log(JSON.stringify(this.form.value));
    this.service.login(this.form.value).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          sessionStorage.setItem('user', JSON.stringify(response.msg));
          this.form.reset();
          this.auth.login();
          this.feedback = 'Accesso effettuato, Reindirizzamento in corso...';
          new RedirectUtils(this.router, 0, 'home');
        }
      },
      error: (err) => {
        if (err.error.statusCode == 401) {
          this.form.reset();
          this.feedback = 'Credenziali errate';
        }
        if (err.error.statusCode == 404) {
          this.form.reset();
          this.feedback = 'Credenziali errate';
        }
      },
    });
  }
}

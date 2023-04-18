import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
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
  constructor(
    private service: ApiUserService,
    private auth: AuthService,
    private router: Router
  ) {
    this.form = new FormGroup({
      email: new FormControl('', [Validators.required]),
      password: new FormControl('', [Validators.required]),
    });
  }
  login() {
    console.log(JSON.stringify(this.form.value));
    this.service.login(this.form.value).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          sessionStorage.setItem('user', JSON.stringify(response.msg));
          this.auth.login();
          this.feedback = 'Loggato';
          this.form.reset();
          new RedirectUtils(this.router, 0, "/create");
        }
      },
      error: (err) => {
        if (err.error.statusCode == 401) {
          this.feedback = 'Credenziali errate';
          this.form.reset();
        }
      },
    })
  }
}

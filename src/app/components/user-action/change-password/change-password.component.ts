import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { AuthService } from 'src/app/services/auth/auth-service.service';
import { RedirectUtils } from 'src/app/utils/redirect.utils';
import { MatchPasswordValidator } from 'src/app/validators/password-match.validator';
import { Environment } from 'src/environments/environment';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css'],
})
export class ChangePasswordComponent {
  feedback: string = '';
  form: FormGroup;
  @ViewChild('submit') submit!: ElementRef;
  constructor(
    private service: ApiUserService,
    private auth: AuthService,
    private router: Router
  ) {
    this.form = new FormGroup(
      {
        oldPassword: new FormControl('', [Validators.required]),
        password: new FormControl('', [
          Validators.required,
          Validators.pattern(
            /^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&?\."]).*$/
          ),
        ]),
        password2: new FormControl('', [Validators.required]),
      },
      [
        MatchPasswordValidator.MatchValidator('password', 'password2'),
        MatchPasswordValidator.DontMatchValidator('password', 'oldPassword'),
      ]
    );
  }
  changePassword() {
    this.submit.nativeElement.disabled=true;
    var email = Environment.getEmail();
    if (email) {
        this.form.value.email = email;
        console.log(JSON.stringify(this.form.value));
        this.service.changePassword(this.form.value).subscribe({
          next: (response) => {
            if (response.statusCode == 200) {
              this.feedback = 'Password cambiata';
              this.form.reset();
              setTimeout(() => {
                this.auth.logout;
              }, 200);
              location.reload();
              console.log(response);
            }
            new RedirectUtils(this.router, 2500, 'login');
          },
          error: (error) => {
            if (error.error.statusCode == 401) {
              this.feedback = 'password attuale errata';
              this.form.controls['email'].reset();
            }
          },
        });
      } else {
        this.feedback = "non sei autenticato"
      }
  }
}

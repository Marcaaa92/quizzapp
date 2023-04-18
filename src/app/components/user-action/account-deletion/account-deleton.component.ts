import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { AuthService } from 'src/app/services/auth/auth-service.service';
import { AccountDeletionConfirm } from 'src/app/validators/account-deletion-confirm.validator';

@Component({
  selector: 'app-login',
  templateUrl: './account-deletion.component.html',
  styleUrls: ['./account-deletion.component.css'],
})
export class AccountDeletion {
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
      verify: new FormControl('', [Validators.required])
    },
    [AccountDeletionConfirm.MatchValidator('verify')]);
  }
  deletion() {
    console.log(JSON.stringify(this.form.value));
    this.service.accountDeletion(this.form.value).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          this.auth.logout();
          this.router.navigate(["/login"])
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

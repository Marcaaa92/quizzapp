import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { RedirectUtils } from 'src/app/utils/redirect.utils';
import { MatchPasswordValidator } from 'src/app/validators/password-match.validator';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.css'],
})
export class ConfirmResetComponent {
  @ViewChild('submit') submit!: ElementRef;
  feedback: string = '';
  form: FormGroup;
  token: string | null;
  constructor(
    private route: ActivatedRoute,
    private service: ApiUserService,
    private router: Router
  ) {
    this.token = this.route.snapshot.paramMap.get('token');
    this.form = new FormGroup(
      {
        password: new FormControl('', [
          Validators.required,
          Validators.pattern(
            /^.*(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&?\."]).*$/
          ),
        ]),
        password2: new FormControl('', [Validators.required]),
      },
      [MatchPasswordValidator.MatchValidator('password', 'password2')]
    );
  }
  change() {
    this.form.value.token = this.token;
    this.submit.nativeElement.disabled=true;
    this.service.recoverPasswordConfirm(this.form.value).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          this.feedback = 'Password cambiata con successo';
          this.form.reset();
          new RedirectUtils(this.router, 2500, './login');
        }
      },
      error: (error) => {
        if (error.error.statusCode == 500) {
          this.feedback = 'token scaduto';
          this.form.reset();
          this.feedback = 'Token scaduto';
          new RedirectUtils(this.router, 2500, './login');
        }
        if (error.error.statusCode == 400) {
          this.feedback =
            "Hai gà cambiato la password o la password coincide con l'esisente";
        }
      },
    });
  }
}

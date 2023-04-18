import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { EmailMatchValidator } from 'src/app/validators/email-match.validator';

@Component({
  selector: 'app-change-email',
  templateUrl: './change-email.component.html',
  styleUrls: ['./change-email.component.css'],
})
export class ChangeEmailComponent {
  feedback: string = '';
  form: FormGroup;
  constructor(private service: ApiUserService) {
    this.form = new FormGroup({
      newEmail: new FormControl('', [
        Validators.required,
        Validators.pattern(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/),
      ]),
      password: new FormControl('', [Validators.required]),
    },
    [EmailMatchValidator.MatchValidator('newEmail')]);
  }
  requestChange() {
    var json = sessionStorage.getItem('user');
    if (json) {
      var dataSessionStorage = JSON.parse(json);
      if (dataSessionStorage) {
        var email = dataSessionStorage['email'];
        this.form.value.email = email;
        console.log(JSON.stringify(this.form.value));
        this.service.changeEmail(this.form.value).subscribe({
          next: (response) => {
            if (response.statusCode == 200) {
              this.feedback = 'Controlla la tua inbox';
              this.form.reset();
              console.log(response);
            }
          },
          error: (error) => {
            if (error.error.statusCode == 401) {
              this.feedback = 'password attuale errata';
              this.form.controls['email'].reset();
            }
          },
        });
      }
    }
  }
}

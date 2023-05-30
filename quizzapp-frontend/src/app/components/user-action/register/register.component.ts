import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { MatchPasswordValidator } from 'src/app/validators/password-match.validator';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent {
  feedback: string = '';
  form: FormGroup;
  @ViewChild('submit') submit!: ElementRef;

  constructor(private service: ApiUserService) {
    this.form = new FormGroup(
      {
        name: new FormControl('', [
          Validators.required,
          Validators.minLength(2),
        ]),
        email: new FormControl('', [
          Validators.required,
          Validators.pattern(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/),
        ]),
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
  register() {
    this.submit.nativeElement.disabled=true;
    console.log(JSON.stringify(this.form.value));
    this.service.register(this.form.value).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          this.feedback = 'Controlla la tua mail';
          this.form.reset();
          console.log(response);
        }
      },
      error: (error) => {
        if (error.error.statusCode == 409) {
          this.feedback = 'la mail è già presenete nel sistema';
          this.form.controls['email'].reset();
        }
      },
    });
  }
}

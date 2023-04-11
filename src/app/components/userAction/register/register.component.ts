import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ApiUserService } from 'src/app/services/api/api-user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent {
  feedback: string = '';
  form: FormGroup;
  constructor(private service: ApiUserService) {
    this.form = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.minLength(2)]),
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
    });
  }
  register() {
    console.log(JSON.stringify(this.form.value));
    this.service.login(this.form.value).subscribe({
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
      }
    });
  }
}

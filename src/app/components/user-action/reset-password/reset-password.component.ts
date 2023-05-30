import { Component, ElementRef, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ApiUserService } from 'src/app/services/api/api-user.service';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.css'],
})
export class ResetPasswordComponent {
  feedback: string = '';
  form: FormGroup;
  @ViewChild('submit') submit!: ElementRef;

  constructor(private service: ApiUserService) {
    this.form = new FormGroup({
      email: new FormControl('', [Validators.required]),
    });
  }
  reset() {
    this.submit.nativeElement.disabled=true;
    this.service.recoverPassword(this.form.value).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          this.form.reset();
          this.feedback = 'Controlla la tua mail';
        }
      },
    });
  }
}

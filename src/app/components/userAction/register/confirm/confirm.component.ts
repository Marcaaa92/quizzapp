import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApiUserService } from 'src/app/services/api/api-user.service';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.css'],
})
export class RegisterConfirmComponent {
  token: string | null;
  feedback: string = '';

  constructor(private route: ActivatedRoute, private service: ApiUserService) {
    this.token = this.route.snapshot.paramMap.get('token');
  }
  ngOnInit(): void {
    this.service.login(this.token).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          this.feedback = 'Email confermata con successo';
          console.log(response);
        }
      },
      error: (error) => {
        if (error.error.statusCode == 500) {
          this.feedback = 'token scaduto';
        }
        if (error.error.statusCode == 409) {
          this.feedback = 'email già confermata';
        }
      },
    });
  }
}

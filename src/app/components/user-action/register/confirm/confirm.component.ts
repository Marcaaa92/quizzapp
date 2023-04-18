import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApiUserService } from 'src/app/services/api/api-user.service';
import { RedirectUtils } from 'src/app/utils/redirect.utils';

@Component({
  selector: 'app-confirm',
  templateUrl: './confirm.component.html',
  styleUrls: ['./confirm.component.css'],
})
export class RegisterConfirmComponent {
  token: string | null;
  feedback: string = '';

  constructor(private route: ActivatedRoute, private router: Router, private service: ApiUserService) {
    this.token = this.route.snapshot.paramMap.get('token');
    console.log(this.token)
  }
  ngOnInit(): void {
    this.service.registerConfirm(this.token).subscribe({
      next: (response) => {
        if (response.statusCode == 200) {
          this.feedback = 'Email confermata con successo';
          console.log(response);
        }
        new RedirectUtils(this.router, 2500, "/login");
      },
      error: (error) => {
        if (error.error.statusCode == 500) {
          this.feedback = 'token scaduto';
        }
        if (error.error.statusCode == 409) {
          this.feedback = 'email già confermata';
        }
        new RedirectUtils(this.router, 2500, "/login");
      },
    });
  }

}

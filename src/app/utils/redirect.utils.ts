import { Router } from '@angular/router';

export class RedirectUtils {
  constructor(private router: Router, time: number, route: String) {
    setTimeout(() => {
      this.router.navigate([route]);
    }, time);
  }
}

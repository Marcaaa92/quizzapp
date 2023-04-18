import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

export class EmailMatchValidator {
  static MatchValidator(source: string): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
      const sourceCtrl = control.get(source);
      var json = sessionStorage.getItem('user');
      if (json) {
        var dataSessionStorage = JSON.parse(json);
        if (dataSessionStorage) {
          var email = dataSessionStorage['email'];
          return sourceCtrl &&
            sessionStorage.getItem('user') &&
            sourceCtrl.value === email
            ? { mismatch: true }
            : null;
        } else {
          return null;
        }
      }
      else{
        return null;
      }
    };
  }
}

import { AbstractControl, ValidationErrors, ValidatorFn } from '@angular/forms';

export class AccountDeletionConfirm {
  static MatchValidator(source: string): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
      const sourceCtrl = control.get(source);
      return sourceCtrl && sourceCtrl.value !== 'Si sono consapevole' ? { mismatch: true } : null;
    };
  }
}

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AccountDeletion } from './account-deleton.component';

describe('LoginComponent', () => {
  let component: AccountDeletion;
  let fixture: ComponentFixture<AccountDeletion>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AccountDeletion],
    }).compileComponents();

    fixture = TestBed.createComponent(AccountDeletion);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

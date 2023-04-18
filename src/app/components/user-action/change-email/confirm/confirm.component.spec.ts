import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfirmChangeEmailComponent } from './confirm.component';

describe('ConfirmComponent', () => {
  let component: ConfirmChangeEmailComponent;
  let fixture: ComponentFixture<ConfirmChangeEmailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConfirmChangeEmailComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConfirmChangeEmailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

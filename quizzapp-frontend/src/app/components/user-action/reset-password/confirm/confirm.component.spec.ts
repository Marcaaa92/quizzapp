import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConfirmResetComponent } from './confirm.component';

describe('ConfirmComponent', () => {
  let component: ConfirmResetComponent;
  let fixture: ComponentFixture<ConfirmResetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConfirmResetComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConfirmResetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

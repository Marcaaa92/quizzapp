import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegisterConfirmComponent } from './confirm.component';

describe('ConfirmComponent', () => {
  let component: RegisterConfirmComponent;
  let fixture: ComponentFixture<RegisterConfirmComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RegisterConfirmComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RegisterConfirmComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

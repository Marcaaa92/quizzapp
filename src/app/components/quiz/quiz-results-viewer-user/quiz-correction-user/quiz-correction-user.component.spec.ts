import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuizCorrectionUserComponent } from './quiz-correction-user.component';

describe('QuizCorrectionComponent', () => {
  let component: QuizCorrectionUserComponent;
  let fixture: ComponentFixture<QuizCorrectionUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuizCorrectionUserComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuizCorrectionUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

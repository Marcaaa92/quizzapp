import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuizFromExcelComponent } from './quiz-from-excel.component';

describe('QuizFromExcelComponent', () => {
  let component: QuizFromExcelComponent;
  let fixture: ComponentFixture<QuizFromExcelComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuizFromExcelComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuizFromExcelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

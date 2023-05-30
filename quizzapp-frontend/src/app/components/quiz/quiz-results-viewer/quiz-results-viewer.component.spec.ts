import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuizResultsViewerComponent } from './quiz-results-viewer.component';

describe('QuizResultsViewerComponent', () => {
  let component: QuizResultsViewerComponent;
  let fixture: ComponentFixture<QuizResultsViewerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuizResultsViewerComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuizResultsViewerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

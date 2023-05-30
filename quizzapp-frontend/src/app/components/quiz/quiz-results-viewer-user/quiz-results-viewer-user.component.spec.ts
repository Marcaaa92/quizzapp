import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuizResultsViewerUserComponent } from './quiz-results-viewer-user.component';

describe('QuizResultsViewerComponent', () => {
  let component: QuizResultsViewerUserComponent;
  let fixture: ComponentFixture<QuizResultsViewerUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuizResultsViewerUserComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuizResultsViewerUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

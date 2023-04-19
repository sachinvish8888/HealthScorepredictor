import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WellnessScoreComponent } from './wellness-score.component';

describe('WellnessScoreComponent', () => {
  let component: WellnessScoreComponent;
  let fixture: ComponentFixture<WellnessScoreComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ WellnessScoreComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(WellnessScoreComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EditManualDataComponent } from './edit-manual-data.component';

describe('EditManualDataComponent', () => {
  let component: EditManualDataComponent;
  let fixture: ComponentFixture<EditManualDataComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EditManualDataComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EditManualDataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

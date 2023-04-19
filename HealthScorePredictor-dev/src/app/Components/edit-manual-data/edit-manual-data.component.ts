import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { StepperOrientation } from '@angular/material/stepper';
import {BreakpointObserver} from '@angular/cdk/layout';
import {Observable} from 'rxjs';
import {map} from 'rxjs/operators';
@Component({
  selector: 'app-edit-manual-data',
  templateUrl: './edit-manual-data.component.html',
  styleUrls: ['./edit-manual-data.component.css']
})
export class EditManualDataComponent {
  firstFormGroup = this._formBuilder.group({
    customerId: ['', Validators.required],
    hbp: ['', Validators.required],
    lbp: ['', Validators.required],
    hemoglobin: ['', Validators.required],
    hba1cfbs: ['', Validators.required],
    cholesterol: ['', Validators.required],
    creatinine: ['', Validators.required],
    sgpt: ['', Validators.required],
    ecgtmt: ['', Validators.required],
    mer: ['', Validators.required],
    bmi: ['', Validators.required],
    esr: ['', Validators.required],
    pulse: ['', Validators.required],
  });
  isLinear = false;
  stepperOrientation: Observable<StepperOrientation>;
  constructor(private _formBuilder:FormBuilder ,  breakpointObserver: BreakpointObserver){
    this.stepperOrientation = breakpointObserver
    .observe('(min-width: 800px)')
    .pipe(map(({matches}) => (matches ? 'horizontal' : 'vertical')));
  }
  getData(){
    console.log(this.firstFormGroup)
  }
}

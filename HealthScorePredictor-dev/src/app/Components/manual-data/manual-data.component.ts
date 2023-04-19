import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { StepperOrientation } from '@angular/material/stepper';
import {BreakpointObserver} from '@angular/cdk/layout';
import {Observable} from 'rxjs';
import {map} from 'rxjs/operators';
import { ManualFormService } from '../Services/manual-form.service';

@Component({
  selector: 'app-manual-data',
  templateUrl: './manual-data.component.html',
  styleUrls: ['./manual-data.component.css']
})
export class ManualDataComponent {
  
  cID:any=localStorage.getItem('customerId');
  firstFormGroup = this._formBuilder.group({
    customerId: [this.cID, Validators.required],
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
  constructor(private _formBuilder:FormBuilder ,  breakpointObserver: BreakpointObserver ,private auth:ManualFormService){
    this.stepperOrientation = breakpointObserver
    .observe('(min-width: 800px)')
    .pipe(map(({matches}) => (matches ? 'horizontal' : 'vertical')));
  }
  postData(){
 this.auth.submitForm(this.firstFormGroup.value).subscribe(res=>{
  console.log(res);
 })
  }
  getData(){
    console.log(this.firstFormGroup)
  }
}





import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Component } from '@angular/core';

@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.css']
})
export class QuestionsComponent {
    myForm: FormGroup;

    questions = [
      {type: "name", description : "What is your name ?", isHidden:false},
      {type: "email", description : "What is your email ?", isHidden:true},
      {type: "message", description : "What is your message ?", isHidden:true}
    ]
    constructor(private fb:FormBuilder){
      this.myForm = new FormGroup({
        name: new FormControl('Benedict'),
        email: new FormControl(''),
        message: new FormControl('')
      });
    }
    
    onSubmit(myForm) {

    }
}

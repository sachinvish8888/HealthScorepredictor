import { Router } from '@angular/router';
import { Component } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { LoginService } from '../Services/login.service';
import { JwtHelperService } from '@auth0/angular-jwt';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
loginForm: FormGroup;
constructor(private fb:FormBuilder, private route: Router , private api:LoginService){}
ngOnInit(): void{
  this.loginForm = this.fb.group({
    username:['' , Validators.required],
    password:['' , Validators.required]
  })
}
login(){
  console.log(this.loginForm.value)
  this.api.login1(this.loginForm.value).subscribe(res=>{
    console.log(res);
    localStorage.setItem('token',res['token']);
    if(res.token){
      const helper= new JwtHelperService
      localStorage.setItem('customerId', helper.decodeToken(localStorage.getItem('token') as string).CustomerId);
      this.route.navigate(['/upload-file']);
    }
    else{
   alert('wrong credential')
    }
  })
 
  // this.route.navigate(['/upload-file']);
}
}

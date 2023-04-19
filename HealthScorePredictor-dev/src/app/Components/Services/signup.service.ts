import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SignupService {
   apiUrl!:any;
  constructor(private http: HttpClient) { }
  signUp(parameter:any):Observable<any>{
    console.log('srinjoy')
    // this.apiUrl="https://localhost:7206/api/Sign_up"
    return this.http.post("https://localhost:7206/api/Sign_up",parameter)
    
    
  }
}

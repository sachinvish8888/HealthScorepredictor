import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  ApiUrl = 'https://localhost:7286/api/Customers/GetUserDetails';
  constructor(private http:HttpClient) { }

  login1(credential:any): Observable<any> {
    return this.http.post(this.ApiUrl,credential);
}
getToken(): string | null {
  console.log(localStorage.getItem('token'));
  return localStorage.getItem('token');
}
logout(){
 
  localStorage.removeItem('token');
  location.reload();
}
isLoggedIn() {
  const isLoggedIn = this.getToken() !== null;
  console.log('isLoggedIn:', isLoggedIn);
  return isLoggedIn;
}
}

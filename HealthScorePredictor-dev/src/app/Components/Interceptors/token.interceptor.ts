import { LoginService } from './../Services/login.service';
import { Injectable } from '@angular/core';
import {
  HttpRequest,
  HttpHandler,
  HttpEvent,
  HttpInterceptor,
  HttpErrorResponse
} from '@angular/common/http';
import { Router } from '@angular/router';
import { catchError, Observable, throwError } from 'rxjs';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  constructor(private auth: LoginService , private route:Router) {}

  intercept(request: HttpRequest<unknown>, next: HttpHandler): Observable<HttpEvent<unknown>> {

     const myToken = this.auth.getToken();
    if(myToken){
      request=request.clone({
        setHeaders: {Authorization: `Bearer ${myToken}`}
      })
    }
    return next.handle(request).pipe(
      catchError((err:any)=>{
        if(err instanceof HttpErrorResponse){
          if(err.status == 401){
            console.log('401 error')
            alert('Please Login Again Session Expired')
            this.route.navigate(['/login'])
          }
          if(err.status == 403){
            console.log('403 error')
            alert('Logged In Unauthorized')
            localStorage.removeItem('token')
            this.route.navigate(['/login'])
            
          }
        }
        return throwError(()=> new Error("Some Other Error occured"))
      })
    )
   
  }
}

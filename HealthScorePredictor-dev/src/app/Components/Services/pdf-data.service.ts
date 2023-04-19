import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PdfDataService {
  ApiUrl = '';
  constructor(private http:HttpClient) { }
  getPdfData():Observable<any>{
    return this.http.get(this.ApiUrl);
  }
}

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class FileUploadService {
  // API url
  baseApiUrl = 'https://file.io';
  object:any={}

  constructor(private http: HttpClient) {}

  // Returns an observable
  upload(file,id): Observable<any> {
    // Create form data
    const formData = new FormData();

    // Store form name as "file" with file data
    formData.append('file', file, file.name);


    // Make http post request over api
    // with formData as req
    // this.object.res=this.http.post(this.baseApiUrl, formData);
    // this.object.key=id;
    return this.http.post(`https://localhost:7206/api/UploadPDF?a=${id}`, formData) ; 
  }
}

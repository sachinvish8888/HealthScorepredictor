import { Component, VERSION } from '@angular/core';
import { FileUploadService } from '../Services/file-upload.service';


@Component({
  selector: 'my-app',
  templateUrl: './upload-file.component.html',
  styleUrls: ['./upload-file.component.css'],
})
export class UploadFileComponent {
  shortLink: boolean = false; // Variable to store shortLink from api response
  loading: boolean = false; // Flag variable
  file: File = null; // Variable to store file to Upload
  id:any=localStorage.getItem('customerId');
  wellnessScore:any;

  // Inject service
  constructor(private fileUploadService: FileUploadService) {}

  // On file Select
  onChange(event) {
    this.file = event.target.files[0];
  }

  // OnClick of button Upload
  logout(){
    localStorage.removeItem('token');
    localStorage.removeItem('customerId');
  }
  onUpload() {
    if (this.file) {
      this.loading = !this.loading;
      console.log(this.file);
      console.log(this.id);
      this.fileUploadService.upload(this.file,this.id).subscribe((event: any) => {
        if (typeof event === 'object') {
          // Short link via api response
          // this.shortLink = event.link;
          this.loading = false; 
          // Flag variable
        }
        console.log(event.wellnessScore);
        this.shortLink = true;
        this.wellnessScore=event.wellnessScore;
        
      });
      this.shortLink = false;
    }
  }
}



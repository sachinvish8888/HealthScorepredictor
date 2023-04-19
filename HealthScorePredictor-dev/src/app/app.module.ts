import { TokenInterceptor } from './Components/Interceptors/token.interceptor';

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClient, HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './Components/login/login.component';
import { SignupComponent, } from './Components/sign-up/sign-up.component';
import { LandingComponent } from './Components/landing/landing.component';
import { UploadFileComponent } from './Components/upload-file/upload-file.component';
import { ReactiveFormsModule } from '@angular/forms';
import { QuestionsComponent } from './Components/questions/questions.component';
import { ManualDataComponent } from './Components/manual-data/manual-data.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatStepperModule} from '@angular/material/stepper';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import {MatSelectModule} from '@angular/material/select';
import { EditManualDataComponent } from './Components/edit-manual-data/edit-manual-data.component';
import { WellnessScoreComponent } from './Components/wellness-score/wellness-score.component';
@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    SignupComponent,
    LandingComponent,
    UploadFileComponent,
    QuestionsComponent,
    ManualDataComponent,
    EditManualDataComponent,
    WellnessScoreComponent,
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    MatStepperModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatSelectModule
  ],
  providers: [HttpClient, {
    provide: HTTP_INTERCEPTORS,
    useClass: TokenInterceptor,
    multi: true
}],
  bootstrap: [AppComponent]
})
export class AppModule { }

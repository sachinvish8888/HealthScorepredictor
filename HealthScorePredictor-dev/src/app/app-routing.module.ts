import { ManualDataComponent } from './Components/manual-data/manual-data.component';
import { QuestionsComponent } from './Components/questions/questions.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LandingComponent } from './Components/landing/landing.component';
import { LoginComponent } from './Components/login/login.component';
import { SignupComponent } from './Components/sign-up/sign-up.component';

import { UploadFileComponent } from './Components/upload-file/upload-file.component';
import { EditManualDataComponent } from './Components/edit-manual-data/edit-manual-data.component';
import { WellnessScoreComponent } from './Components/wellness-score/wellness-score.component';
import { AuthGuard } from './Components/Guards/auth.guard';

const routes: Routes = [
  {path: '' , component: LandingComponent,},
  {path:'login' , component:LoginComponent},
  {path:'sign-up',component:SignupComponent},
  {path: 'landing', component:LandingComponent, },
  {path: 'upload-file', component:UploadFileComponent ,canActivate:[AuthGuard]},
  {path:'questions' , component:QuestionsComponent},
  {path:'manual-data' , component:ManualDataComponent ,canActivate:[AuthGuard]},
  {path: 'edit-manual-data' , component: EditManualDataComponent ,canActivate:[AuthGuard]},
  {path: 'wellness-score' , component: WellnessScoreComponent ,canActivate:[AuthGuard]},
  {path:'**', redirectTo:'landing'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

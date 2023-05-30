import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ApiUserService {
  headers:HttpHeaders;
  constructor(private http: HttpClient) {
    this.headers= new HttpHeaders()
    .set('content-type', 'application/json');
  }

  register(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/registration', dataJson,  { 'headers': this.headers });
  }
  registerConfirm(data: any): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(
      Environment.apiUrl+'/registration/confirm',
      dataJson,  { 'headers': this.headers }
    );
  }
  login(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/login', dataJson, { 'headers': this.headers });
  }
  loginGoogle(data: any): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/login-google', dataJson,  { 'headers': this.headers });
  }
  changePassword(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/change-password', dataJson,  { 'headers': this.headers });
  }
  changeEmail(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/change-email', dataJson,  { 'headers': this.headers });
  }
  changeEmailConfirm(data: any): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(
      Environment.apiUrl+'/change-email/confirm',
      dataJson,  { 'headers': this.headers }
    );
  }
  recoverPassword(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/reset-password', dataJson,  { 'headers': this.headers });
  }
  recoverPasswordConfirm(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/reset-password/new-password', dataJson,  { 'headers': this.headers });
  }
  accountDeletion(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/account-deletion', dataJson,  { 'headers': this.headers });
  }
  checkTokenValidity(data: any): Observable<any> {
    let dataJson ='{"token":"' + data +'"}"';
    return this.http.post<any>(
      Environment.apiUrl+'/check-token-validity',
      dataJson,  { 'headers': this.headers }
    );
  }
}

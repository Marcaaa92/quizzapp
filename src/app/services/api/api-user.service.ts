import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ApiUserService {
  constructor(private http: HttpClient) {}

  register(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/registration', dataJson);
  }
  registerConfirm(data: any): Observable<any> {
    let dataJson = "{'token':" + data + '}';
    return this.http.post<any>(
      Environment.apiUrl+'/registration/confirm',
      dataJson
    );
  }
  login(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/login', dataJson);
  }
  changePassword(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/change-password', dataJson);
  }
  changeEmail(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/change-email', dataJson);
  }
  changeEmailConfirm(data: any): Observable<any> {
    let dataJson = "{'token':" + data + '}';
    return this.http.post<any>(
      Environment.apiUrl+'/change-email/confirm',
      dataJson
    );
  }
  recoverPassword(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/reset-password', dataJson);
  }
  recoverPasswordConfirm(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/reset-password/new-password', dataJson);
  }
  accountDeletion(data: any): Observable<any> {
    let dataJson = JSON.stringify(data);
    return this.http.post<any>(Environment.apiUrl+'/account-deletion', dataJson);
  }
  checkTokenValidity(data: any): Observable<any> {
    let dataJson = "{'token':" + data + '}';
    return this.http.post<any>(
      Environment.apiUrl+'/check-token-validity',
      dataJson
    );
  }
}

import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { jsonIgnoreReplacer } from 'json-ignore';

@Injectable({
  providedIn: 'root',
})
export class ApiUserService {
  constructor(private http: HttpClient) {}

  register(data: any): Observable<any> {
    let dataJson = JSON.stringify(data, jsonIgnoreReplacer);
    return this.http.post<any>('http://localhost:8080/registration', dataJson);
  }
  registerConfirm(data: any): Observable<any> {
    let dataJson = "{'token':" + data + '}';
    return this.http.post<any>(
      'http://localhost:8080/registration/verification',
      dataJson
    );
  }
  login(data: any): Observable<any> {
    let dataJson = JSON.stringify(data, jsonIgnoreReplacer);
    return this.http.post<any>('http://localhost:8080/login', dataJson);
  }
}

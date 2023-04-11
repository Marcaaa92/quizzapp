import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { jsonIgnoreReplacer } from 'json-ignore';


@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http: HttpClient) { }

  sendDataDB(data:any): Observable<any>{
    let dataJson = JSON.stringify(data, jsonIgnoreReplacer);
    return this.http.put<any>('http://localhost:8080/newQuiz',dataJson)
  }
}

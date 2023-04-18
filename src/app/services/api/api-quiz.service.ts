import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { jsonIgnoreReplacer } from 'json-ignore';
import { Environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ApiQuizService {

  constructor(private http: HttpClient) {}

  newQuiz(data: any): Observable<any> {

    let dataJson = JSON.stringify(data, jsonIgnoreReplacer);
    return this.http.put<any>(Environment.apiUrl+'/newQuiz', dataJson);
  }
}

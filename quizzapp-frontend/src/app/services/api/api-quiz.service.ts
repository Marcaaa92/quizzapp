import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { jsonIgnoreReplacer } from 'json-ignore';
import { Environment } from '../../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ApiQuizService {

  headers:HttpHeaders;
  constructor(private http: HttpClient) {
    this.headers= new HttpHeaders()
    .set('content-type', 'application/json');
  }

  newQuiz(data: any): Observable<any> {
    let dataJson = JSON.stringify(data, jsonIgnoreReplacer);
    return this.http.put<any>(Environment.apiUrl+'/new-quiz', dataJson,  { 'headers': this.headers });
  }
  getQuizById(data: any, id: string  | null): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/get-by-id/'+id, dataJson,  { 'headers': this.headers });
  }
  saveQuiz(data: any): Observable<any> {
    let dataJson=JSON.stringify(data)
    return this.http.post<any>(Environment.apiUrl+'/save-quiz', dataJson,  { 'headers': this.headers });
  }
  checkQuizIfCompleted(data: any, id: string  | null): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/check-quiz-if-completed/'+id, dataJson,  { 'headers': this.headers });
  }
  getQuizResults(data: any, id: string  | null): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/get-by-id/'+id+'/results', dataJson,  { 'headers': this.headers });
  }
  getQuizResultsByUser(data: any, id: string  | null): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/get-by-id/'+id+'/results/user', dataJson,  { 'headers': this.headers });
  }
  getAllQuizzes(data: any): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/get-quizzes-by-user', dataJson,  { 'headers': this.headers });
  }
    publishQuiz(data: any, id: string  | null): Observable<any> {
    let dataJson = '{"token":"' + data +'"}"';
    return this.http.post<any>(Environment.apiUrl+'/publish-results/'+id, dataJson,  { 'headers': this.headers });
  }
}

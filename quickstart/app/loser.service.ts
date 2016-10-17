import { Injectable }    from '@angular/core';
import { Headers, Http } from '@angular/http';

import 'rxjs/add/operator/toPromise';

import { Loser } from './loser';

@Injectable()
export class LoserService {

  private headers = new Headers({'Content-Type': 'application/json'});
  private losersUrl = 'app/losers';  // URL to web api

  constructor(private http: Http) { }

  getLosers(): Promise<Loser[]> {
    return this.http.get(this.losersUrl)
               .toPromise()
               .then(response => response.json().data as Loser[])
               .catch(this.handleError);
  }

  getLoser(id: number): Promise<Loser> {
    return this.getLosers()
               .then(losers => losers.find(loser => loser.id === id));
  }

  delete(id: number): Promise<void> {
    const url = `${this.losersUrl}/${id}`;
    return this.http.delete(url, {headers: this.headers})
      .toPromise()
      .then(() => null )
      .catch(this.handleError);
  }

  create(name: string): Promise<Loser> {
    return this.http
      .post(this.losersUrl, JSON.stringify({name: name}), {headers: this.headers})
      .toPromise()
      .then(res => res.json().data)
      .catch(this.handleError);
  }

  update(loser: Loser): Promise<Loser> {
    const url = `${ this.losersUrl}/${loser.id}`;
    return this.http
      .put(url, JSON.stringify(loser), {headers: this.headers})
      .toPromise()
      .then(() => loser)
      .catch(this.handleError);
  }

  private handleError (error: any): Promise<any> {
    console.error('An error occurred', error); // for demo purposes only
    return Promise.reject(error.message || error);
  }
}

import { Injectable }     from '@angular/core';
import { Http, Response } from '@angular/http';
import { Observable } from 'rxjs';

import { Loser }           from './loser';

@Injectable()
export class LoserSearchService {

  constructor(private http: Http) {}

  search(term: string): Observable<Loser[]> {
    return this.http
               .get(`app/losers/?name=${term}`)
               .map((r: Response) => r.json().data as Loser[]);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/

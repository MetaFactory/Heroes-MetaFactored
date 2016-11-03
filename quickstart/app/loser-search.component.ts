import { Component, OnInit } from '@angular/core';
import { Router }            from '@angular/router';
import { Observable }        from 'rxjs/Observable';
import { Subject }           from 'rxjs/Subject';

import { LoserSearchService } from './loser-search.service';
import { Loser } from './loser';

@Component({
  moduleId: module.id,
  selector: 'Loser-search',
  templateUrl: 'loser-search.component.html',
  styleUrls: [ 'loser-search.component.css' ],
  providers: [LoserSearchService]
})
export class LoserSearchComponent implements OnInit {
  losers: Observable<Loser[]>;
  private searchTerms = new Subject<string>();

  constructor(
    private loserSearchService: LoserSearchService,
    private router: Router) {}

  // Push a search term into the observable stream.
  search(term: string): void {
    this.searchTerms.next(term);
  }

  ngOnInit(): void {
    this.losers = this.searchTerms
      .debounceTime(300)        // wait for 300ms pause in events
      .distinctUntilChanged()   // ignore if next search term is same as previous
      .switchMap(term => term   // switch to new observable each time
        // return the http search observable
        ? this.loserSearchService.search(term)
        // or the observable of empty losers if no search term
        : Observable.of<Loser[]>([]))
      .catch(error => {
        // TODO: real error handling
        console.log(error);
        return Observable.of<Loser[]>([]);
      });
  }

  gotoDetail(loser: Loser): void {
    let link = ['loser-detail', loser.id];
    this.router.navigate(link);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/

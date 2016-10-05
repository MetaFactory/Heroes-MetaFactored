import { Component, OnInit} from '@angular/core';
import { Router }           from '@angular/router';

import { Loser }                from './loser';
import { LoserService }         from './loser.service';

/** Import references: */

@Component({
  moduleId: module.id,
  selector: 'my-losers',
  templateUrl: 'losers.component.html',
  styleUrls: [ 'losers.component.css' ]
})
export class LosersComponent implements OnInit {
  losers: Loser[];
  selectedLoser: Loser;

  constructor(
    private loserService: LoserService,
    private router: Router) { }

  getLosers(): void {
    this.loserService
        .getLosers()
        .then(losers => this.losers = losers);
  }

  add(name: string): void {
    name = name.trim();
    if (!name) { return; }
    this.loserService.create(name)
      .then(loser => {
        this.losers.push(loser);
        this.selectedLoser = null;
      });
  }

  delete(loser: Loser): void {
    this.loserService
        .delete(loser.id)
        .then(() => {
          this.losers = this.losers.filter(h => h !== loser);
          if (this.selectedLoser === loser) { this.selectedLoser = null; }
        });
  }

  ngOnInit(): void {
    this.getLosers();
  }

  onSelect(loser: Loser): void {
    this.selectedLoser = loser;
  }

  gotoDetail(): void {
    this.router.navigate(['/detail', this.selectedLoser.id]);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/

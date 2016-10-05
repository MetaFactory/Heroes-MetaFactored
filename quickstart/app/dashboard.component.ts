import { Component, OnInit } from '@angular/core';
import { Router }            from '@angular/router';

import { Hero }        from './hero';
import { HeroService } from './hero.service';
import { Loser }        from './loser';
import { LoserService } from './loser.service';

@Component({
  moduleId: module.id,
  selector: 'my-dashboard',
  templateUrl: 'dashboard.component.html',
  styleUrls: [ 'dashboard.component.css' ]
})
export class DashboardComponent implements OnInit {
  heroes: Hero[] = [];
  losers: Loser[] = [];

  constructor(
    private router: Router,
    private heroService: HeroService,
    private loserService: LoserService) {
  }

  ngOnInit(): void {
    this.heroService.getHeroes()
      .then(heroes => this.heroes = heroes.slice(1, 5));
    this.loserService.getLosers()
      .then(losers => this.losers = losers.slice(1, 5));
  }

  gotoDetailHero(hero: Hero): void {
    let link = ['detail', hero.id];
    this.router.navigate(link);
  }
  gotoDetailLoser(loser: Loser): void {
    let link = ['detail', loser.id];
    this.router.navigate(link);
  }
}


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/

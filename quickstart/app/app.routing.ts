import { ModuleWithProviders }  from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DashboardComponent }  from './dashboard.component';
import { HeroesComponent }       from './heroes.component';
import { HeroSearchComponent }   from './hero-search.component';
import { HeroDetailComponent }   from './hero-detail.component';
import { LosersComponent }       from './losers.component';
import { LoserSearchComponent }   from './loser-search.component';
import { LoserDetailComponent }   from './loser-detail.component';

const appRoutes: Routes = [
  {
    path: '',
    redirectTo: '/dashboard',
    pathMatch: 'full'
  },
  {
    path: 'dashboard',
    component: DashboardComponent
  },
   {
    path: 'hero-search/:id',     // id of the single selected object.
    component: HeroSearchComponent
  },{
    path: 'hero-detail/:id',     // id of the single selected object.
    component: HeroDetailComponent
  }, {
    path: 'heroes',
    component: HeroesComponent
  },
   {
    path: 'loser-search/:id',     // id of the single selected object.
    component: LoserSearchComponent
  },{
    path: 'loser-detail/:id',     // id of the single selected object.
    component: LoserDetailComponent
  }, {
    path: 'losers',
    component: LosersComponent
  },
];
export const routing: ModuleWithProviders = RouterModule.forRoot(appRoutes);


/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/

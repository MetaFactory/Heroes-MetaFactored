"use strict";
var router_1 = require('@angular/router');
var dashboard_component_1 = require('./dashboard.component');
var heroes_component_1 = require('./heroes.component');
var hero_search_component_1 = require('./hero-search.component');
var hero_detail_component_1 = require('./hero-detail.component');
var losers_component_1 = require('./losers.component');
var loser_search_component_1 = require('./loser-search.component');
var loser_detail_component_1 = require('./loser-detail.component');
var appRoutes = [
    {
        path: '',
        redirectTo: '/dashboard',
        pathMatch: 'full'
    },
    {
        path: 'dashboard',
        component: dashboard_component_1.DashboardComponent
    },
    {
        path: 'hero-search/:id',
        component: hero_search_component_1.HeroSearchComponent
    }, {
        path: 'hero-detail/:id',
        component: hero_detail_component_1.HeroDetailComponent
    }, {
        path: 'heroes',
        component: heroes_component_1.HeroesComponent
    },
    {
        path: 'loser-search/:id',
        component: loser_search_component_1.LoserSearchComponent
    }, {
        path: 'loser-detail/:id',
        component: loser_detail_component_1.LoserDetailComponent
    }, {
        path: 'losers',
        component: losers_component_1.LosersComponent
    },
];
exports.routing = router_1.RouterModule.forRoot(appRoutes);
/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/
//# sourceMappingURL=app.routing.js.map
"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var router_1 = require('@angular/router');
var Observable_1 = require('rxjs/Observable');
var Subject_1 = require('rxjs/Subject');
var loser_search_service_1 = require('./loser-search.service');
var LoserSearchComponent = (function () {
    function LoserSearchComponent(loserSearchService, router) {
        this.loserSearchService = loserSearchService;
        this.router = router;
        this.searchTerms = new Subject_1.Subject();
    }
    // Push a search term into the observable stream.
    LoserSearchComponent.prototype.search = function (term) {
        this.searchTerms.next(term);
    };
    LoserSearchComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.losers = this.searchTerms
            .debounceTime(300) // wait for 300ms pause in events
            .distinctUntilChanged() // ignore if next search term is same as previous
            .switchMap(function (term) { return term // switch to new observable each time
            ? _this.loserSearchService.search(term)
            : Observable_1.Observable.of([]); })
            .catch(function (error) {
            // TODO: real error handling
            console.log(error);
            return Observable_1.Observable.of([]);
        });
    };
    LoserSearchComponent.prototype.gotoDetail = function (loser) {
        var link = ['loser-detail', loser.id];
        this.router.navigate(link);
    };
    LoserSearchComponent = __decorate([
        core_1.Component({
            moduleId: module.id,
            selector: 'Loser-search',
            templateUrl: 'loser-search.component.html',
            styleUrls: ['loser-search.component.css'],
            providers: [loser_search_service_1.LoserSearchService]
        }), 
        __metadata('design:paramtypes', [loser_search_service_1.LoserSearchService, router_1.Router])
    ], LoserSearchComponent);
    return LoserSearchComponent;
}());
exports.LoserSearchComponent = LoserSearchComponent;
/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/
//# sourceMappingURL=loser-search.component.js.map
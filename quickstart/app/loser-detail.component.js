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
var common_1 = require('@angular/common');
var loser_service_1 = require('./loser.service');
var LoserDetailComponent = (function () {
    function LoserDetailComponent(loserService, route, location) {
        this.loserService = loserService;
        this.route = route;
        this.location = location;
    }
    LoserDetailComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.route.params.forEach(function (params) {
            var id = +params['id'];
            _this.loserService.getLoser(id)
                .then(function (loser) { return _this.loser = loser; });
        });
    };
    LoserDetailComponent.prototype.save = function () {
        var _this = this;
        this.loserService.update(this.loser)
            .then(function () { return _this.goBack(); });
    };
    LoserDetailComponent.prototype.goBack = function () {
        this.location.back();
    };
    LoserDetailComponent = __decorate([
        core_1.Component({
            moduleId: module.id,
            selector: 'Loser-detail',
            templateUrl: 'loser-detail.component.html',
            styleUrls: ['loser-detail.component.css']
        }), 
        __metadata('design:paramtypes', [loser_service_1.LoserService, router_1.ActivatedRoute, common_1.Location])
    ], LoserDetailComponent);
    return LoserDetailComponent;
}());
exports.LoserDetailComponent = LoserDetailComponent;
/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/
//# sourceMappingURL=loser-detail.component.js.map
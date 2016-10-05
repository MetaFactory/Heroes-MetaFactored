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
var loser_service_1 = require('./loser.service');
/** Import references: */
var LosersComponent = (function () {
    function LosersComponent(loserService, router) {
        this.loserService = loserService;
        this.router = router;
    }
    LosersComponent.prototype.getLosers = function () {
        var _this = this;
        this.loserService
            .getLosers()
            .then(function (losers) { return _this.losers = losers; });
    };
    LosersComponent.prototype.add = function (name) {
        var _this = this;
        name = name.trim();
        if (!name) {
            return;
        }
        this.loserService.create(name)
            .then(function (loser) {
            _this.losers.push(loser);
            _this.selectedLoser = null;
        });
    };
    LosersComponent.prototype.delete = function (loser) {
        var _this = this;
        this.loserService
            .delete(loser.id)
            .then(function () {
            _this.losers = _this.losers.filter(function (h) { return h !== loser; });
            if (_this.selectedLoser === loser) {
                _this.selectedLoser = null;
            }
        });
    };
    LosersComponent.prototype.ngOnInit = function () {
        this.getLosers();
    };
    LosersComponent.prototype.onSelect = function (loser) {
        this.selectedLoser = loser;
    };
    LosersComponent.prototype.gotoDetail = function () {
        this.router.navigate(['/detail', this.selectedLoser.id]);
    };
    LosersComponent = __decorate([
        core_1.Component({
            moduleId: module.id,
            selector: 'my-losers',
            templateUrl: 'losers.component.html',
            styleUrls: ['losers.component.css']
        }), 
        __metadata('design:paramtypes', [loser_service_1.LoserService, router_1.Router])
    ], LosersComponent);
    return LosersComponent;
}());
exports.LosersComponent = LosersComponent;
/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/
//# sourceMappingURL=losers.component.js.map
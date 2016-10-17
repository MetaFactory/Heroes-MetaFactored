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
var http_1 = require('@angular/http');
require('rxjs/add/operator/toPromise');
var LoserService = (function () {
    function LoserService(http) {
        this.http = http;
        this.headers = new http_1.Headers({ 'Content-Type': 'application/json' });
        this.losersUrl = 'app/losers'; // URL to web api
    }
    LoserService.prototype.getLosers = function () {
        return this.http.get(this.losersUrl)
            .toPromise()
            .then(function (response) { return response.json().data; })
            .catch(this.handleError);
    };
    LoserService.prototype.getLoser = function (id) {
        return this.getLosers()
            .then(function (losers) { return losers.find(function (loser) { return loser.id === id; }); });
    };
    LoserService.prototype.delete = function (id) {
        var url = this.losersUrl + "/" + id;
        return this.http.delete(url, { headers: this.headers })
            .toPromise()
            .then(function () { return null; })
            .catch(this.handleError);
    };
    LoserService.prototype.create = function (name) {
        return this.http
            .post(this.losersUrl, JSON.stringify({ name: name }), { headers: this.headers })
            .toPromise()
            .then(function (res) { return res.json().data; })
            .catch(this.handleError);
    };
    LoserService.prototype.update = function (loser) {
        var url = this.losersUrl + "/" + loser.id;
        return this.http
            .put(url, JSON.stringify(loser), { headers: this.headers })
            .toPromise()
            .then(function () { return loser; })
            .catch(this.handleError);
    };
    LoserService.prototype.handleError = function (error) {
        console.error('An error occurred', error); // for demo purposes only
        return Promise.reject(error.message || error);
    };
    LoserService = __decorate([
        core_1.Injectable(), 
        __metadata('design:paramtypes', [http_1.Http])
    ], LoserService);
    return LoserService;
}());
exports.LoserService = LoserService;
//# sourceMappingURL=loser.service.js.map
"use strict";
var InMemoryDataService = (function () {
    function InMemoryDataService() {
    }
    InMemoryDataService.prototype.createDb = function () {
        var heroes = [
            { id: 11, name: 'Mr. Nice' },
            { id: 12, name: 'Narco' },
            { id: 13, name: 'Bombasto' },
            { id: 14, name: 'Celeritas' },
            { id: 15, name: 'Magneta' },
            { id: 16, name: 'RubberMan' },
            { id: 17, name: 'Dynama' },
            { id: 18, name: 'Dr IQ' },
            { id: 19, name: 'Magma' },
            { id: 20, name: 'Tornado' }
        ];
        var losers = [
            { id: 51, name: 'Mr. Nice' },
            { id: 52, name: 'Narco' },
            { id: 53, name: 'Bombasto' },
            { id: 54, name: 'Celeritas' },
            { id: 55, name: 'Magneta' },
            { id: 56, name: 'RubberMan' },
            { id: 57, name: 'Dynama' },
            { id: 58, name: 'Dr IQ' },
            { id: 59, name: 'Magma' },
            { id: 60, name: 'Tornado' }
        ];
        return { heroes: heroes, losers: losers };
    };
    return InMemoryDataService;
}());
exports.InMemoryDataService = InMemoryDataService;
/*
Copyright 2016 Google Inc. All Rights Reserved.
Use of this source code is governed by an MIT-style license that
can be found in the LICENSE file at http://angular.io/license
*/
//# sourceMappingURL=in-memory-data.service.js.map
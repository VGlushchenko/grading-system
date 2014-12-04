var app = angular.module('app', ['ui.bootstrap', 'mgcrea.ngStrap.popover', 'blockUI']);

app.filter('startFrom', function() {
    return function(input, start) {
        if(input) {
            start = +start;
            return input.slice(start);
        }
        return [];
    }
});
'use strict'

angular.module('secretSantaApp', [
  "ngRoute"
])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true

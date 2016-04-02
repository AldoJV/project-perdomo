'use strict';

/**
 * @ngdoc overview
 * @name app-gp
 * @description
 * # app-gp
 *
 * Main module of the application.
 */
 angular
 .module('app-gp', [
    'ui.router',
    'snap',
    'ngAnimate',
    'LocalStorageModule'
    ])
 .config(function($stateProvider, $urlRouterProvider, localStorageServiceProvider) {

    localStorageServiceProvider.setPrefix('GP');
    $urlRouterProvider.when('/dashboard', '/dashboard/overview');
    $urlRouterProvider.otherwise('/dashboard');

    $stateProvider
    .state('base', {
        abstract: true,
        url: '',
        templateUrl: 'views/base.html'
    })
    .state('login', {
      url: '/login',
      parent: 'base',
      templateUrl: 'views/login.html',
      controller: 'LoginCtrl'
  })
    .state('sign-in', {
      url: '/sign-in',
      parent: 'base',
      templateUrl: 'views/sign-in.html',
      controller: 'SigninCtrl'
  })
    .state('dashboard', {
      url: '/dashboard',
      parent: 'base',
      templateUrl: 'views/dashboard.html',
      controller: 'DashboardCtrl',
      resolve: {
        categories: function(GameService){
          return GameService.getCategories();
        },
        platforms: function(GameService){
          return GameService.getPlatforms();
        }
      }
  })
    .state('overview', {
        url: '/overview',
        parent: 'dashboard',
        templateUrl: 'views/dashboard/overview.html'
    })
    .state('item_list', {
        url: '/item_list/:criteria/:element',
        parent: 'dashboard',
        templateUrl: 'views/dashboard/itemlist.html',
        controller: 'ListCtrl',
        resolve: {
        items: function(GameService, $stateParams){
          return GameService.getBy($stateParams.criteria, $stateParams.element);
        }
      }
    })
    .state('reports', {
        url: '/reports',
        parent: 'dashboard',
        templateUrl: 'views/dashboard/reports.html'
    });

});

angular.module('app-gp').run([
  "$rootScope",  "localStorageService", "$state", function($state, localStorageService, $rootScope) {
  //CARGAR TODO LO DE LOCALSTORAGE AQUI
  $rootScope.cliente = localStorageService.get('cliente');
  console.log($rootScope.cliente);

}]);
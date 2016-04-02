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
    .state('dashboard', {
      url: '/dashboard',
      parent: 'base',
      templateUrl: 'views/dashboard.html',
      controller: 'DashboardCtrl',
      resolve: {
        categories: function(GameService){
          return GameService.getCategories();
        }
      }
  })
    .state('overview', {
        url: '/overview',
        parent: 'dashboard',
        templateUrl: 'views/dashboard/overview.html'
    })
    .state('item_list', {
        url: '/item_list/:cat',
        parent: 'dashboard',
        templateUrl: 'views/dashboard/itemlist.html',
        controller: 'ListCtrl',
        resolve: {
        items: function(GameService, $stateParams){
          return GameService.getByCat($stateParams.cat);
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
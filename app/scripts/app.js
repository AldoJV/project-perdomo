/**
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
    $urlRouterProvider.when('/main', '/main/overview');
    $urlRouterProvider.otherwise('/main');

    $stateProvider
    .state('base', {
        abstract: true,
        url: '',
        templateUrl: 'views/base.html'
    })
    .state('login', {
      url: '/login',
      parent: 'base',
      templateUrl: 'views/user/login.html',
      controller: 'LoginCtrl'
  })
    .state('sign-in', {
      url: '/sign-in',
      parent: 'base',
      templateUrl: 'views/user/sign-in.html',
      controller: 'SigninCtrl'
  })
    .state('dashboard', {
      url: '/main',
      parent: 'base',
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
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
        templateUrl: 'views/item/itemlist.html',
        controller: 'ListCtrl',
        resolve: {
        items: function(GameService, $stateParams){
          return GameService.getBy($stateParams.criteria, $stateParams.element);
        }
      }
    })
    .state('item_view', {
        url: '/item_view/:i_articulo',
        parent: 'dashboard',
        templateUrl: 'views/item/item-view.html',
        controller: 'ViewCtrl',
        resolve: {
          item: function(GameService, $stateParams){
            return GameService.getItem($stateParams.i_articulo);
          }
        }
    })
    .state('create-profile', {
        url: '/create-profile',
        parent: 'base',
        templateUrl: 'views/user/create-profile.html',
        controller: 'ProfileCtrl'
    })
    .state('view-profile', {
        url: '/view-profile/:i_persona',
        parent: 'dashboard',
        templateUrl: 'views/user/view-profile.html',
        controller: 'ProfileViewCtrl',
        resolve: {
          profile: function(UserService, $stateParams){
            return UserService.getProfile($stateParams.i_persona);
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
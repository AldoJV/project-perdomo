'use strict';

/**
 * @ngdoc function
 * @name app-gp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of app-gp
 */
angular.module('app-gp')
  .controller('DashboardCtrl', function($scope, $rootScope, $state, categories) {
  	console.log($rootScope.cliente);
  	$scope.categories = categories.data.data;
    $scope.$state = $state;

  });
  
 angular.module('app-gp').controller('ListCtrl', function($scope, $state, items) {
  	$scope.items = items.data.data;
  });

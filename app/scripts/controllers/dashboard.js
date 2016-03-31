'use strict';

/**
 * @ngdoc function
 * @name yapp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of yapp
 */
angular.module('yapp')
  .controller('DashboardCtrl', function($scope, $state, categories) {
  	$scope.categories = categories.data.data;
    $scope.$state = $state;
    console.log($scope.$state);

  });
  
 angular.module('yapp').controller('ListCtrl', function($scope, $state, items) {
  	$scope.items = items.data.data;
  });

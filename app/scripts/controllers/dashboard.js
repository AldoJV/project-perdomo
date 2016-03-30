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
  	console.log($scope.games);
    $scope.$state = $state;
    console.log($scope.$state);

  });

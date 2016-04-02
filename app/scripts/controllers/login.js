'use strict';

/**
 * @ngdoc function
 * @name yapp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of yapp
 */
angular.module('yapp')
  .controller('LoginCtrl', function($scope, $location) {

    $scope.submit = function() {
    	if ($scope.form.$valid) {
    		console.log('VALID');
    	}else{
    		console.log('Invalid');
    	}
      //$location.path('/dashboard');

      return false;
    }

  });

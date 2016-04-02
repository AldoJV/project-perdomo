'use strict';

/**
 * @ngdoc function
 * @name app-gp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of app-gp
 */
angular.module('app-gp')
  .controller('LoginCtrl', function($scope, $rootScope, $location, UserService, localStorageService) {
  	$scope.credentialsError = false;
    $scope.submit = function(valid) {
    	if (valid) {
    		UserService.login($scope.user).then(function (response){
    			if(response.data.Error){
    				$scope.credentialsError = true;
    			}else{
            $rootScope.cliente = response.data.result;
            localStorageService.set('cliente', $rootScope.cliente);
    				$location.path('/dashboard');
    			}
    		});
    	}else{
    		console.log('Invalid!');
    	}
      //$location.path('/dashboard');

      return false;
    }

  });

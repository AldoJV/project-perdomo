'use strict';

/**
 * @ngdoc function
 * @name app-gp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of app-gp
 */
angular.module('app-gp')
  .controller('DashboardCtrl', function($scope, $rootScope, localStorageService, $state, categories) {
  	console.log($rootScope.cliente);
  	//hardcoding, fix later
  	$rootScope.cliente = localStorageService.get('cliente');
  	//hardcoding ends here
  	$scope.categories = categories.data.data;
    $scope.$state = $state;

  });
  
 angular.module('app-gp').controller('ListCtrl', function($scope, $state, items) {
  	$scope.items = items.data.data;
  });

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

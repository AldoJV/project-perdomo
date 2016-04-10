angular.module('app-gp')
  .controller('LoginCtrl', function($scope, $rootScope, $location, UserService, localStorageService, $state) {
  	$scope.credentialsError = false;
    $scope.submit = function(valid) {
    	if (valid) {
    		UserService.login($scope.user).then(function (response){
    			if(response.data.Error){
    				$scope.credentialsError = true;
    			}else{
            $rootScope.cliente = response.data.result;
            $rootScope.cliente.has_profile = response.data.has_profile
            localStorageService.set('cliente', $rootScope.cliente);
    				
            if ($rootScope.cliente.has_profile){
              $state.go('dashboard');  
            }else{
              $state.go('create-profile');  
            }
    			}
    		});
    	}else{
    		console.log('Invalid!');
    	}
      //$location.path('/dashboard');

      return false;
    }

  });

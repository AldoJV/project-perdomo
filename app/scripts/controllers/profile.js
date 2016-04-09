angular.module('app-gp')
  .controller('ProfileCtrl', function($scope, $rootScope, $location, UserService, localStorageService) {
  	$scope.credentialsError = false;
    $scope.submit = function(valid) {
    	if (valid){
        $rootScope.cliente = localStorageService.get('cliente');
        console.log($rootScope.cliente.i_cliente);
        $scope.user.i_cliente = $rootScope.cliente.i_cliente;
    		UserService.profile($scope.user).then(function (response){
    			console.log(response.data);
          if(response.data.Error){
            var err=response.data.detail;
            if(err.errno == 1062){
              $scope.signinerror = true;
              $scope.errMessg = "Este usuario ya está registrado, intenta otro nombre."
            }else{
              $scope.signinerror = true;
              $scope.errMessg = "Ocurrió un error inesperado, intenta de nuevo más tarde."
            }
    			}else{
            //$rootScope.cliente = response.data.result;
            //localStorageService.set('cliente', $rootScope.cliente);
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
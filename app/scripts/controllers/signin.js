angular.module('app-gp')
  .controller('SigninCtrl', function($scope, $rootScope, $state, UserService, localStorageService) {
  	$scope.credentialsError = false;
    $scope.submit = function(valid) {
    	if ((valid) && ($scope.user.password == $scope.passwordconfirm)){
        $scope.user.i_tipocliente = 1;
    		UserService.signin($scope.user).then(function (response){
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
    				$state.go('create-profile');
    			}
    		});
    	}else{
    		console.log('Invalid!');
    	}
      //$location.path('/dashboard');

      return false;
    }
  });
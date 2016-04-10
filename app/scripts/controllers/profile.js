angular.module('app-gp')
  .controller('ProfileCtrl', function($scope, $rootScope, $state, UserService, localStorageService) {
    $scope.profile = {}
  	$scope.credentialsError = false;
    $scope.submit = function(valid) {
    	if (valid){
        $rootScope.cliente = localStorageService.get('cliente');
        console.log($rootScope.cliente.i_cliente);
        $scope.profile.i_cliente = $rootScope.cliente.i_cliente;
    		UserService.setProfile($scope.profile).then(function (response){
    			console.log(response.data);
          if(response.data.Error){
            console.log('ERROR DE SERVICIO')
    			}else{
            $rootScope.cliente.i_persona = response.data.i_persona;
            $state.go('dashboard');
    			}
    		});
    	}else{
    		console.log('Invalid!');
    	}
      //$location.path('/dashboard');

      return false;
    }
  });

angular.module('app-gp')
  .controller('ProfileViewCtrl', function($scope, $rootScope, $state, profile) {
    $scope.profile = profile.data.data;
    
  });


  
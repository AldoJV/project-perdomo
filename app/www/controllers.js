angular.module('app-gp')
  .controller('MainCtrl', function($scope, $rootScope, localStorageService, $state, categories, platforms) {
  	console.log($rootScope.cliente);
  	//hardcoding, fix later
  	$rootScope.cliente = localStorageService.get('cliente');
  	//hardcoding ends here
  	$scope.categories = categories.data.data;
    $scope.platforms = platforms.data.data;
    $scope.$state = $state;

    $scope.checkProfile = function () {
    	 if ($rootScope.cliente.has_profile) {
    	 	$state.go("view-profile", ({i_persona: $rootScope.cliente.i_persona}));
    	 } else {
    	 	$state.go("create-profile");
    	 }
    }

  });
  
 angular.module('app-gp').controller('ListCtrl', function($scope, $state, items) {
  	$scope.items = items.data.data;
  });

 angular.module('app-gp').controller('ViewCtrl', function($scope, $state, item) {
  	$scope.item = item.data.data;
  	console.log($scope.item);
  });

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
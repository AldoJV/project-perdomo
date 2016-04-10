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
  
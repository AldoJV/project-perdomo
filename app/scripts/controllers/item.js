 angular.module('app-gp').controller('ListCtrl', function($scope, $state, items) {
  	$scope.items = items.data.data;
  });

 angular.module('app-gp').controller('ViewCtrl', function($scope, $state, item) {
  	$scope.item = item.data.data;
  	console.log($scope.item);
  });

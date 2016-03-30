angular.module('yapp')
  .service('GameService', function($http){
   this.get = function() {
   	return $http.get("http://localhost:3000/api/articulos/").then(function(response) {
      	return response;
    });
   }
   this.getCategories = function() {
   	return $http.get("http://localhost:3000/api/categorias/").then(function(response) {
      	return response;
    }); 	
   }
});


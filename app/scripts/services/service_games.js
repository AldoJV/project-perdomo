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
   this.getByCat = function(cat){
    url = "http://localhost:3000/api/categorias/" + cat + "/";
    console.log(cat);
    return $http.get(url).then(function(response) {
        return response;
    });
   }
});


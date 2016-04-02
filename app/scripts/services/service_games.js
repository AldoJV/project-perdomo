angular.module('app-gp')
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
   this.getBy = function(criteria, element){
    url = "http://localhost:3000/api/" + criteria + "/" + element + "/";
    return $http.get(url).then(function(response) {
        return response;
    });
   }
   this.getPlatforms = function() {
    return $http.get("http://localhost:3000/api/plataformas/").then(function(response) {
        return response;
    });   
   }
});


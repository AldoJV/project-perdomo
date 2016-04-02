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


angular.module('app-gp')
  .service('UserService', function($http){
   this.login = function(user) {
   	return $http.post("http://localhost:3000/api/login/",user).then(function(response) {
      	return response;
    });
   }
   this.signin = function(user){
   	return $http.post("http://localhost:3000/api/signin/",user).then(function(response) {
      	return response;
    });
   }
   
});
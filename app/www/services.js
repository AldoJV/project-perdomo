angular.module('app-gp')
  .service('GameService', function($http){
    serviceURL= "http://192.168.1.85:3000/api";
   this.get = function() {
   	return $http.get(serviceURL + "/articulos/").then(function(response) {
      	return response;
    });
   }
   this.getCategories = function() {
   	return $http.get(serviceURL + "/categorias/").then(function(response) {
      	return response;
    }); 	
   }
   this.getBy = function(criteria, element){
    url = serviceURL + "/" + criteria + "/" + element + "/";
    return $http.get(url).then(function(response) {
        return response;
    });
   }
   this.getPlatforms = function() {
    return $http.get(serviceURL + "/plataformas/").then(function(response) {
        return response;
    });   
   }
   this.getItem = function(i_articulo) {
    url = serviceURL + "/articulos/" + i_articulo;
    return $http.get(url).then(function(response) {
        return response;
    });   
   }
});


angular.module('app-gp')
  .service('UserService', function($http){
    serviceURL= "http://192.168.1.85:3000/api";
   this.login = function(user) {
   	return $http.post(serviceURL + "/login/",user).then(function(response) {
      	return response;
    });
   }
   this.signin = function(user){
   	return $http.post(serviceURL + "/signin/",user).then(function(response) {
      	return response;
    });
   }
   this.setProfile = function(user){
    return $http.post(serviceURL + "/persona/",user).then(function(response) {
        return response;
    });
   }
   this.getProfile = function(user){
    url = serviceURL + "/persona/" + user
    return $http.get(url).then(function(response) {
        return response;
    });
   }
   
});
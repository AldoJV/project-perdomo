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
   this.setProfile = function(user){
    return $http.post("http://localhost:3000/api/persona/",user).then(function(response) {
        return response;
    });
   }
   this.getProfile = function(user){
    url = "http://localhost:3000/api/persona/" + user
    return $http.get(url).then(function(response) {
        return response;
    });
   }
   
});
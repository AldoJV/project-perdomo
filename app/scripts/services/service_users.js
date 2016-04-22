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
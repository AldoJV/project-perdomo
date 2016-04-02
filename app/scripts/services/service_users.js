angular.module('app-gp')
  .service('UserService', function($http){
   this.login = function(user) {
   	return $http.post("http://localhost:3000/api/login/",user).then(function(response) {
      	return response;
    });
   }
   
});
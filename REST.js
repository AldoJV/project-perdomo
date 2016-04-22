var mysql   = require("mysql");

function REST_ROUTER(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

function setCORS(res){
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods","GET, POST, OPTIONS");
    return res;
}




REST_ROUTER.prototype.handleRoutes = function(router,connection,md5) {

    function updateCliente(i_cliente,i_persona) {
        var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        var table = ["cliente","i_persona",i_persona,"i_cliente",i_cliente];
        query = mysql.format(query,table);
        connection.query(query,function(err,result){
            if(err) {
                return err;
            } else {
                return result; 
            }
        });
    }

    router.use(function(req, res, next) {
      res.header("Access-Control-Allow-Origin", "*");
      res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
      next();
    });

    var self = this;

    router.get("/",function(req,res){
        res.json({"Message" : "Praise the Sun"});
    });

/*
   ###    ########  ######## ####  ######  ##     ## ##        #######   ######
  ## ##   ##     ##    ##     ##  ##    ## ##     ## ##       ##     ## ##    ##
 ##   ##  ##     ##    ##     ##  ##       ##     ## ##       ##     ## ##
##     ## ########     ##     ##  ##       ##     ## ##       ##     ##  ######
######### ##   ##      ##     ##  ##       ##     ## ##       ##     ##       ##
##     ## ##    ##     ##     ##  ##    ## ##     ## ##       ##     ## ##    ##
##     ## ##     ##    ##    ####  ######   #######  ########  #######   ######
*/

    //Listado
    router.get("/articulos",function(req,res){
        setCORS(res);
        var query = "SELECT e_articulo FROM ??";
        var table = ["articulo"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "data" : rows});
            }
        });
    });

    //Detalle Articulo individual
    router.get("/articulos/:i_articulo",function(req,res){
        setCORS(res);
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["articulo","i_articulo",req.params.i_articulo];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                row = rows[0];
                res.json({"Error" : false, "Message" : "Success", "data" : row});
            }
        });
    });

    //Listado categorias
    router.get("/categorias",function(req,res){
        setCORS(res);
        var query = "SELECT * FROM ??";
        var table = ["tipo_articulo"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "data" : rows});
            }
        });
    });

    //Listado plataformas
    router.get("/plataformas",function(req,res){
        setCORS(res);
        var query = "SELECT * FROM ?? WHERE i_plataforma <> 'NA'";
        var table = ["plataforma"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "data" : rows});
            }
        });
    });

    //Articulos por categoria
    router.get("/categorias/:i_tipo",function(req,res){
        setCORS(res);
        var query = "SELECT i_articulo, n_articulo, e_articulo, q_precioVenta FROM ?? WHERE ??=?";
        var table = ["articulo","i_tipo",req.params.i_tipo];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "data" : rows});
            }
        });
    });

    //Articulos por plataforma
    router.get("/plataformas/:i_plataforma",function(req,res){
        setCORS(res);
        var query = "SELECT i_articulo, n_articulo, e_articulo, q_precioVenta FROM ?? WHERE ??=?";
        var table = ["articulo","i_plataforma",req.params.i_plataforma];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "data" : rows});
            }
        });
    });

/*
##     ##  ######  ##     ##    ###    ########  ####  #######   ######
##     ## ##    ## ##     ##   ## ##   ##     ##  ##  ##     ## ##    ##
##     ## ##       ##     ##  ##   ##  ##     ##  ##  ##     ## ##
##     ##  ######  ##     ## ##     ## ########   ##  ##     ##  ######
##     ##       ## ##     ## ######### ##   ##    ##  ##     ##       ##
##     ## ##    ## ##     ## ##     ## ##    ##   ##  ##     ## ##    ##
 #######   ######   #######  ##     ## ##     ## ####  #######   ######
*/
    //LOGIN
    router.post("/login",function(req,res){
        setCORS(res);
        var query = "SELECT * FROM ?? WHERE ??=? AND ??=?";
        var table = ["cliente","n_username", req.body.username, "e_password", md5(req.body.password)];

        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                if (rows.length > 0) {
                    var has_profile;
                    row = rows[0];
                    delete row.e_password;
                    if (row.i_persona == null) {
                        has_profile = false;
                    } else {
                        has_profile = true;
                    }
                    res.json({"Error" : false, "Message" : "Todo chicles", "result":row, "has_profile": has_profile});
                } else {
                    res.json({"Error" : true, "Message" : "BAD LOGIN"});
                }
                
            }
        });
    });

    //Crear cuenta
    router.post("/signin",function(req,res){
        var query = "INSERT INTO ??(??,??,??) VALUES (?,?,?)";
        var table = ["cliente","n_username","e_password","i_tipocliente",req.body.username,md5(req.body.password),req.body.i_tipocliente];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query", "detail": err});
            } else {
                res.json({"Error" : false, "Message" : "Usuario añadido exitosamente!"});
            }
        });
    });


    //Obtener Perfil
    router.get("/persona/:i_persona",function(req,res){
        setCORS(res);
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["persona","i_persona",req.params.i_persona];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                var row = rows[0];
                res.json({"Error" : false, "Message" : "Success", "data" : row});
            }
        });
    });

    //Crear perfil
    router.post("/persona",function(req,res){
        var query = "INSERT INTO ??(??,??,??,??,??,??) VALUES (?,?,?,?,?,?)";
        var values = ["persona",
                    "n_persona",
                    "n_apaterno",
                    "n_amaterno",
                    "i_genero",
                    "d_nacimiento",
                    "e_email",
                    req.body.n_persona,
                    req.body.n_apaterno,
                    req.body.n_amaterno,
                    req.body.i_genero,
                    req.body.d_nacimiento,
                    req.body.e_email,
                    ];

        query = mysql.format(query,values);
        connection.query(query,function(err,result){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query", "detail": err});
            } else {
                updateCliente(req.body.i_cliente,result.insertId);
                res.json({"Error" : false, "Message" : "Perfil creado exitosamente!", "i_persona" : result.insertId});
            }
        });
    });

/*
########  ######## ######## ######## ########  ######## ##    ##  ######  ####    ###
##     ## ##       ##       ##       ##     ## ##       ###   ## ##    ##  ##    ## ##
##     ## ##       ##       ##       ##     ## ##       ####  ## ##        ##   ##   ##
########  ######   ######   ######   ########  ######   ## ## ## ##        ##  ##     ##
##   ##   ##       ##       ##       ##   ##   ##       ##  #### ##        ##  #########
##    ##  ##       ##       ##       ##    ##  ##       ##   ### ##    ##  ##  ##     ##
##     ## ######## ##       ######## ##     ## ######## ##    ##  ######  #### ##     ##
*/
    router.get("/users",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["user_login"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });


    router.get("/users/:user_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["user_login","user_id",req.params.user_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });

    router.post("/users",function(req,res){
        var query = "INSERT INTO ??(??,??) VALUES (?,?)";
        var table = ["user_login","user_email","user_password",req.body.email,md5(req.body.password)];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "User Added !"});
            }
        });
    });

    router.put("/users",function(req,res){
        var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        var table = ["user_login","user_password",md5(req.body.password),"user_email",req.body.email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Updated the password for email "+req.body.email});
            }
        });
    });

    router.delete("/users/:email",function(req,res){
        var query = "DELETE from ?? WHERE ??=?";
        var table = ["user_login","user_email",req.params.email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error executing MySQL query"});
            } else {
                res.json({"Error" : false, "Message" : "Deleted the user with email "+req.params.email});
            }
        });
    });
// Example END
}

module.exports = REST_ROUTER;

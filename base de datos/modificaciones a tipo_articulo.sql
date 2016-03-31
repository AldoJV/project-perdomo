use games;
desc tipo_articulo;
ALTER TABLE tipo_articulo change e_tipo_articulo n_tipo_articulo VARCHAR(25) NOT NULL;
ALTER TABLE tipo_articulo ADD e_tipo_articulo VARCHAR(50) NOT NULL;
ALTER TABLE tipo_articulo ADD img_tipo_articulo VARCHAR(50) NOT NULL;
ALTER TABLE tipo_articulo DROP COLUMN img_tipo_articulo;
update tipo_articulo set n_tipo_articulo = concat(n_tipo_articulo,'s');
update tipo_articulo set n_tipo_articulo = 'Promocionales' where i_tipo_articulo = 'PRM';
update tipo_articulo set n_tipo_articulo = 'Tarjetas y Suscripciones' where i_tipo_articulo = 'CRD';

update tipo_articulo set e_tipo_articulo = 'Los mejores videojuegos, de todo tipo' where i_tipo_articulo = 'GAM';
update tipo_articulo set e_tipo_articulo = 'Todo para mejorar tu forma de jugar' where i_tipo_articulo = 'CRD';
update tipo_articulo set e_tipo_articulo = 'Poderosas consolas a precios increibles' where i_tipo_articulo = 'CON';
update tipo_articulo set e_tipo_articulo = 'Coleccionables de tus juegos favoritos' where i_tipo_articulo = 'PRM';
update tipo_articulo set e_tipo_articulo = 'Lo necesario para que juegues como campeón' where i_tipo_articulo = 'ACC';

select * from tipo_articulo;

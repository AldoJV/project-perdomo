use games;
alter table cliente MODIFY e_password varchar(32) NOT NULL;
delete from cliente where n_username = 'aldo2';
desc cliente;
alter table plataforma MODIFY e_plataforma varchar(50) NOT NULL;
update plataforma set e_plataforma='Nintendo Gamecube' WHERE i_plataforma = 'GCN';
update plataforma set e_plataforma='PC Master Race' WHERE i_plataforma = 'PC';
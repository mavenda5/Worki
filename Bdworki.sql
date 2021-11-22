create database worki;
use worki;


create table usuario(
	id int not null IDENTITY(1,1) primary key,
	nombres varchar(50),
	apellidos varchar(50),
	nombre_usuario varchar(50),
	correo_institucional varchar(255),
	contraseña varchar(60),
	cargo_empleado varchar(50),
	hobbies varchar(100),
	gustos_profesionales varchar(255),
	codigo_recuperacion varchar(20),
	usuario_activo bit not null,
	es_administrador bit not null,
	fecha_creacion datetime
);

create table datos_recuperacion (
	id int not null IDENTITY(1,1) primary key,
	usuario_id int,
	code varchar(20),
	is_used bit not null,
	created_at datetime,
	foreign key(usuario_id) references usuario(id)
);

create table nivel_visualizacion(
	id int not null IDENTITY(1,1) primary key,
	name varchar(50)
);

insert into nivel_visualizacion (nombre) values ('Publico'), ('Solo amigos'), ('Amigos de mis amigos');

create table pais(
	id int not null IDENTITY(1,1) primary key,
	nombre varchar(50),
	prefijo varchar(50)
);

insert into pais(nombre,prefijo) values ('Mexico','mx'),('Argentina','ar'),('España','es'),('Estados Unidos','eu'),('Chile','cl'),('Colombia','co'),('Peru','pe');




create table estado_sentimental(
	id int not null IDENTITY(1,1) primary key,
	nombre varchar(50)
);

insert into estado_sentimental(nombre) values ('Soltero'),('Casado'),('Divorciado'),('Union libre');

create table perfil(
	fecha_nacimiento date ,
	genero varchar(1) ,
	imagen_perfil varchar(255),
	titulo_perfil varchar(255),
	biografia varchar(255),
	estado_actual varchar(500),
	cosas_que_gustan text,
	cosas_que_no_gustan text,
	direccion varchar(255) ,
	celular varchar(255) ,
	correo_personal varchar(255) ,
	usuario_id int ,
	pais_id int ,
	nivel_visualizacion_id int ,
	estado_sentimental_id int ,
	foreign key (estado_sentimental_id) references estado_sentimental(id),
	foreign key (pais_id) references pais(id),
	foreign key (nivel_visualizacion_id) references nivel_visualizacion(id),
	foreign key (usuario_id) references usuario(id)
);

create table album(
	id int not null IDENTITY(1,1) primary key,
	titulo varchar(200),
	contenido varchar(500),
	usuario_id int,
	nivel_visualizacion_id int,
	fecha_creacion datetime,
	foreign key (usuario_id) references usuario(id),
	foreign key (nivel_visualizacion_id) references nivel_visualizacion(id)
);
create table imagen(
	id int not null IDENTITY(1,1) primary key,
	src varchar(255),
	titulo varchar(200),
	contenido varchar(500),
	usuario_id int,
	nivel_visualizacion_id int,
	album_id int,
	fecha_creacion datetime,
	foreign key (album_id) references album(id),
	foreign key (usuario_id) references usuario(id),
	foreign key (nivel_visualizacion_id) references nivel_visualizacion(id)
);

	 type_id:
	 1.- post
	 2.- image

create table megustas(
	id int not null IDENTITY(1,1) primary key,
	type_id int default 1,
	ref_id int,
	usuario_id int,
	fecha_creacion datetime,
	foreign key (usuario_id) references usuario(id)
);

create table comentarios(
	id int not null IDENTITY(1,1) primary key,
	type_id int,
	ref_id int,
	usuario_id int,
	contenido text,
	comentarios_id int,
	fecha_creacion datetime,
	foreign key (usuario_id) references usuario(id),
	foreign key (comentarios_id) references comentarios(id)
);

tipo_publicacion:
1. - status	
2. - event
create table post(
	id int not null IDENTITY(1,1) primary key,
	titulo varchar(500) ,
	contenido text,
	lat float ,
	lng float ,
	f_inicio datetime,
	f_finalizacion datetime,
	receptor_type_id int default 1, /* 1.- user, 2.- group **/
	author_ref_id int,
	receptor_ref_id int,
	nivel_visualizacion_id int,
	tipo_publicacion int default 1,
	fecha_creacion datetime,
	comentarios_id int,
	megustas_id int,
	foreign key (nivel_visualizacion_id) references nivel_visualizacion(id),
	foreign key (comentarios_id) references comentarios(id),
	foreign key (megustas_id) references megustas(id)
);

create table video(
	id int not null IDENTITY(1,1) primary key,
	src varchar(255),
	titulo varchar(200),
	contenido varchar(500),
	usuario_id int,
	nivel_visualizacion_id int,
	album_id int,
	fecha_creacion datetime,
	foreign key (album_id) references album(id),
	foreign key (usuario_id) references usuario(id),
	foreign key (nivel_visualizacion_id) references nivel_visualizacion(id)
);

create table post_imagen_video(
	post_id int,
	imagen_id int,
	video_id int,
	foreign key (post_id) references post(id),
	foreign key (imagen_id) references imagen(id),
	foreign key (video_id) references video(id)
);



create table amigos(
	id int not null IDENTITY(1,1) primary key,
	sender_id int,
	receptor_id int,
	aceptar_invitacion bit not null,
	leida_solicitud bit not null,
	fecha_creacion datetime,
	foreign key (sender_id) references usuario(id),
	foreign key (receptor_id) references usuario(id)
);

create table conversacion(
	id int not null IDENTITY(1,1) primary key,
	sender_id int,
	receptor_id int,
	fecha_creacion datetime,
	foreign key (sender_id) references usuario(id),
	foreign key (receptor_id) references usuario(id)
);
create table mensajes(
	id int not null IDENTITY(1,1) primary key,
	contenido text,
	usuario_id int,
	conversacion_id int,
	fecha_creacion datetime,
	fue_leido bit not null,
	foreign key (usuario_id) references usuario(id),
	foreign key (conversacion_id) references conversacion(id)
);
tipo_notificacion_id:

1. - like, 2. - Comment

Type_id:

1. - post, 2. - Image

create table notificaciones(
	id int not null IDENTITY(1,1) primary key,
	tipo_notificacion_id int,
	type_id int,
	ref_id int,
	receptor_id int,
	sender_id int,
	fue_leido bit not null,
	fecha_creacion datetime,
	foreign key (sender_id) references usuario(id),
	foreign key (receptor_id) references usuario(id)
);

create table grupos (
	id int not null IDENTITY(1,1) primary key,
	imagen varchar(200),
	titulo varchar(200),
	descripcion varchar(500) ,
	usuario_id int,
	estado int default 1 /* 1.- open, 2.- closed */,
	fecha_creacion datetime,
	foreign key (usuario_id) references usuario(id)
);

create table eventos (
	id int not null IDENTITY(1,1) primary key,
	nombre varchar(50),
	descripcion varchar(500) ,
	fecha_evento datetime,
	duracion_evento datetime,
	lugar_evento varchar(200),
	invitados int,
	usuario_id int,
	estado int default 1 /* 1.- open, 2.- closed */,
	fecha_creacion datetime,
	foreign key (usuario_id) references usuario(id)
);

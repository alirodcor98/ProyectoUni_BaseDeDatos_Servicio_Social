-- *********************************************************************************************************
-- Creando base de datos y tablas
SET NAMES 'utf8';
DROP DATABASE IF EXISTS servicio_social;
CREATE DATABASE IF NOT EXISTS servicio_social DEFAULT CHARACTER SET utf8;
USE servicio_social;

CREATE TABLE roles(
	id_ros					INTEGER NOT NULL AUTO_INCREMENT,
	nombre_ros				VARCHAR(35) NOT NULL,
	PRIMARY KEY(id_ros),
	CONSTRAINT nombre_rol_repetido UNIQUE(nombre_ros)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE grupos(
	id_grs					INTEGER NOT NULL AUTO_INCREMENT,
	nombre_grs				VARCHAR(20) NOT NULL,
	PRIMARY KEY(id_grs),
	CONSTRAINT nombre_grupo_repetido UNIQUE(nombre_grs)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE alumnos(
	curp_als				CHAR(18) NOT NULL,
	nombre_als				VARCHAR(20) NOT NULL,
	apellido_paterno_als	VARCHAR(15) NOT NULL,
	apellido_materno_als	VARCHAR(15) NOT NULL,
	semestre_entrada_als	SMALLINT NOT NULL,
	servicio_concluido_als	BOOLEAN NOT NULL DEFAULT FALSE,
	id_ros					INTEGER NOT NULL,
	id_grs					INTEGER NOT NULL,
	PRIMARY KEY(curp_als),
	CONSTRAINT error_id_ros_als FOREIGN KEY(id_ros) REFERENCES roles(id_ros),
	CONSTRAINT error_id_grs_als FOREIGN KEY(id_grs) REFERENCES grupos(id_grs),
	CONSTRAINT curp_repetida UNIQUE(curp_als),
	CONSTRAINT tamanio_incorrecto_curp CHECK(curp_als LIKE '__________________'),
	CONSTRAINT semestre_invalido CHECK(semestre_entrada_als IN (1,2,3,4,5,6,7,8,9,10,11,12,13,14)),
	CONSTRAINT booleano_invalido_servicio CHECK(servicio_concluido_als IN (0,1))
)DEFAULT CHARACTER SET utf8;

CREATE TABLE cubiculos(
	id_cus					INTEGER NOT NULL AUTO_INCREMENT,
	nombre_cus				VARCHAR(20) NOT NULL,
	PRIMARY KEY(id_cus),
	CONSTRAINT nombre_cubiculo_repetido UNIQUE(nombre_cus)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE grupos_cubiculos(
	id_ocupacion_grc		INTEGER NOT NULL AUTO_INCREMENT,
	fecha_inicial_grc		DATETIME NOT NULL,
	fecha_final_grc			DATETIME NOT NULL,
	id_grs					INTEGER NOT NULL,
	id_cus					INTEGER NOT NULL,
	PRIMARY KEY(id_ocupacion_grc),
	CONSTRAINT error_id_grs_grc FOREIGN KEY(id_grs) REFERENCES grupos(id_grs),
	CONSTRAINT error_id_cus_grc FOREIGN KEY(id_cus) REFERENCES cubiculos(id_cus),
	CONSTRAINT fecha_inicial_invalida_grc CHECK(fecha_inicial_grc LIKE '____-__-__ __:__:__'),
	CONSTRAINT fecha_final_invalida_grc CHECK(fecha_final_grc LIKE '____-__-__ __:__:__')
)DEFAULT CHARACTER SET utf8;

CREATE TABLE companias(
	id_cos					INTEGER NOT NULL AUTO_INCREMENT,
	nombre_cos				VARCHAR(30) NOT NULL,
	telefono_cos			CHAR(10) NOT NULL,
	correo_cos				VARCHAR(30) NOT NULL,
	calle_cos			    VARCHAR(30) NOT NULL,
	colonia_cos				VARCHAR(30) NOT NULL,
	estado_cos				VARCHAR(20) NOT NULL,
	PRIMARY KEY(id_cos),
	CONSTRAINT nombre_compania_repetido UNIQUE(nombre_cos),
	CONSTRAINT telefono_repetido UNIQUE(telefono_cos),
	CONSTRAINT telefono_invalido CHECK(telefono_cos LIKE '__________'),
	CONSTRAINT correo_repetido UNIQUE(correo_cos),
	CONSTRAINT correo_invalido CHECK(correo_cos LIKE '%@%.%'),
	CONSTRAINT ubicacion_repetida UNIQUE(calle_cos)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE servicios(
	id_ses					INTEGER NOT NULL AUTO_INCREMENT,
	nombre_ses				VARCHAR(35) NOT NULL,
	id_cos					INTEGER NOT NULL,
	PRIMARY KEY(id_ses),
	CONSTRAINT error_id_cos_ses FOREIGN KEY(id_cos) REFERENCES companias(id_cos)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE grupos_servicios(
	id_acuerdo_gre			INTEGER NOT NULL AUTO_INCREMENT,
	fecha_inicio_gre		DATE NOT NULL,
	fecha_termino_gre		DATE,
	concluido_gre			BOOLEAN NOT NULL DEFAULT FALSE,
	id_grs					INTEGER NOT NULL,
	id_ses					INTEGER NOT NULL,
	PRIMARY KEY(id_acuerdo_gre),
	CONSTRAINT error_id_grs_gre FOREIGN KEY(id_grs) REFERENCES grupos(id_grs),
	CONSTRAINT error_id_ses_gre FOREIGN KEY(id_ses) REFERENCES servicios(id_ses),
	CONSTRAINT fecha_inicio_invalida_gre CHECK(fecha_inicio_gre LIKE '____-__-__'),
	CONSTRAINT fecha_final_invalida_gre CHECK(fecha_termino_gre LIKE '____-__-__'),
	CONSTRAINT booleano_invalido_gre CHECK(concluido_gre IN (0,1))
)DEFAULT CHARACTER SET utf8;



-- Tablas para el histórico/respaldo
CREATE TABLE historico_roles(
	datos_historico_roles	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_grupos(
	datos_historico_grupos	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_alumnos(
	datos_historico_alumnos	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_cubiculos(
	datos_historico_cubiculos	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_grupos_cubiculos(
	datos_historico_grupos_cubiculos	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_companias(
	datos_historico_companias	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_servicios(
	datos_historico_servicios	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;

CREATE TABLE historico_grupos_servicios(
	datos_historico_grupos_servicios	VARCHAR(200)
)DEFAULT CHARACTER SET utf8;



















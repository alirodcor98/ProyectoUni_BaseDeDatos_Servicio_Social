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



-- ************************************************************************************************************
-- PRUEBAS PARA LOS CONSTRAINT, IGNORAR EN LO POSIBLE, SOLO ES PARA TESTEO DE INTRODUCCIÓN CORRECTA DE DATOS

-- Pruebas roles
-- INSERT INTO roles(nombre_ros) VALUES ('demo');
-- INSERT INTO roles(nombre_ros) VALUES ('demo');

-- Pruebas grupos
-- INSERT INTO grupos(nombre_grs) VALUES ('demo');
-- INSERT INTO grupos(nombre_grs) VALUES ('demo');

-- Prueba alumnos
-- INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als,
-- apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros,
-- id_grs) VALUES ('ROCA980511HOCDRL02', 'Alí', 'Rodríguez', 'Cortés', 8, 0, 1, 1);

-- Prueba cubiculos
-- INSERT INTO cubiculos(nombre_cus) VALUES ('Cubiculo 1');
-- INSERT INTO cubiculos(nombre_cus) VALUES ('Cubiculo 1');

-- Prueba grupo_cubiculos
-- INSERT INTO grupos_cubiculos(fecha_inicial_grc, fecha_final_grc, id_grs, id_cus) 
-- VALUES ('2021-10-11 22:33:22','2021-11-11 22:33:22', 1, 1);

-- Prueba compania
-- INSERT INTO companias(nombre_cos, telefono_cos, correo_cos, calle_cos, colonia_cos,
-- estado_cos) VALUES ('Bimbo', '5585961523', 'bimbo@bimbo.com', 'Pedraza No. 6', 'Monte Alto', 'Veracruz');

-- Prueba servicios
-- INSERT INTO servicios(nombre_ses,id_cos) VALUES ('Diseñar bases de datos', 1);
-- INSERT INTO servicios(nombre_ses,id_cos) VALUES ('Diseñar páginas web', 1);
 
-- Prueba grupos_servicios
-- INSERT INTO grupos_servicios(fecha_inicio_gre, fecha_termino_gre, concluido_gre, id_grs, id_ses)
-- VALUES ('2021-11-12', '2021-12-13', 0, 1, 1);


-- FIN DE LAS LINEAS DE TESTEO PARA INSERCIONES Y CONSTRAINT
-- ******************************************************************************************************************







-- ******************************************************************************************************************
-- Espacio para triggers, procesos almacenados y vistas

-- -------------- Triggers para casos de DELETE ---------------
-- Para roles
DELIMITER $$
CREATE TRIGGER roles_hist AFTER DELETE ON roles FOR EACH ROW
BEGIN
	INSERT INTO historico_roles(datos_historico_roles)
	VALUES (concat(old.id_ros, ';', old.nombre_ros));
END $$
DELIMITER ;

-- Para grupos
DELIMITER $$
CREATE TRIGGER grupos_hist AFTER DELETE ON grupos FOR EACH ROW
BEGIN
	INSERT INTO historico_grupos(datos_historico_grupos)
	VALUES (concat(old.id_grs, ';', old.nombre_grs));
END $$
DELIMITER ;

-- Para alumnos
DELIMITER $$
CREATE TRIGGER alumnos_hist AFTER DELETE ON alumnos FOR EACH ROW
BEGIN
	INSERT INTO historico_alumnos(datos_historico_alumnos)
	VALUES (concat(old.curp_als, ';', old.nombre_als, ';', 
	old.apellido_paterno_als, ';', old.apellido_materno_als, ';',
	old.semestre_entrada_als, ';', old.servicio_concluido_als, ';',
	old.id_ros, ';', old.id_grs));
END $$
DELIMITER ;

-- Para cubiculos
DELIMITER $$
CREATE TRIGGER cubiculos_hist AFTER DELETE ON cubiculos FOR EACH ROW
BEGIN
	INSERT INTO historico_cubiculos(datos_historico_cubiculos)
	VALUES (concat(old.id_cus, ';', old.nombre_cus));
END $$
DELIMITER ;

-- Para grupos_cubiculos
DELIMITER $$
CREATE TRIGGER grupos_cubiculos_hist AFTER DELETE ON grupos_cubiculos FOR EACH ROW
BEGIN
	INSERT INTO historico_grupos_cubiculos(datos_historico_grupos_cubiculos)
	VALUES (concat(old.id_ocupacion_grc, ';', old.fecha_final_grc, ';', 
	old.fecha_final_grc, ';', old.id_grs, ';', old.id_cus));
END $$
DELIMITER ;

-- Para compañias
DELIMITER $$
CREATE TRIGGER companias_hist AFTER DELETE ON companias FOR EACH ROW
BEGIN
	INSERT INTO historico_companias(datos_historico_companias)
	VALUES (concat(old.id_cos, ';', old.nombre_cos, ';',
	old.telefono_cos, ';', old.correo_cos, ';', old.calle_cos, ';', 
	old.colonia_cos, ';', estado_cos));
END $$
DELIMITER ;

-- Para servicios
DELIMITER $$
CREATE TRIGGER servicios_hist AFTER DELETE ON servicios FOR EACH ROW
BEGIN
	INSERT INTO historico_servicios(datos_historico_servicios)
	VALUES (concat(old.id_ses, ';', old.nombre_ses, ';', old.id_cos));
END $$
DELIMITER ;

-- Para grupos_servicios
DELIMITER $$
CREATE TRIGGER grupos_servicios_hist AFTER DELETE ON grupos_servicios FOR EACH ROW
BEGIN
	INSERT INTO historico_grupos_servicios(datos_historico_grupos_servicios)
	VALUES (concat(old.id_acuerdo_gre, ';', old.fecha_inicio_gre, ';', 
	old.fecha_termino_gre, ';', old.concluido_gre, ';', old.id_grs, ';',
	old.id_ses));
END $$
DELIMITER ;

-- -------------- Triggers para casos de UPDATE ---------------
-- Para roles
DELIMITER $$
CREATE TRIGGER roles_hist_upt AFTER UPDATE ON roles FOR EACH ROW
BEGIN
	INSERT INTO historico_roles(datos_historico_roles)
	VALUES (concat(old.id_ros, ';', old.nombre_ros));
END $$
DELIMITER ;

-- Para grupos
DELIMITER $$
CREATE TRIGGER grupos_hist_upt AFTER UPDATE ON grupos FOR EACH ROW
BEGIN
	INSERT INTO historico_grupos(datos_historico_grupos)
	VALUES (concat(old.id_grs, ';', old.nombre_grs));
END $$
DELIMITER ;

-- Para alumnos
DELIMITER $$
CREATE TRIGGER alumnos_hist_upt AFTER UPDATE ON alumnos FOR EACH ROW
BEGIN
	INSERT INTO historico_alumnos(datos_historico_alumnos)
	VALUES (concat(old.curp_als, ';', old.nombre_als, ';', 
	old.apellido_paterno_als, ';', old.apellido_materno_als, ';',
	old.semestre_entrada_als, ';', old.servicio_concluido_als, ';',
	old.id_ros, ';', old.id_grs));
END $$
DELIMITER ;

-- Para cubiculos
DELIMITER $$
CREATE TRIGGER cubiculos_hist_upt AFTER UPDATE ON cubiculos FOR EACH ROW
BEGIN
	INSERT INTO historico_cubiculos(datos_historico_cubiculos)
	VALUES (concat(old.id_cus, ';', old.nombre_cus));
END $$
DELIMITER ;

-- Para grupos_cubiculos
DELIMITER $$
CREATE TRIGGER grupos_cubiculos_hist_upt AFTER UPDATE ON grupos_cubiculos FOR EACH ROW
BEGIN
	INSERT INTO historico_grupos_cubiculos(datos_historico_grupos_cubiculos)
	VALUES (concat(old.id_ocupacion_grc, ';', old.fecha_final_grc, ';', 
	old.fecha_final_grc, ';', old.id_grs, ';', old.id_cus));
END $$
DELIMITER ;

-- Para compañias
DELIMITER $$
CREATE TRIGGER companias_hist_upt AFTER UPDATE ON companias FOR EACH ROW
BEGIN
	INSERT INTO historico_companias(datos_historico_companias)
	VALUES (concat(old.id_cos, ';', old.nombre_cos, ';',
	old.telefono_cos, ';', old.correo_cos, ';', old.calle_cos, ';', 
	old.colonia_cos, ';', estado_cos));
END $$
DELIMITER ;

-- Para servicios
DELIMITER $$
CREATE TRIGGER servicios_hist_upt AFTER UPDATE ON servicios FOR EACH ROW
BEGIN
	INSERT INTO historico_servicios(datos_historico_servicios)
	VALUES (concat(old.id_ses, ';', old.nombre_ses, ';', old.id_cos));
END $$
DELIMITER ;

-- Para grupos_servicios
DELIMITER $$
CREATE TRIGGER grupos_servicios_hist_upt AFTER UPDATE ON grupos_servicios FOR EACH ROW
BEGIN
	INSERT INTO historico_grupos_servicios(datos_historico_grupos_servicios)
	VALUES (concat(old.id_acuerdo_gre, ';', old.fecha_inicio_gre, ';', 
	old.fecha_termino_gre, ';', old.concluido_gre, ';', old.id_grs, ';',
	old.id_ses));
END $$
DELIMITER ;


-- --------- Trigger para las mayusculas ----------------
-- Para roles
DELIMITER $$
CREATE TRIGGER roles_mayus BEFORE INSERT ON roles FOR EACH ROW
BEGIN
	SET NEW.nombre_ros = UPPER(NEW.nombre_ros);
END $$
DELIMITER ;

-- Para grupos
DELIMITER $$
CREATE TRIGGER grupos_mayus BEFORE INSERT ON grupos FOR EACH ROW
BEGIN
	SET NEW.nombre_grs = UPPER(NEW.nombre_grs);
END $$
DELIMITER ;

-- Para alumnos
DELIMITER $$
CREATE TRIGGER alumnos_mayus BEFORE INSERT ON alumnos FOR EACH ROW
BEGIN
	SET NEW.nombre_als = UPPER(NEW.nombre_als),
		NEW.apellido_paterno_als = UPPER(NEW.apellido_paterno_als),
		NEW.apellido_materno_als = UPPER(NEW.apellido_materno_als);
END $$
DELIMITER ;

-- Para cubiculos
DELIMITER $$
CREATE TRIGGER cubiculos_mayus BEFORE INSERT ON cubiculos FOR EACH ROW
BEGIN
	SET NEW.nombre_cus = UPPER(NEW.nombre_cus);
END $$
DELIMITER ;

-- Para companias
DELIMITER $$
CREATE TRIGGER companias_mayus BEFORE INSERT ON companias FOR EACH ROW
BEGIN
	SET NEW.nombre_cos = UPPER(NEW.nombre_cos),
		NEW.calle_cos = UPPER(NEW.calle_cos),
		NEW.colonia_cos = UPPER(NEW.colonia_cos),
		NEW.estado_cos = UPPER(NEW.estado_cos);
END $$
DELIMITER ;

-- Para servicios
DELIMITER $$
CREATE TRIGGER servicios_mayus BEFORE INSERT ON servicios FOR EACH ROW
BEGIN
	SET NEW.nombre_ses = UPPER(NEW.nombre_ses);
END $$
DELIMITER ;



-- *** Trigger para evitar que la fecha de finalización de un servicio sea menor a su fecha de inicio ***
DELIMITER $$
CREATE TRIGGER grupos_servicios_BI BEFORE INSERT ON grupos_servicios FOR EACH ROW
BEGIN
	IF(NEW.fecha_termino_gre > NEW.fecha_inicio_gre) THEN
		SIGNAL SQLSTATE '22002' SET MESSAGE_TEXT='Fechas incorrectas';
	END IF;
END $$
DELIMITER ;


-- ------------------------ Trigger para evitar traslapes en cubiculos -----------------
DELIMITER $$
CREATE TRIGGER grupos_cubiculos_BI BEFORE INSERT ON grupos_cubiculos FOR EACH ROW
BEGIN
	DECLARE espacio INTEGER(2);
	IF(NEW.fecha_inicial_grc < NEW.fecha_final_grc) THEN
		SELECT COUNT(*) INTO espacio FROM grupos_cubiculos WHERE
			(NEW.id_cus = id_cus) AND
			((fecha_inicial_grc BETWEEN NEW.fecha_inicial_grc AND NEW.fecha_final_grc) OR
			(fecha_final_grc BETWEEN NEW.fecha_inicial_grc AND NEW.fecha_final_grc));
		IF(espacio > 0) THEN
			SIGNAL SQLSTATE '22000' SET MESSAGE_TEXT='No se puede apartar el cubículo';
		END IF;
	ELSE
			SIGNAL SQLSTATE '22001' SET MESSAGE_TEXT='Fechas incorrectas';
	END IF;
END $$
DELIMITER ;


-- ****** Trigger para que el valor de termino de un servicio cambie una vez que se la ha puesto fecha fin *******
DELIMITER $$
CREATE TRIGGER grupos_servicios_FIN BEFORE UPDATE ON grupos_servicios FOR EACH ROW
BEGIN
	SET NEW.concluido_gre = TRUE;
END $$
DELIMITER ;


-- ** Procedimiento almacenado para calcular horas laboradas entre dos fechas **
-- DELIMITER $$
-- CREATE PROCEDURE calculo_horas(in fecha_inicio_gre DATE, in fecha_termino_gre DATE)
	-- BEGIN
		-- DECLARE dias_totales int;
		-- DECLARE dias_trabajados int;
		-- DECLARE semanas float;
		-- DECLARE horas int;
	
		-- SET dias_totales = DATEDIFF(fecha_inicio_gre, fecha_termino_gre);
	
		-- SET semanas = dias_totales/7;
		-- SET dias_trabajados = dias_totales - (TRUNCATE(semanas,0)*2);
		-- SET horas = dias_trabajados * 6;
		-- SELECT horas;
	-- END $$
-- DELIMITER ;

-- ** Creando una vista para contar el total de horas de servicio de un alumno **
 CREATE VIEW calcular_horas_grupo AS SELECT DATEDIFF(fecha_inicio_gre, fecha_termino_gre)
 FROM grupos_servicios a INNER JOIN grupos b ON a.id_grs = b.id_grs
 INNER JOIN alumnos c ON b.id_grs = c.id_grs
 WHERE a.concluido_gre = TRUE AND c.curp_als = 'ROCA980511HOCDRL02';




-- ********* Espacio para las inserciones de prueba *********
-- Inserciones para roles
INSERT INTO roles(nombre_ros) VALUES ('Desarrolador web');
INSERT INTO roles(nombre_ros) VALUES ('Programador móvil');
INSERT INTO roles(nombre_ros) VALUES ('Diseñador de base de Datos');
INSERT INTO roles(nombre_ros) VALUES ('Testeador de bugs');
INSERT INTO roles(nombre_ros) VALUES ('Desarrollador BlockChain');

-- Inserciones para grupos
INSERT INTO grupos(nombre_grs) VALUES ('123');
INSERT INTO grupos(nombre_grs) VALUES ('ardillas');
INSERT INTO grupos(nombre_grs) VALUES ('fes society');
INSERT INTO grupos(nombre_grs) VALUES ('dev phantom');
INSERT INTO grupos(nombre_grs) VALUES ('devpredators');

-- Inserciones para alumnos
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('C8ZFPSVD8U4JXRSG6T', 'Raul', 'Jimenez', 'Díaz', 5, FALSE, 1, 1);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('NLLPDBQQKS9U8RRW29', 'Pedro', 'Rodríguez', 'Paredes', 5, FALSE, 2, 1);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('8KTXWCZY2VCYR2K2UC', 'Ana', 'Rosario', 'Pedraza', 5, FALSE, 3, 1);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('N6BB2LSZ9UM78JSE42', 'Lilia', 'Carmona', 'Cortés', 5, FALSE, 4, 2);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('HQMR7L4U3FVML8UGZ5', 'Sara', 'Rosales', 'Olivares', 5, FALSE, 5, 2);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('XECTARP56VXQDGSP9Q', 'Daniel', 'Cortés', 'Olimpo', 5, FALSE, 1, 3);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('U7D3H2GGCYBL4SHASG', 'Arantxa', 'Sanchez', 'Santiago', 5, FALSE, 2, 3);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('CJ857Q3GEZS32GKJ5R', 'Roman', 'Trejo', 'Velasco', 5, FALSE, 3, 4);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('LYWWL33PTMNU48Z7QG', 'Diego', 'Morales', 'Camacho', 5, FALSE, 1, 4);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('ATK2FZNVWL9RQ7VHYJ', 'Santiago', 'Carmona', 'Rosales', 5, FALSE, 2, 5);
INSERT INTO alumnos(curp_als, nombre_als, apellido_paterno_als, apellido_materno_als, semestre_entrada_als, servicio_concluido_als, id_ros, id_grs)
VALUES ('DS9KAYN2TH7RTM5BXG', 'Alejandra', 'Díaz', 'Sanchez', 5, FALSE, 3, 5);

-- Inserciones para cubiculos
INSERT INTO cubiculos(nombre_cus) VALUES ('001');
INSERT INTO cubiculos(nombre_cus) VALUES ('002');
INSERT INTO cubiculos(nombre_cus) VALUES ('003');
INSERT INTO cubiculos(nombre_cus) VALUES ('004');
INSERT INTO cubiculos(nombre_cus) VALUES ('005');

-- Inserciones para grupos_cubiculos
INSERT INTO grupos_cubiculos(fecha_inicial_grc, fecha_final_grc, id_grs, id_cus)
VALUES ('2021/02/23 22:20','2021/03/15 22:20', 1, 1);
INSERT INTO grupos_cubiculos(fecha_inicial_grc, fecha_final_grc, id_grs, id_cus)
VALUES ('2021/03/16 14:30','2021/03/22 14:30', 2, 1);
INSERT INTO grupos_cubiculos(fecha_inicial_grc, fecha_final_grc, id_grs, id_cus)
VALUES ('2021/03/23 17:25','2021/03/25 17:25', 3, 1);
INSERT INTO grupos_cubiculos(fecha_inicial_grc, fecha_final_grc, id_grs, id_cus)
VALUES ('2021/03/23 14:15','2021/03/28 12:25', 4, 2);
INSERT INTO grupos_cubiculos(fecha_inicial_grc, fecha_final_grc, id_grs, id_cus)
VALUES ('2021/04/23 11:15','2021/05/15 09:15', 4, 5);

-- Inserciones para compañias
INSERT INTO companias(nombre_cos, telefono_cos, correo_cos, calle_cos, colonia_cos, estado_cos)
VALUES ('bimbo', '4998685445', 'bimbo@bimbo.com', 'Matamoros No. 24', 'Rejilla', 'Chiapas');
INSERT INTO companias(nombre_cos, telefono_cos, correo_cos, calle_cos, colonia_cos, estado_cos)
VALUES ('cfe', '5922736574', 'cfe@cfe.com', 'Matamoros No. 25', 'Rejilla', 'Chiapas');
INSERT INTO companias(nombre_cos, telefono_cos, correo_cos, calle_cos, colonia_cos, estado_cos)
VALUES ('stm', '3932238665', 'stm@stm.com', 'Cancilleres No. 66', 'Reforma', 'CDMX');
INSERT INTO companias(nombre_cos, telefono_cos, correo_cos, calle_cos, colonia_cos, estado_cos)
VALUES ('cu unam', '4957948666', 'cu@unam.com', 'Cancilleres No. 54', 'Reforma', 'CDMX');
INSERT INTO companias(nombre_cos, telefono_cos, correo_cos, calle_cos, colonia_cos, estado_cos)
VALUES ('pemex', '7536377949', 'pemex@pemex.com', 'simbolos patrios No. 44', 'Monte Alto', 'Michoacan');

-- Inserciones para servicios
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Diseñar paginas web', 1);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Reparar equipos dañados', 2);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Sacar copias', 3);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Apoyo a la docencia', 4);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Ir por el café', 5);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Escribir reportes', 1);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Desarrollar aplicaciones moviles', 3);
INSERT INTO servicios(nombre_ses, id_cos) VALUES('Diseñar bases de datos', 5);

-- Inserciones para grupos_servicios
INSERT INTO grupos_servicios(fecha_inicio_gre, fecha_termino_gre, concluido_gre, id_grs, id_ses)
VALUES ('2021/02/12',NULL, FALSE, 1, 5);
INSERT INTO grupos_servicios(fecha_inicio_gre, fecha_termino_gre, concluido_gre, id_grs, id_ses)
VALUES ('2021/05/22',NULL, FALSE, 2, 4);
INSERT INTO grupos_servicios(fecha_inicio_gre, fecha_termino_gre, concluido_gre, id_grs, id_ses)
VALUES ('2021/04/21',NULL, FALSE, 3, 3);
INSERT INTO grupos_servicios(fecha_inicio_gre, fecha_termino_gre, concluido_gre, id_grs, id_ses)
VALUES ('2021/05/30',NULL, FALSE, 4, 2);
INSERT INTO grupos_servicios(fecha_inicio_gre, fecha_termino_gre, concluido_gre, id_grs, id_ses)
VALUES ('2021/07/12',NULL, FALSE, 5, 1);
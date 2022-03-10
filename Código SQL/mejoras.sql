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
			(fecha_inicial_grc BETWEEN NEW.fecha_inicial_grc AND NEW.fecha_final_grc) OR
			(fecha_final_grc BETWEEN NEW.fecha_inicial_grc AND NEW.fecha_final_grc);
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
 WHERE a.concluido_gre = TRUE AND c.curp_als = 'ROCA980511HOCDRL02'
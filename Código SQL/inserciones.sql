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
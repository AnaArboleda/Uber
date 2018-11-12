/*DROP SEQUENCE secuencia_cuentas_clientes;
DROP SEQUENCE secuencia_cod_promo;
DROP SEQUENCE secuencia_det_usua_conduc;
DROP SEQUENCE secuencia_cuen_empresa;
DROP SEQUENCE secuencia_automoviles;
DROP SEQUENCE secuencia_tipos_usuarios;
DROP SEQUENCE secuencia_tarjetas_credito;
DROP SEQUENCE secuencia_servicios;
DROP SEQUENCE secuencia_usuarios;
DROP SEQUENCE secuencia_det_facturas;
DROP SEQUENCE secuencia_paypal;
DROP SEQUENCE secuencia_ubicaciones;
DROP SEQUENCE secuencia_efectivos;
DROP SEQUENCE secuencia_Paises;
DROP SEQUENCE secuencia_Ciudades;
DROP SEQUENCE secuencia_via_compart;
DROP SEQUENCE secuencia_pago_conductores;
DROP SEQUENCE secuencia_cuenta_ahorros;
DROP TABLE cuentas_clientes CASCADE CONSTRAINTS;
DROP TABLE codigos_promocionales CASCADE CONSTRAINTS;
DROP TABLE detalles_usuarios_conductores CASCADE CONSTRAINTS;
DROP TABLE cuentas_empresariales CASCADE CONSTRAINTS;
DROP TABLE automoviles CASCADE CONSTRAINTS;
DROP TABLE tipos_usuarios CASCADE CONSTRAINTS;
DROP TABLE tarjetas_credito CASCADE CONSTRAINTS;
DROP TABLE servicios CASCADE CONSTRAINTS;
DROP TABLE usuarios CASCADE CONSTRAINTS;
DROP TABLE detalles_facturas CASCADE CONSTRAINTS;
DROP TABLE paypal CASCADE CONSTRAINTS;
DROP TABLE ubicaciones CASCADE CONSTRAINTS;
DROP TABLE efectivos CASCADE CONSTRAINTS;
DROP TABLE Paises CASCADE CONSTRAINTS;
DROP TABLE Ciudades CASCADE CONSTRAINTS;
DROP TABLE viajes_compartidos CASCADE CONSTRAINTS;
DROP TABLE pago_conductores CASCADE CONSTRAINTS;
DROP TABLE cuenta_ahorros CASCADE CONSTRAINTS;*/

------------------------PUNTO NO. 6 ----------------------------------
----A). Create tables with its columns according to your normalization using the DBA user

CREATE SEQUENCE secuencia_cuentas_clientes
START WITH 9001 INCREMENT BY 2;

CREATE TABLE cuentas_clientes(
Id INT NOT NULL PRIMARY KEY ,
Id_cuenta_empresarial INT NOT NULL,
Id_usuario INT NOT NULL,
Fecha_inicio DATE ,
Fecha_fin DATE,
estado VARCHAR2(10)
);  

CREATE SEQUENCE secuencia_cod_promo
START WITH 1 INCREMENT BY 5;

CREATE TABLE codigos_promocionales(
Id INT NOT NULL PRIMARY KEY,
Codigo_promocional INT NOT NULL,
Valor NUMBER,
Id_usuario INT NOT NULL,
estado VARCHAR2(30)
);  

CREATE SEQUENCE secuencia_det_usua_conduc
START WITH 200 INCREMENT BY 1;

CREATE TABLE detalles_usuarios_conductores(
Id INT NOT NULL PRIMARY KEY,
Id_usuario INT NOT NULL,
Id_automovil INT NOT NULL,
numero_licencia NUMBER
);

CREATE SEQUENCE secuencia_cuen_empresa
START WITH 20001 INCREMENT BY 1;

CREATE TABLE cuentas_empresariales (
   Id INT NOT NULL PRIMARY KEY,
   nombre_empresa VARCHAR2(255), 
   Id_usuario INT NOT NULL,
   Id_tdc INT NOT NULL
   );
   
CREATE SEQUENCE secuencia_automoviles
START WITH 100 INCREMENT BY 1;

CREATE TABLE automoviles (
   Id INT NOT NULL PRIMARY KEY,
   placa VARCHAR2(255), 
   modelo VARCHAR2(255),
   marca VARCHAR2(255),
   anio_vehiculo NUMBER
   );

CREATE SEQUENCE secuencia_tipos_usuarios
START WITH 1 INCREMENT BY 1;

CREATE TABLE tipos_usuarios (
   Id INT NOT NULL PRIMARY KEY,
   Descripcion VARCHAR2(255)
   );
   
CREATE SEQUENCE secuencia_tarjetas_credito 
START WITH 30001 INCREMENT BY 1;

CREATE TABLE tarjetas_credito (
   Id INT NOT NULL PRIMARY KEY ,
   numero_tarjeta INT, 
   banco VARCHAR2(255),
   fecha_vencimiento DATE,
   Codigo_seguridad INT,
   Id_usuario INT,
   enviar_correo_factura VARCHAR2(10)
   );

CREATE SEQUENCE secuencia_servicios 
START WITH 2001 INCREMENT BY 2;

CREATE TABLE servicios (
   Id INT NOT NULL PRIMARY KEY ,
   fecha_viaje DATE,
   hora_inicial VARCHAR2(255),
   hora_final VARCHAR2(255),
   Id_usuario_conductor INT,
   valor_servicio NUMBER,
   comision DECIMAL GENERATED ALWAYS AS (valor_servicio*(0.34)) VIRTUAL,
   Id_ciudad INT,
   Id_medio_pago INT NOT NULL,
   tipo_medio_pago VARCHAR2(10) NOT NULL,
   estado_servicio VARCHAR2(10),
   Id_usuario INT,
   tipo_servicio VARCHAR2(50),
   Id_ubicacion INT ,
   tiempo_viaje VARCHAR2(255),
   direccion_origen VARCHAR2(255),
   direccion_destino VARCHAR2(255),
   tarifa_dinamica VARCHAR2(10),
   Id_viaje_compartido INT,
   distancia NUMBER   
   );
 
CREATE SEQUENCE secuencia_pago_conductores
START WITH 1000 INCREMENT BY 5;

CREATE TABLE pago_conductores(
   Id INT NOT NULL PRIMARY KEY ,
   Id_usuario_conductor INT NOT NULL,
   id_cuenta_ahorros INT,
   Observaciones VARCHAR2(255),
   valor_pagado NUMBER,
   fecha_inicial DATE,
   fecha_final DATE
   );
 
CREATE SEQUENCE secuencia_cuenta_ahorros
START WITH 1000 INCREMENT BY 5;

CREATE TABLE cuenta_ahorros (
   Id INT NOT NULL PRIMARY KEY,
   cuenta_conductor NUMBER,
   cuenta_activa VARCHAR2(10),
   id_usuario_conductor INT,
   enviar_comprobante_pago VARCHAR2(10)
   );
   
CREATE SEQUENCE secuencia_usuarios
START WITH 10001 INCREMENT BY 1; 

CREATE TABLE usuarios (
   Id INT NOT NULL PRIMARY KEY ,
   numero_documento VARCHAR2(255),
   nombres VARCHAR2(255),
   apellidos VARCHAR2(255),
   Id_ciudad INT NOT NULL,
   telefono INT,
   celular INT,
   idioma VARCHAR2(255),
   correo_uno VARCHAR2(255),
   correo_dos VARCHAR2(255),
   fotografia VARCHAR2(255),
   codigo_invitacion VARCHAR2(255),
   Id_tipo_usuario INT NOT NULL   
   );

CREATE SEQUENCE secuencia_det_facturas
START WITH 4010 INCREMENT BY 1; 
   
CREATE TABLE detalles_facturas (
   Id INT NOT NULL PRIMARY KEY ,
   conceptos VARCHAR2(255),
   Valor NUMBER,
   Id_servicio INT NOT NULL  
   );

CREATE SEQUENCE secuencia_paypal
START WITH 400   INCREMENT BY 1; 
  
CREATE TABLE paypal (
   Id INT NOT NULL PRIMARY KEY,
   cuenta_usuario VARCHAR2(255),
   banco VARCHAR2(255),
   cuenta_activa VARCHAR2(10),
   Id_usuario INT,
   enviar_correo_factura VARCHAR2(10)
   );

CREATE SEQUENCE secuencia_ubicaciones
START WITH 3120  INCREMENT BY 2; 

CREATE TABLE ubicaciones (
   Id INT NOT NULL PRIMARY KEY,
   Longitud VARCHAR2(255),
   Latitud VARCHAR2(255),
   Id_servicio INT
   );

CREATE SEQUENCE secuencia_efectivos
START WITH 200 INCREMENT BY 2; 

CREATE TABLE efectivos (
   Id INT NOT NULL PRIMARY KEY,
   Id_usuario INT NOT NULL,
   enviar_correo_factura VARCHAR2(10)
   );

CREATE SEQUENCE secuencia_Paises 
START WITH 1001 INCREMENT BY 1;   

CREATE TABLE Paises (
   Id INT NOT NULL PRIMARY KEY,
   codigo_pais VARCHAR2(5),
   nombre_pais VARCHAR2 (255),
   moneda VARCHAR2 (255)
   );

CREATE SEQUENCE secuencia_Ciudades
START WITH 10101 INCREMENT BY 1; 

CREATE TABLE Ciudades (
   Id INT NOT NULL PRIMARY KEY,
   ciudad VARCHAR2(255),
   Id_pais INT NOT NULL,
   tarifa_kilometro NUMBER,
   tarifa_minuto NUMBER,
   tarifa_base NUMBER
   );

CREATE SEQUENCE secuencia_via_compart
START WITH 20 INCREMENT BY 20; 

CREATE TABLE viajes_compartidos (
   Id INT NOT NULL PRIMARY KEY,
   Id_usuario INT NOT NULL,
   Id_servicio INT,
   tarifa_valor  NUMBER
   );
------------------CHECKS-------------------

--Check para el estado cuentas clientes
ALTER TABLE cuentas_clientes --Nombre de la tabla 
ADD CONSTRAINT check_estado_cuentas_clientes --Nombre cualquiera para el check 
CHECK (estado IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para el estado codigos_promocionales
ALTER TABLE codigos_promocionales --Nombre de la tabla 
ADD CONSTRAINT check_estado_codigos_promo --Nombre cualquiera para el check 
CHECK (estado IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para tarjetas_credito
ALTER TABLE tarjetas_credito --Nombre de la tabla 
ADD CONSTRAINT check_tarjeta_credito --Nombre cualquiera para el check 
CHECK (enviar_correo_factura IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para efectivo
ALTER TABLE efectivos  --Nombre de la tabla 
ADD CONSTRAINT check_efectivo --Nombre cualquiera para el check 
CHECK (enviar_correo_factura IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para servicio
ALTER TABLE servicios --Nombre de la tabla 
ADD CONSTRAINT check_estado_servicio --Nombre cualquiera para el check 
CHECK (estado_servicio IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para cuenta activa paypal
ALTER TABLE paypal --Nombre de la tabla 
ADD CONSTRAINT check_cuenta_activa --Nombre cualquiera para el check 
CHECK (cuenta_activa IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para enviar_correo_factura
ALTER TABLE paypal --Nombre de la tabla 
ADD CONSTRAINT check_enviar_correo_factura --Nombre cualquiera para el check 
CHECK (enviar_correo_factura IN ('True','False')); --Campo sobre el que aplica y restricciones 

--Check para servicio
ALTER TABLE servicios --Nombre de la tabla 
ADD CONSTRAINT check_tipo_servicio --Nombre cualquiera para el check 
CHECK (tipo_servicio IN ('UberX','Black')); --Campo sobre el que aplica y restricciones 

--Check para servicio
ALTER TABLE servicios --Nombre de la tabla 
ADD CONSTRAINT check_tipo_medio_pago --Nombre cualquiera para el check 
CHECK (tipo_medio_pago IN ('Efectivo','Paypal','Tarjeta credito')); --Campo sobre el que aplica y restricciones 

ALTER TABLE cuenta_ahorros --Nombre de la tabla 
ADD CONSTRAINT check_cuenta_activa --Nombre cualquiera para el check 
CHECK (cuenta_activa IN ('True','False')); --Campo sobre el que aplica y restricciones  

 --Check para servicio
ALTER TABLE servicios --Nombre de la tabla 
ADD CONSTRAINT check_tarifa_dinamica --Nombre cualquiera para el check 
CHECK (tarifa_dinamica IN ('True','False')); --Campo sobre el que aplica y restricciones 

----B). Create primary and foreign keys.

ALTER TABLE cuentas_clientes 
ADD FOREIGN KEY (Id_cuenta_empresarial)
REFERENCES cuentas_empresariales(Id);

ALTER TABLE cuentas_clientes 
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE codigos_promocionales
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE detalles_usuarios_conductores
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE detalles_usuarios_conductores
ADD FOREIGN KEY (Id_automovil)
REFERENCES automoviles(Id);

ALTER TABLE cuentas_empresariales
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE cuentas_empresariales
ADD FOREIGN KEY (Id_tdc)
REFERENCES tarjetas_credito(Id);

ALTER TABLE tarjetas_credito
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE servicios
ADD FOREIGN KEY (Id_usuario_conductor)
REFERENCES detalles_usuarios_conductores(Id);

ALTER TABLE servicios
ADD FOREIGN KEY (Id_ciudad)
REFERENCES Ciudades(Id);-------

ALTER TABLE servicios
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE servicios
ADD FOREIGN KEY (Id_ubicacion)
REFERENCES ubicaciones(Id);

ALTER TABLE servicios
ADD FOREIGN KEY (Id_viaje_compartido)
REFERENCES viajes_compartidos(Id);

ALTER TABLE usuarios 
ADD FOREIGN KEY (Id_ciudad)
REFERENCES Ciudades(Id);

ALTER TABLE usuarios 
ADD FOREIGN KEY (Id_tipo_usuario)
REFERENCES tipos_usuarios(Id);

ALTER TABLE paypal
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE efectivos
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE Ciudades 
ADD FOREIGN KEY (Id_pais)
REFERENCES Paises(Id);

ALTER TABLE viajes_compartidos
ADD FOREIGN KEY (Id_usuario)
REFERENCES usuarios(Id);

ALTER TABLE detalles_facturas
ADD FOREIGN KEY (Id_servicio)
REFERENCES servicios(Id);

ALTER TABLE pago_conductores
ADD FOREIGN KEY (Id_usuario_conductor)
REFERENCES detalles_usuarios_conductores(Id);

ALTER TABLE cuenta_ahorros 
ADD FOREIGN KEY (id_usuario_conductor)
REFERENCES detalles_usuarios_conductores(Id);
   
ALTER TABLE pago_conductores 
ADD FOREIGN KEY (id_cuenta_ahorros)
REFERENCES cuenta_ahorros(Id);  

----C). Insert and generate a single script
----using sql developer to export all tables with its rows):

-----------------------------Insercción de datos tabla Automoviles-------------------------------------------------------------
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('100','WBA4C9C56FD655721','Solara','Toyota','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('101','4T1BK1EB2FU233846','Camaro','Chevrolet','1994');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('102','3C4PDCBB3ET399693','E350','Ford','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('103','1GTC5MF93B8428001','GL-Class','Mercedes-Benz','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('104','3VWC17AU0FM159625','Diamante','Mitsubishi','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('105','WAUMGBFL7AA221484','S-Class','Mercedes-Benz','2006');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('106','YV440MBD7F1017189','Crossfire','Chrysler','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('107','5TDBK3EH9DS786743','3 Series','BMW','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('108','JHMZE2H39CS908022','Swift','Suzuki','1994');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('109','5TDDK3DC5BS756960','Classic','Chevrolet','2005');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('110','WAUBNBFB6AN889080','200','Audi','1990');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('111','KM8NU4CC1BU044880','Civic','Honda','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('112','1GYS4NKJ7FR155563','Blazer','Chevrolet','1996');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('113','WA1DGBFE2CD928198','TL','Acura','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('114','SCFEDCAD9AG939056','Camaro','Chevrolet','1981');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('115','WBSBR93472P301644','Sierra 1500','GMC','2006');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('116','1FMCU0D72AK538609','D150 Club','Dodge','1993');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('117','ZFF75VFA1F0161710','X6','BMW','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('118','4A31K5DF3CE128182','Lumina','Chevrolet','1995');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('119','JTJBM7FX6A5305045','LS','Lexus','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('120','WBAKE5C55CJ353540','Grand Prix','Pontiac','1985');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('121','1G6AJ5S38E0966645','STS','Cadillac','2011');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('122','3C6JD6DT4CG329193','Caravan','Dodge','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('123','5N1AR2MM1EC369664','G8','Pontiac','2008');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('124','4T1BF3EK9BU968155','Aero 8','Morgan','2008');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('125','WAUDF78E65A737985','Galant','Mitsubishi','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('126','1C4RDJEG7DC732993','Legacy','Subaru','1990');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('127','SAJWA4FC2EM766023','NSX','Acura','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('128','TRUTX28N711698600','5000CS','Audi','1988');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('129','WBAWL1C5XAP293295','Tahoe','Chevrolet','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('130','WDDHF2EB4CA327867','Dakota','Ram','2011');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('131','JN1AJ0HP4AM852061','Five Hundred','Ford','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('132','1FMJU1K51AE976244','ES','Lexus','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('133','WAUGL78E06A617509','X-90','Suzuki','1996');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('134','1G6KS54Y21U998357','S10','Chevrolet','2001');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('135','5GADS13S772671082','S2000','Honda','2005');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('136','WAUMGBFL1DA096311','Viper RT/10','Dodge','1993');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('137','1FMCU9E78AK648244','Cabriolet','Volkswagen','1987');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('138','3VW8S7AT7FM575732','Passat','Volkswagen','2001');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('139','WAUGFAFC3FN276444','HS','Lexus','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('140','3C6LD5BT5CG718883','Ranger','Ford','2004');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('141','3N1AB7AP3FY481446','S-Class','Mercedes-Benz','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('142','1HGCR2F32FA279780','Fleetwood','Cadillac','1993');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('143','1G6DL5EV6A0886145','T100 Xtra','Toyota','1995');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('144','1D7RB1CP2AS900443','Lancer Evolution','Mitsubishi','2011');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('145','1FTEW1CF5FF268460','Blazer','Chevrolet','2002');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('146','JA4AP3AU8CZ549250','GLK-Class','Mercedes-Benz','2011');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('147','1FAHP2D89EG960478','RL','Acura','1997');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('148','WBAAV33401F628738','RX-8','Mazda','2004');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('149','JN1AZ4EH8FM235783','Parisienne','Pontiac','1986');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('150','JTDBT4K31C1953698','G-Series G10','Chevrolet','1994');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('151','3GYFK66N96G227132','Grand Prix','Pontiac','1965');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('152','WAURFAFR6BA050557','Galant','Mitsubishi','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('153','JN1AZ4EH2DM878059','Integra','Acura','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('154','5TDDK3DC2ES732054','Mustang','Ford','1996');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('155','2HNYD18653H578627','7 Series','BMW','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('156','1GT01XEG7FZ773919','Capri','Mercury','1984');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('157','WAUHGAFC9EN559530','Explorer','Ford','1996');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('158','SALWG2VF6FA371951','Allroad','Audi','2004');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('159','3D7LP2ET9BG665569','M','BMW','2000');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('160','WBA3B9C56FP029387','Impala','Chevrolet','1995');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('161','YV4952CF9E1229716','09-may','Saab','2001');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('162','WAUBNAFB6BN121403','Spectra','Kia','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('163','1G6KS54Y24U687032','RX-8','Mazda','2008');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('164','KNAFX5A80F5394437','Escalade EXT','Cadillac','2004');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('165','3C6TD5DT6CG873973','S8','Audi','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('166','WBABD33404P975394','98','Oldsmobile','1993');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('167','1G4HB5EM8AU820743','RX','Lexus','1999');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('168','WBAVS13568F766978','XR4Ti','Merkur','1985');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('169','KMHFH4JG5FA569298','Terraza','Buick','2006');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('170','1G6DE8EY0B0259755','Lumina','Chevrolet','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('171','1G4HJ5EM2AU140226','Defender','Land Rover','1997');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('172','WBANE73506C869502','Focus','Ford','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('173','WAUPFBFM9BA184934','Econoline E350','Ford','1992');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('174','1G4GL5E37CF539136','Yaris','Toyota','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('175','3VWKX7AJ5DM719457','Grand Prix','Pontiac','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('176','1FAHP3GN1AW451363','Wrangler','Jeep','1995');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('177','KMHEC4A45EA351005','Celica','Toyota','1978');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('178','19UUA9F28EA413329','Windstar','Ford','1997');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('179','WBAYA8C57FD701865','Club Wagon','Ford','1994');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('180','1FTEW1CM7CF309407','Discovery','Land Rover','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('181','WBA3B3C58FJ344630','XF','Jaguar','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('182','2T1BPRHE3EC259538','TL','Acura','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('183','3VW8S7ATXFM760292','Protege','Mazda','1999');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('184','1G6DM5E38C0915725','Grand Marquis','Mercury','1989');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('185','WAUMFAFL6AA291989','E-Class','Mercedes-Benz','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('186','19UUA9E5XCA881877','Paseo','Toyota','1994');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('187','1C4RDHAG7FC495536','PT Cruiser','Chrysler','2001');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('188','5NPDH4AE6DH223874','Astro','Chevrolet','2004');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('189','4T1BD1EB6FU089499','Firebird','Pontiac','1987');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('190','WP0AA2A87CS026475','Mountaineer','Mercury','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('191','JN8AF5MR3FT820657','Xterra','Nissan','2002');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('192','JN8AZ2NC1E9043570','3500 Club Coupe','GMC','1997');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('193','WAUBF78E48A094094','Venza','Toyota','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('194','WBABV13475J277273','CR-X','Honda','1988');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('195','JN8AS5MT6BW370728','Lanos','Daewoo','2000');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('196','3C3CFFDR9CT288474','VUE','Saturn','2008');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('197','5N1AT2MK0FC814378','Tiburon','Hyundai','2003');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('198','WAUKH98E78A444761','Regency','Oldsmobile','1998');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('199','WBANV135X9B845392','Versa','Nissan','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('200','WAUHF78PX8A361217','Corolla','Toyota','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('201','WAUJGAFDXFN028140','Rodeo Sport','Isuzu','2001');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('202','1FTWF3C51AE343886','Dakota Club','Dodge','2004');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('203','WAUJT64B22N349139','Prius','Toyota','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('204','2HNYD2H46CH345196','Metro','Geo','1992');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('205','3D7TT2HT8BG159285','Sienna','Toyota','2000');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('206','KNAFT4A22C5445403','CC','Volkswagen','2009');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('207','WBADN53412G505325','Truck','Mitsubishi','1992');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('208','KMHEC4A45FA538360','New Beetle','Volkswagen','2005');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('209','WBA6B4C54ED642589','Escalade','Cadillac','2012');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('210','WAUEFAFL8DN904440','C30','Volvo','2011');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('211','JN1AV7AP0FM126115','Alero','Oldsmobile','2001');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('212','WAULC68EX2A123872','Forte','Kia','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('213','JH4KB16697C155304','Challenger','Dodge','2010');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('214','1HGCP2E31CA570564','Miata MX-5','Mazda','2007');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('215','JTHBL1EF8B5764122','CLS-Class','Mercedes-Benz','2006');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('216','3FA6P0LU5DR792193','Mazda6','Mazda','2005');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('217','WA1LGAFE3CD022390','98','Oldsmobile','1996');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('218','WBAKP9C55ED680359','Corolla','Toyota','2005');
Insert into AUTOMOVILES (ID,PLACA,MODELO,MARCA,ANIO_VEHICULO) values ('219','1YVHZ8BH0A5304566','S5','Audi','2012');

--SELECT * FROM AUTOMOVILES

-----------------------------Insercción de datos tabla Paises-------------------------------------------------------------
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1001','ID','Indonesia','$2.63');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1002','AR','Argentina','$6.68');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1003','AR','Argentina','$1.48');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1004','TH','Thailand','$6.42');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1005','HN','Honduras','$8.31');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1006','PH','Philippines','$7.85');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1007','CN','China','$1.38');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1008','AF','Afghanistan','$0.47');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1009','PL','Poland','$2.19');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1010','CN','China','$0.43');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1011','PE','Peru','$8.90');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1012','ID','Indonesia','$7.67');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1013','PH','Philippines','$6.11');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1014','CN','China','$0.94');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1015','AR','Argentina','$4.61');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1016','JP','Japan','$7.48');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1017','BR','Brazil','$4.54');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1018','PH','Philippines','$8.42');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1019','BR','Brazil','$0.80');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1020','ID','Indonesia','$7.75');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1021','PT','Portugal','$1.83');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1022','VN','Vietnam','$3.30');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1023','IE','Ireland','$9.22');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1024','ID','Indonesia','$8.98');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1025','CN','China','$8.00');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1026','RU','Russia','$3.25');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1027','BR','Brazil','$5.54');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1028','IT','Italy','$3.58');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1029','FR','France','$9.04');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1030','ID','Indonesia','$9.24');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1031','US','United States','$1.72');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1032','ID','Indonesia','$7.52');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1033','BR','Brazil','$3.70');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1034','CN','China','$3.20');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1035','PT','Portugal','$4.50');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1036','PH','Philippines','$8.46');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1037','ID','Indonesia','$2.37');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1038','US','United States','$8.98');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1039','PT','Portugal','$9.34');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1040','ID','Indonesia','$1.20');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1041','HR','Croatia','$0.69');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1042','JM','Jamaica','$9.72');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1043','MN','Mongolia','$3.80');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1044','BR','Brazil','$1.94');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1045','ID','Indonesia','$8.17');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1046','JO','Jordan','$9.43');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1047','CN','China','$7.24');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1048','CN','China','$5.97');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1049','PT','Portugal','$4.69');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1050','CZ','Czech Republic','$9.52');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1051','MX','Mexico','$4.29');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1052','NG','Nigeria','$5.63');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1053','GT','Guatemala','$8.68');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1054','ID','Indonesia','$6.58');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1055','PH','Philippines','$0.10');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1056','CM','Cameroon','$5.59');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1057','US','United States','$7.71');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1058','RU','Russia','$3.04');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1059','RU','Russia','$1.17');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1060','BH','Bahrain','$8.87');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1061','PL','Poland','$9.66');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1062','RU','Russia','$7.91');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1063','SE','Sweden','$8.75');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1064','CN','China','$6.30');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1065','AF','Afghanistan','$7.91');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1066','ID','Indonesia','$2.08');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1067','VN','Vietnam','$1.43');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1068','ZA','South Africa','$7.23');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1069','NE','Niger','$8.64');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1070','PE','Peru','$4.02');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1071','MN','Mongolia','$8.72');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1072','BA','Bosnia and Herzegovina','$7.63');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1073','RS','Serbia','$9.91');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1074','CN','China','$6.13');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1075','UZ','Uzbekistan','$3.48');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1076','TH','Thailand','$8.15');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1077','MT','Malta','$5.69');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1078','LK','Sri Lanka','$6.77');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1079','RU','Russia','$9.67');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1080','CN','China','$7.44');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1081','PH','Philippines','$1.90');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1082','PH','Philippines','$6.66');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1083','CN','China','$5.36');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1084','CZ','Czech Republic','$8.44');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1085','RU','Russia','$5.16');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1086','PH','Philippines','$3.96');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1087','CN','China','$6.56');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1088','ID','Indonesia','$1.79');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1089','LY','Libya','$4.12');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1090','TT','Trinidad and Tobago','$9.79');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1091','SI','Slovenia','$8.19');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1092','RU','Russia','$3.57');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1093','BY','Belarus','$5.98');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1094','RU','Russia','$1.26');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1095','IE','Ireland','$7.17');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1096','PL','Poland','$8.27');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1097','EC','Ecuador','$7.56');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1098','FR','France','$3.55');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1099','CN','China','$4.33');
Insert into PAISES (ID,CODIGO_PAIS,NOMBRE_PAIS,MONEDA) values ('1100','HN','Honduras','$2.57');

--SELECT * FROM PAISES

-----------------------------Insercción de datos tabla Ciudades------------------------------------------------------------
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10101','Medellìn','1001','764525994','178571429','2500');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10202','Bogotà','1002','522434560','173127300','2400');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10303','Arcos','1003','280343126','167683171','2300');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10404','Piraí do Sul','1004','38251692','162239042','2200');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10505','El Real','1005','203839742','156794913','2100');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10606','Orito','1006','445931176','151350784','2000');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10707','El Tambo','1007','688022610','145906655','1900');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10808','Qa?anah','1008','930114044','140462526','1800');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('10909','Hawassa','1009','626115482','135018397','1700');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11010','Segong','1010','657656063','129574268','1600');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11111','Eg-Uur','1011','689196644','124130139','1500');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11212','Cabanas de Viriato','1012','720737225','118686010','3800');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11313','El Fahs','1013','752277806','113241881','4000');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11414','Badaogu','1014','783818387','107797752','2900');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11515','San Francisco','1015','815358968','102353623','2600');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11616','Orahovica Donja','1016','846899548','96909494','7000');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11717','Bayanhoshuu','1017','878440129','91465365','4430,76923076923');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11818','Lairoka','1018','909980710','86021236','4678,02197802198');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('11919','Kawangu Satu','1019','941521291','80577107','4925,27472527473');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12020','Ararat','1020','973061872,761905','75132978','5172,52747252748');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12121','Kampong Chhnang','1021','522434560','69688849','5419,78021978022');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12222','Tchamba','1022','280343126','64244720','5667,03296703297');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12323','Júlio de Castilhos','1023','38251692','58800591','5914,28571428572');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12424','?afas','1024','744737225','53356462','6161,53846153847');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12525','Perniö','1025','711277806','47912333','6408,79120879121');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12626','Liuqu','1026','677818387','42468204','6656,04395604396');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12727','Aqtoghay','1027','644358968','37024075','6903,29670329671');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12828','Suqin Huimin','1028','610899548','31579946','7150,54945054945');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('12929','Baopukang','1029','577440129','26135817','7397,8021978022');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13030','Wilmington','1030','543980710','20691688','7645,05494505495');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13131','Takub','1031','510521291','15247559','7892,3076923077');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13232','Popielów','1032','477061872','58660591','8139,56043956044');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13333','Banjing','1033','443602453','31021075','8386,81318681319');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13434','Chai Badan','1034','410143034','135018397','8634,06593406594');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13535','Caleta Olivia','1035','376683615','135018397','8881,31868131868');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13636','Meybod','1036','343224196','11973086','9128,57142857143');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13737','Shuanghe','1037','309764777','17417215','9375,82417582418');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13838','Lourdes','1038','276305358','22861344','9623,07692307693');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('13939','Dingshan','1039','242845939','28305473','9870,32967032967');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14040','Ngulahan','1040','209386520','33749602','10117,5824175824');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14141','Rääkkylä','1041','175927101','39193731','10364,8351648352');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14242','Lisewo','1042','142467682','44637860','10612,0879120879');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14343','Cabinda','1043','109008263','50081989','10859,3406593407');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14444','Cáceres','1044','930114044','55526118','11106,5934065934');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14545','Phong ?i?n','1045','626115482','60970247','11353,8461538461');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14646','That Phanom','1046','322116920','66414376','11601,0989010989');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14747','Angol','1047','18118358','71858505','11848,3516483516');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14848','Pirg','1048','285880202,85714','77302634','12095,6043956044');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('14949','Caçador','1049','589878764','82746763','12342,8571428571');
Insert into CIUDADES (ID,CIUDAD,ID_PAIS,TARIFA_KILOMETRO,TARIFA_MINUTO,TARIFA_BASE) values ('15050','Samphanthawong','1050','893877326','88190892','12590,1098901099');

-----------------------------Insercción de datos tabla Tipo_usuarios------------------------------------------------------------
--select * from TIPO_USUARIOS;

Insert into TIPOS_USUARIOS (ID,DESCRIPCION) values ('1','Usuario');
Insert into TIPOS_USUARIOS (ID,DESCRIPCION) values ('2','Conductor');
Insert into TIPOS_USUARIOS (ID,DESCRIPCION) values ('3','Empresarial');

-----------------------------Insercción de datos tabla Usuarios------------------------------------------------------------
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10001','1020456337','Heywood','Grayer','10101','9730504','3332880819','Persian','hgrayer0@fotki.com','hgrayer0@google.com.br','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8','S61313A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10002','1128464234','Eveleen','Longden','10202','5779383','8317080195','Macedonian','elongden1@cisco.com','elongden1@twitpic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf9','F13930','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10003','1236472131','Briant','Caze','10303','6633545','4993208032','Italian','bcaze2@abc.net.au','bcaze2@wix.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf10','N6009','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10004','1344480028','Caroline','Piatkow','10404','7157438','4884325626','Filipino','cpiatkow3@cornell.edu','cpiatkow3@webmd.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf11','T48903D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10005','1452487925','Lorelle','Gilman','10505','4365710','6624300244','Papiamento','lgilman4@gizmodo.com','lgilman4@cbc.ca','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf12','S72102B','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10006','1560495822','Creigh','Chichgar','10606','3518329','7332727517','Japanese','cchichgar5@statcounter.com','cchichgar5@yolasite.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf13','E093543','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10007','1668503719','Damara','Palmby','10707','2252727','4513634918','Moldovan','dpalmby6@globo.com','dpalmby6@jalbum.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf14','S91136D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10008','1776511616','Jewelle','Toupe','10808','5210830','6525026654','Kazakh','jtoupe7@apple.com','jtoupe7@nhs.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf15','S82024P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10009','1884519513','Hayley','Braisby','10909','9715133','6619149295','Lithuanian','hbraisby8@51.la','hbraisby8@freewebs.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf16','V449XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10010','1992527410','Javier','Godsmark','11010','4903523','7862803186','Pashto','jgodsmark9@ca.gov','jgodsmark9@tiny.cc','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf17','S91134S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10011','2100535307','Lilla','Puve','11111','1965794','9307497352','Ndebele','lpuvea@hc360.com','lpuvea@vkontakte.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf18','C8130','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10012','2208543204','Delora','Biermatowicz','11212','5361128','7942961920','Albanian','dbiermatowiczb@noaa.gov','dbiermatowiczb@bravesites.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf19','S92302G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10013','2316551101','Lionel','Shallcross','11313','6684076','1642664351','Polish','lshallcrossc@wikimedia.org','lshallcrossc@twitpic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf20','H401292','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10014','2424558998','Pearce','Stancer','11414','5334309','7686611255','New Zealand Sign Language','pstancerd@theglobeandmail.com','pstancerd@amazonaws.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf21','G55','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10015','2532566895','Jackqueline','Fullstone','11515','7437341','2481909398','Hungarian','jfullstonee@smh.com.au','jfullstonee@etsy.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf22','S61324S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10016','2640574792','Mandy','Mickelwright','11616','2447442','9844141665','Kyrgyz','mmickelwrightf@freewebs.com','mmickelwrightf@cam.ac.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf23','V0599XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10017','2748582689','Eydie','Flann','11717','3619594','3371786751','Finnish','eflanng@microsoft.com','eflanng@macromedia.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf24','S82863A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10018','2856590586','Tracey','Lente','11818','7705434','1971443616','Pashto','tlenteh@unesco.org','tlenteh@macromedia.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf25','Y35033D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10019','2964598483','Dorolice','Ryle','11919','8756425','5703422969','Dzongkha','drylei@51.la','drylei@auda.org.au','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf26','S31512A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10020','3072606380','Victoria','Priscott','12020','6105020','2673884787','Gujarati','vpriscottj@opensource.org','vpriscottj@123-reg.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf27','X118','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10021','1114353019','Angus','Killiam','12121','8439379','7926783512','Icelandic','akilliamk@uiuc.edu','akilliamk@addtoany.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf28','S32031','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10022','1006345122','Jackelyn','Jahnel','12222','9482518','4675585679','Malayalam','jjahnell@opera.com','jjahnell@buzzfeed.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf29','V604XXS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10023','898337225','Mellisent','Dumberell','12323','2152652','7836582554','Tamil','mdumberellm@google.cn','mdumberellm@shinystat.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf30','H348122','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10024','790329328','Halimeda','Evangelinos','12424','2153792','1715924349','Kazakh','hevangelinosn@g.co','hevangelinosn@google.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf31','H1713','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10025','682321431','Xavier','Figgins','12525','6166589','1328732205','Dhivehi','xfigginso@dyndns.org','xfigginso@rediff.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf32','S82424A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10026','574313534','Kerk','Soames','12626','3081917','3052960286','Malayalam','ksoamesp@photobucket.com','ksoamesp@ca.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf33','S1017XS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10027','466305637','Dilly','Neate','12727','2323450','7415067979','Kashmiri','dneateq@last.fm','dneateq@senate.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf34','Y281XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10028','358297740','Dyan','Sams','12828','8604365','4128016407','Marathi','dsamsr@wufoo.com','dsamsr@soup.io','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf35','V745XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10029','250289843','Aile','Johncey','12929','4243986','9275301872','Danish','ajohnceys@nhs.uk','ajohnceys@infoseek.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf36','S72101D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10030','142281946','Yvette','Darque','13030','5541196','3925934270','Nepali','ydarquet@netvibes.com','ydarquet@gmpg.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf37','S52382M','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10031','34274049','Aloise','Bayle','13131','3025257','6693357263','Afrikaans','abayleu@hubpages.com','abayleu@biglobe.ne.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf38','I8259','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10032','73733848','Abe','Routh','13232','6720203','6611829691','Italian','arouthv@meetup.com','arouthv@independent.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf39','S40271D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10033','181741745','Tildie','Leinster','13333','8096360','9929976174','Fijian','tleinsterw@sbwire.com','tleinsterw@addtoany.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf40','S52569P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10034','289749642','Chucho','Farland','13434','6027064','8413539904','Polish','cfarlandx@patch.com','cfarlandx@dell.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf41','A630','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10035','397757539','Frank','Ishak','13535','1159645','5091719567','Tajik','fishaky@purevolume.com','fishaky@yellowpages.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf42','M00021','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10036','505765436','Llewellyn','Rofe','13636','5020791','1472219775','Bulgarian','lrofez@live.com','lrofez@twitpic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf43','Y0809XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10037','613773333','Pammie','Ivanyutin','13737','4756172','5359267937','Bosnian','pivanyutin10@timesonline.co.uk','pivanyutin10@elegantthemes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf44','M89532','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10038','721781230','Rivy','Wones','13838','6758527','8536286845','Moldovan','rwones11@wordpress.org','rwones11@sogou.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf45','T410X5S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10039','829789127','Amii','Gilleson','13939','3774340','8241765909','Punjabi','agilleson12@auda.org.au','agilleson12@opera.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf46','L02222','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10040','937797024','Fredric','Cairns','14040','5446625','4526310682','Kashmiri','fcairns13@berkeley.edu','fcairns13@senate.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf47','T45516S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10041','1045804921','Vachel','Prator','14141','7125586','4012321851','Dhivehi','vprator14@forbes.com','vprator14@facebook.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf48','S72336Q','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10042','1153812818','Philippa','Rigts','14242','2837076','6155539982','Hiri Motu','prigts15@edublogs.org','prigts15@blogger.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf49','P588','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10043','1261820715','Editha','Wallage','14343','5060194','1376750688','Kyrgyz','ewallage16@nbcnews.com','ewallage16@bbb.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf50','S36229S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10044','1369828612','Sylas','Imason','14444','5568126','6804603201','Yiddish','simason17@cocolog-nifty.com','simason17@netvibes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf51','K26','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10045','1477836509','Armstrong','Gittings','14545','9769510','3633322231','Kyrgyz','agittings18@amazon.co.jp','agittings18@uiuc.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf52','S72043A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10046','1585844406','Gaby','Shimmings','14646','3570133','4881473299','Kyrgyz','gshimmings19@example.com','gshimmings19@wikimedia.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf53','S52326C','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10047','1693852303','Fayre','Shoobridge','14747','8451905','9122897859','Tetum','fshoobridge1a@mit.edu','fshoobridge1a@symantec.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf54','H5061','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10048','1801860200','Avictor','Meade','14848','7428965','3711879437','Malay','ameade1b@comcast.net','ameade1b@ucla.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf55','S52034D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10049','1909868097','Casandra','Matthewes','14949','1967501','9807090566','New Zealand Sign Language','cmatthewes1c@free.fr','cmatthewes1c@netlog.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf56','S82155Q','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10050','2017875994','Glori','Curtin','15050','2515028','6462178836','Portuguese','gcurtin1d@nature.com','gcurtin1d@mtv.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf57','S63061S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10051','2125883891','Klara','Domek','10101','4077438','7751846072','Bulgarian','kdomek1e@nsw.gov.au','kdomek1e@unesco.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf58','T63612','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10052','2233891788','Gerladina','Armiger','10202','9076141','2346590463','Guaraní','garmiger1f@merriam-webster.com','garmiger1f@bizjournals.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf59','A36','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10053','2341899685','Dyann','Roose','10303','4928104','4899959075','Hungarian','droose1g@princeton.edu','droose1g@infoseek.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf60','S22001K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10054','2449907582','Derby','Shrimplin','10404','2868113','9248423149','Amharic','dshrimplin1h@xing.com','dshrimplin1h@newsvine.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf61','S86829A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10055','2557915479','Daisi','Truman','10505','9486920','1573176201','Latvian','dtruman1i@yellowpages.com','dtruman1i@usa.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf62','S82122F','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10056','2665923376','Sammy','Waeland','10606','5772329','5492782446','Swahili','swaeland1j@ow.ly','swaeland1j@skyrock.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf63','S81001S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10057','2773931273','Dawna','Glacken','10707','9976690','1124763583','Aymara','dglacken1k@google.de','dglacken1k@accuweather.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf64','S63243D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10058','2881939170','Tallou','Longstreeth','10808','4898809','7014809414','Japanese','tlongstreeth1l@ucoz.com','tlongstreeth1l@bravesites.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf65','Z9989','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10059','2989947067','Sheri','Garthshore','10909','2766274','5136613742','Macedonian','sgarthshore1m@bluehost.com','sgarthshore1m@nsw.gov.au','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf66','S61131A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10060','3097954964','Bartolomeo','Hitschke','11010','6387517','1418934622','Greek','bhitschke1n@ask.com','bhitschke1n@arizona.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf67','D732','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10061','1089004435','Jermaine','Stanex','11111','3875228','1495773867','Kurdish','jstanex1o@cdbaby.com','jstanex1o@google.ca','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf68','M00852','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10062','980996538','Nadiya','Castaignet','11212','2987853','1877710028','Lao','ncastaignet1p@homestead.com','ncastaignet1p@webs.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf69','T81719A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10063','872988641','Madelle','Stileman','11313','3698087','8346312568','Telugu','mstileman1q@vinaora.com','mstileman1q@miitbeian.gov.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf70','V562XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10064','764980744','Irma','Erwin','11414','8291152','6661551830','Malay','ierwin1r@twitter.com','ierwin1r@rambler.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf71','S66402','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10065','656972847','Chaddy','Breazeall','11515','5038251','9641487585','Amharic','cbreazeall1s@linkedin.com','cbreazeall1s@nba.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf72','S25502D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10066','548964950','Catherine','Berndsen','11616','5420162','4247302117','Sotho','cberndsen1t@sciencedaily.com','cberndsen1t@admin.ch','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf73','S56107A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10067','440957053','Ariela','Townsley','11717','6696114','1956235404','English','atownsley1u@google.com.hk','atownsley1u@youtube.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf74','T34812S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10068','332949156','Drusilla','Duiguid','11818','8073474','8276578516','Swati','dduiguid1v@dropbox.com','dduiguid1v@t.co','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf75','M1A0620','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10069','224941259','Inglis','Abramovitz','11919','4867318','4143063875','Hungarian','iabramovitz1w@tamu.edu','iabramovitz1w@thetimes.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf76','A011','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10070','116933362','Trenna','MacGarrity','12020','1763196','7215927560','Dari','tmacgarrity1x@independent.co.uk','tmacgarrity1x@hhs.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf77','S56496A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10071','8925465','Poul','Toor','12121','6863281','5316082011','Dhivehi','ptoor1y@spotify.com','ptoor1y@chronoengine.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf78','Q897','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10072','99082432','Loren','Nind','12222','1947268','4097119604','Yiddish','lnind1z@desdev.cn','lnind1z@harvard.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf79','M65072','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10073','207090329','Gill','Maxweell','12323','2403999','3232048848','Ndebele','gmaxweell20@g.co','gmaxweell20@freewebs.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf80','A96','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10074','315098226','Eugene','Kuhnke','12424','8485022','8335103125','Fijian','ekuhnke21@independent.co.uk','ekuhnke21@narod.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf81','T461X6D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10075','423106123','Nyssa','Wind','12525','4174715','5585511462','Kyrgyz','nwind22@diigo.com','nwind22@tamu.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf82','T391X6S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10076','531114020','Tish','Kitcherside','12626','3551677','1655550241','German','tkitcherside23@dropbox.com','tkitcherside23@theglobeandmail.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf83','Y386X2A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10077','639121917','Teena','Strippling','12727','4653730','6618048576','Icelandic','tstrippling24@freewebs.com','tstrippling24@themeforest.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf84','S91049D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10078','747129814','Dreddy','Tuerena','12828','8886381','5489649332','Dzongkha','dtuerena25@miibeian.gov.cn','dtuerena25@seattletimes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf85','M764','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10079','855137711','Harbert','Burgne','12929','8017493','5408245998','Sotho','hburgne26@sphinn.com','hburgne26@php.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf86','J320','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10080','963145608','Dallas','Heffernan','13030','8773471','1161643904','Romanian','dheffernan27@irs.gov','dheffernan27@nba.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf87','M66262','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10081','1071153505','Alic','Tutton','13131','5123982','4567120317','Fijian','atutton28@globo.com','atutton28@bloglines.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf88','T628X3A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10082','1179161402','Mellisent','McTrustey','13232','3968166','1949762391','Malagasy','mmctrustey29@uiuc.edu','mmctrustey29@unesco.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf89','S32431K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10083','1287169299','Sam','Lawford','13333','9142393','3559290454','West Frisian','slawford2a@artisteer.com','slawford2a@google.pl','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf90','M1222','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10084','1395177196','Aguie','Hardiker','13434','6527684','1399042202','Khmer','ahardiker2b@nasa.gov','ahardiker2b@facebook.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf91','T2662','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10085','1503185093','Alfonso','Harnes','13535','1156123','3792213700','Hindi','aharnes2c@bloglovin.com','aharnes2c@wordpress.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf92','Y232XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10086','1611192990','Alie','Arnet','13636','6798419','3106409038','Dhivehi','aarnet2d@creativecommons.org','aarnet2d@scribd.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf93','Q780','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10087','1719200887','Cole','Ordemann','13737','2912474','4762695443','Hebrew','cordemann2e@vistaprint.com','cordemann2e@engadget.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf94','V199XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10088','1827208784','Christine','Pyett','13838','7300093','2544534379','Italian','cpyett2f@ameblo.jp','cpyett2f@blinklist.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf95','T81511A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10089','1935216681','Barbara','Garnsey','13939','7388506','6907423571','Italian','bgarnsey2g@discuz.net','bgarnsey2g@mayoclinic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf96','S92514K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10090','2043224578','Roobbie','Jzhakov','14040','3513203','6876891394','Swati','rjzhakov2h@mediafire.com','rjzhakov2h@spiegel.de','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf97','S62654A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10091','2151232475','Tania','Bee','14141','3194189','4004835283','Oriya','tbee2i@multiply.com','tbee2i@salon.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf98','V185XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10092','2259240372','Juliette','Gosker','14242','9794077','2012771465','Greek','jgosker2j@exblog.jp','jgosker2j@acquirethisname.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf99','M84432A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10093','2367248269','Nathaniel','Corthes','14343','2558052','4088955454','Burmese','ncorthes2k@topsy.com','ncorthes2k@bloglovin.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf100','O439','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10094','2475256166','Alic','Middleton','14444','3376936','9066612032','Marathi','amiddleton2l@hhs.gov','amiddleton2l@harvard.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf101','S72331C','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10095','2583264063','Luce','Dod','14545','8819002','8597694439','Portuguese','ldod2m@kickstarter.com','ldod2m@usatoday.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf102','T63413A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10096','2691271960','Sula','Ambrogetti','14646','8490418','2646975576','Indonesian','sambrogetti2n@nasa.gov','sambrogetti2n@fastcompany.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf103','S00462','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10097','2799279857','Ainsley','Ferraraccio','14747','9577120','3662480607','Greek','aferraraccio2o@forbes.com','aferraraccio2o@yellowpages.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf104','T22422','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10098','2907287754','Angele','Vescovo','14848','8965205','1729034823','Catalan','avescovo2p@hatena.ne.jp','avescovo2p@ocn.ne.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf105','V8021XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10099','3015295651','Cyndia','Epelett','14949','4243217','6212905259','Greek','cepelett2q@paypal.com','cepelett2q@smugmug.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf106','H3412','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10100','3123303548','Brockie','Darby','15050','7102930','3751790037','Bulgarian','bdarby2r@sphinn.com','bdarby2r@tamu.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf107','E0837X3','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10101','1063655851','Noah','Messier','10101','3338031','3055789762','Kurdish','nmessier2s@state.gov','nmessier2s@washingtonpost.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf108','T222','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10102','955647954','Claudell','Rudolf','10202','5716727','7291763089','Croatian','crudolf2t@geocities.jp','crudolf2t@usgs.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf109','S62255G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10103','847640057','Dorthea','Giovannilli','10303','2758343','9667862145','Latvian','dgiovannilli2u@1und1.de','dgiovannilli2u@fema.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf110','Z738','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10104','739632160','Eberto','Barnham','10404','6368356','3289156154','Swati','ebarnham2v@purevolume.com','ebarnham2v@senate.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf111','S42116D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10105','631624263','Moreen','Skippings','10505','7249545','4469543998','Azeri','mskippings2w@globo.com','mskippings2w@huffingtonpost.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf112','I69134','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10106','523616366','Quentin','Dulany','10606','3290084','1755181857','Tetum','qdulany2x@umn.edu','qdulany2x@sfgate.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf113','S52264F','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10107','415608469','Jarred','Bonney','10707','6828098','7542959460','Tajik','jbonney2y@biblegateway.com','jbonney2y@addthis.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf114','H3323','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10108','307600572','Ferdie','Dubbin','10808','6175030','2861735524','Assamese','fdubbin2z@oracle.com','fdubbin2z@posterous.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf115','H5361','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10109','199592675','Clarinda','MacGilrewy','10909','5128628','7604661539','Bislama','cmacgilrewy30@facebook.com','cmacgilrewy30@amazon.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf116','S62306S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10110','91584778','Malinde','Vasilevich','11010','6637687','6235039091','New Zealand Sign Language','mvasilevich31@xrea.com','mvasilevich31@dmoz.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf117','S68627A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10111','16423119','Vivyanne','Lauderdale','11111','9852881','6788293589','Aymara','vlauderdale32@ezinearticles.com','vlauderdale32@japanpost.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf118','S42331G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10112','124431016','Laurie','Daye','11212','8938914','6236864186','Hungarian','ldaye33@twitpic.com','ldaye33@foxnews.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf119','M4858','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10113','232438913','Tess','Ondrusek','11313','2715707','1251466352','Yiddish','tondrusek34@xinhuanet.com','tondrusek34@tinypic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf120','Y37090S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10114','340446810','Florette','Evangelinos','11414','1922709','5441768666','Czech','fevangelinos35@imdb.com','fevangelinos35@yolasite.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf121','S96922S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10115','448454707','Matthew','Jochanany','11515','9663918','1213772001','Swahili','mjochanany36@nydailynews.com','mjochanany36@1688.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf122','F1123','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10116','556462604','Kylie','Rawlingson','11616','8805997','7763747443','Dhivehi','krawlingson37@angelfire.com','krawlingson37@dailymail.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf123','S95292S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10117','664470501','Augie','Hallyburton','11717','7874456','1277643669','Mongolian','ahallyburton38@yellowpages.com','ahallyburton38@epa.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf124','S50819','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10118','772478398','Moyna','Jauncey','11818','4831149','2897399575','Persian','mjauncey39@nyu.edu','mjauncey39@pagesperso-orange.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf125','W171XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10119','880486295','Regan','Betteriss','11919','9590920','9787928018','Malay','rbetteriss3a@samsung.com','rbetteriss3a@zimbio.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf126','T421X','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10120','988494192','Alessandra','Heinzel','12020','3692458','5714669199','Tetum','aheinzel3b@booking.com','aheinzel3b@mysql.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf127','M08949','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10121','1096502089','Robina','Bickerstaff','12121','8717092','5478189080','Tajik','rbickerstaff3c@bravesites.com','rbickerstaff3c@oracle.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf128','S89111P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10122','1204509986','Julianne','Chattey','12222','5024524','4103040272','Italian','jchattey3d@yahoo.com','jchattey3d@elpais.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf129','M1251','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10123','1312517883','Maynord','Connor','12323','2106258','8295544780','Korean','mconnor3e@state.tx.us','mconnor3e@nps.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf130','S82209C','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10124','1420525780','Nikoletta','Million','12424','2777643','7963304708','Maltese','nmillion3f@zimbio.com','nmillion3f@smugmug.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf131','M60051','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10125','1528533677','Nita','Vasilyev','12525','9311331','9424011547','Ndebele','nvasilyev3g@webs.com','nvasilyev3g@vistaprint.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf132','N35013','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10126','1636541574','Ulric','Wolledge','12626','1066095','8316160897','Hebrew','uwolledge3h@statcounter.com','uwolledge3h@tamu.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf133','S36528A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10127','1744549471','Margarete','Fitzpayn','12727','3059237','3677270859','Tamil','mfitzpayn3i@about.com','mfitzpayn3i@a8.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf134','S3992XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10128','1852557368','Sibel','Bea','12828','5219705','5323914019','Yiddish','sbea3j@cafepress.com','sbea3j@ehow.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf135','S59011P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10129','1960565265','Fransisco','Essex','12929','9245470','2147816377','Papiamento','fessex3k@alibaba.com','fessex3k@merriam-webster.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf136','O3673X9','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10130','2068573162','Chelsea','Eburne','13030','1993555','4302737198','Punjabi','ceburne3l@wikipedia.org','ceburne3l@tripod.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf137','S66302A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10131','2176581059','Moll','Schnieder','13131','3435224','1173051702','Malay','mschnieder3m@tripod.com','mschnieder3m@slashdot.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf138','S21451D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10132','2284588956','Eugenius','Hayley','13232','1369338','7357382273','Belarusian','ehayley3n@columbia.edu','ehayley3n@mashable.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf139','V152XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10133','2392596853','Lynda','Langcaster','13333','5900228','5596721969','Azeri','llangcaster3o@furl.net','llangcaster3o@booking.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf140','T360X4D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10134','2500604750','Paul','Feathers','13434','1568745','5404740655','Zulu','pfeathers3p@icq.com','pfeathers3p@yahoo.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf141','S92241G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10135','2608612647','Mikkel','Trevarthen','13535','2680463','1518024198','Haitian Creole','mtrevarthen3q@tripod.com','mtrevarthen3q@ameblo.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf142','S7221XQ','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10136','2716620544','Sarah','Rosenwasser','13636','8953670','3937885600','Quechua','srosenwasser3r@webnode.com','srosenwasser3r@google.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf143','M6702','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10137','2824628441','Stu','Dreinan','13737','5158431','3819445174','Zulu','sdreinan3s@topsy.com','sdreinan3s@hatena.ne.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf144','Y35021A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10138','2932636338','Raven','Oxberry','13838','5123738','5723263937','Arabic','roxberry3t@wikispaces.com','roxberry3t@engadget.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf145','S70329','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10139','3040644235','Antony','Beech','13939','2433444','1372705034','Italian','abeech3u@friendfeed.com','abeech3u@aol.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf146','M84421D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10140','3148652132','Josey','Ilott','14040','5428807','8458945506','Azeri','jilott3v@oakley.com','jilott3v@ebay.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf147','V3929XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10141','1038307267','Loutitia','Blumer','14141','3186506','7226949510','Finnish','lblumer3w@wix.com','lblumer3w@sun.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf148','G959','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10142','930299370','Merl','Skillman','14242','8174171','2733460932','Zulu','mskillman3x@1und1.de','mskillman3x@oaic.gov.au','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf149','T22432A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10143','822291473','Tiffi','Comport','14343','9251300','7173382724','Greek','tcomport3y@domainmarket.com','tcomport3y@bbc.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf150','S7221XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10144','714283576','Norma','Le Noir','14444','9907018','4052797953','Norwegian','nlenoir3z@businessweek.com','nlenoir3z@shareasale.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf151','S63293','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10145','606275679','Cassandry','Maxted','14545','4884916','9836513580','Kazakh','cmaxted40@infoseek.co.jp','cmaxted40@gizmodo.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf152','V9610XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10146','498267782','Ruperta','Haines','14646','6366972','9672742427','Korean','rhaines41@deliciousdays.com','rhaines41@bravesites.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf153','I6991','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10147','390259885','Caryl','Wimpey','14747','4244856','4151282172','Bulgarian','cwimpey42@thetimes.co.uk','cwimpey42@earthlink.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf154','T23271S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10148','282251988','Bo','Gillise','14848','8976838','9985127026','Afrikaans','bgillise43@spotify.com','bgillise43@earthlink.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf155','S93511A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10149','174244091','Eugene','Bailey','14949','2994231','9794279061','Assamese','ebailey44@upenn.edu','ebailey44@google.de','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf156','M62551','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10150','66236194','Heath','Dobel','15050','7179929','7807296654','Thai','hdobel45@ow.ly','hdobel45@over-blog.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf157','S13140S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10151','41771703','Beverie','Garrett','10101','8883290','6088627834','Haitian Creole','bgarrett46@accuweather.com','bgarrett46@shinystat.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf158','S42363B','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10152','149779600','Northrup','Ingold','10202','2598802','3579957893','Azeri','ningold47@nsw.gov.au','ningold47@nymag.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf159','V00151D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10153','257787497','Elfrida','Waggitt','10303','5340836','4319773273','Northern Sotho','ewaggitt48@hao123.com','ewaggitt48@google.com.hk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf160','Y36111A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10154','365795394','Bertine','Gores','10404','7261073','7007733673','Chinese','bgores49@cyberchimps.com','bgores49@hibu.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf161','H3570','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10155','473803291','Evonne','Ladds','10505','1582344','9665907260','Tok Pisin','eladds4a@senate.gov','eladds4a@psu.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf162','S82221G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10156','581811188','Carri','Foster-Smith','10606','1057017','5713996681','Irish Gaelic','cfostersmith4b@deliciousdays.com','cfostersmith4b@amazon.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf163','S62637D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10157','689819085','Zita','Fermor','10707','5570397','7806726097','Northern Sotho','zfermor4c@bbc.co.uk','zfermor4c@hud.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf164','M2456','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10158','797826982','Chrissy','Doggerell','10808','6013536','6345920363','Guaraní','cdoggerell4d@loc.gov','cdoggerell4d@tuttocitta.it','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf165','S92522B','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10159','905834879','Leena','Ather','10909','1181188','9865085968','Somali','lather4e@plala.or.jp','lather4e@msn.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf166','S8254XB','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10160','1013842776','Angelique','Iacomettii','11010','7727163','5464903796','Hiri Motu','aiacomettii4f@last.fm','aiacomettii4f@nationalgeographic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf167','S82291Q','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10161','1121850673','Brook','Addionisio','11111','3054940','7386074331','Quechua','baddionisio4g@slashdot.org','baddionisio4g@webmd.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf168','Y36000A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10162','1229858570','Stace','Blaik','11212','8378048','8215789671','Quechua','sblaik4h@linkedin.com','sblaik4h@com.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf169','M24172','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10163','1337866467','Floris','Duce','11313','3348850','9163401646','Greek','fduce4i@discovery.com','fduce4i@prnewswire.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf170','S62209K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10164','1445874364','Huntington','Jancso','11414','8802433','4604843007','Estonian','hjancso4j@dell.com','hjancso4j@sina.com.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf171','S52522P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10165','1553882261','Morgun','Ghidini','11515','4346339','4202932548','Haitian Creole','mghidini4k@toplist.cz','mghidini4k@etsy.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf172','F19939','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10166','1661890158','Elyssa','de Grey','11616','1150314','3158252272','Tswana','edegrey4l@amazon.co.uk','edegrey4l@domainmarket.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf173','M6114','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10167','1769898055','Skippy','Ganniclifft','11717','1114947','7309511024','Oriya','sganniclifft4m@gizmodo.com','sganniclifft4m@amazonaws.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf174','M84462K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10168','1877905952','Jackelyn','Blas','11818','9348543','7438810363','Armenian','jblas4n@example.com','jblas4n@pbs.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf175','Y3691XS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10169','1985913849','Danni','Yannoni','11919','8416170','6274480117','Oriya','dyannoni4o@list-manage.com','dyannoni4o@ca.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf176','Z466','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10170','2093921746','Gael','Worner','12020','8783813','9258965300','Dhivehi','gworner4p@a8.net','gworner4p@deliciousdays.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf177','Q7213','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10171','2201929643','Kate','Jery','12121','6600859','5978219344','Croatian','kjery4q@earthlink.net','kjery4q@salon.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf178','B44','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10172','2309937540','Emelia','Tieman','12222','1240943','3872911744','Luxembourgish','etieman4r@bizjournals.com','etieman4r@tuttocitta.it','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf179','S32309G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10173','2417945437','Barry','Jaher','12323','5292404','1694440084','Estonian','bjaher4s@acquirethisname.com','bjaher4s@printfriendly.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf180','S52513R','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10174','2525953334','Fields','Lassell','12424','4514636','6592673550','Zulu','flassell4t@buzzfeed.com','flassell4t@bing.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf181','V571XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10175','2633961231','Melinda','Smitheram','12525','9107905','3746446316','Dzongkha','msmitheram4u@irs.gov','msmitheram4u@unicef.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf182','S41141S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10176','2741969128','Jonah','Walkden','12626','6332774','8271607794','Guaraní','jwalkden4v@independent.co.uk','jwalkden4v@histats.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf183','Y37050D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10177','2849977025','Loydie','Colqueran','12727','4239163','5517579576','Hebrew','lcolqueran4w@msn.com','lcolqueran4w@go.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf184','S82855B','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10178','2957984922','Guglielmo','Bucke','12828','7954807','5184462288','Gagauz','gbucke4x@gnu.org','gbucke4x@fema.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf185','Z982','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10179','3065992819','Cassandry','Hanby','12929','8099365','4372332236','Indonesian','chanby4y@ask.com','chanby4y@reverbnation.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf186','M84422S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10180','1120966580','Rickie','Petz','13030','6614323','5241179749','Tok Pisin','rpetz4z@zimbio.com','rpetz4z@storify.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf187','M24422','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10181','1012958683','Gretta','Ternott','13131','6818783','9928366392','French','gternott50@issuu.com','gternott50@photobucket.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf188','S52023K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10182','904950786','Patti','Biddiss','13232','2582849','3313757027','Guaraní','pbiddiss51@discovery.com','pbiddiss51@narod.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf189','S4440XS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10183','796942889','Sunny','Doick','13333','6129055','8412357361','Swati','sdoick52@who.int','sdoick52@bigcartel.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf190','S12091K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10184','688934992','Sybille','Eustes','13434','3934409','4218637065','Maltese','seustes53@infoseek.co.jp','seustes53@ftc.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf191','M25051','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10185','580927095','Jammie','Bergstram','13535','1435718','4579673839','Polish','jbergstram54@desdev.cn','jbergstram54@taobao.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf192','M6514','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10186','472919198','Alick','Attwooll','13636','6076643','5388483771','Ndebele','aattwooll55@narod.ru','aattwooll55@github.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf193','Z115','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10187','364911301','Arabele','Edmead','13737','3845861','1209199997','Bengali','aedmead56@cargocollective.com','aedmead56@google.ca','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf194','S0122XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10188','256903404','Sioux','Iacovino','13838','9808058','9991975996','Nepali','siacovino57@vimeo.com','siacovino57@fda.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf195','T45511D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10189','148895507','Anallese','Crooke','13939','8621786','6318948544','Dutch','acrooke58@disqus.com','acrooke58@loc.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf196','S25391S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10190','40887610','Terrence','Drewitt','14040','3659035','4017243625','Kashmiri','tdrewitt59@slashdot.org','tdrewitt59@telegraph.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf197','B483','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10191','67120287','Glory','Utterson','14141','8966618','1471930802','Pashto','gutterson5a@irs.gov','gutterson5a@fc2.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf198','T25399','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10192','175128184','Athene','Mary','14242','8606696','8341017174','Azeri','amary5b@macromedia.com','amary5b@examiner.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf199','S62161S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10193','283136081','Brinna','Skeech','14343','2858976','7815641043','Italian','bskeech5c@buzzfeed.com','bskeech5c@friendfeed.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf200','T386X2A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10194','391143978','Leola','Berlin','14444','5446882','7973539906','Danish','lberlin5d@squidoo.com','lberlin5d@studiopress.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf201','H16422','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10195','499151875','Marchelle','Butland','14545','2479444','4492208668','Bislama','mbutland5e@bluehost.com','mbutland5e@vimeo.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf202','Z1624','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10196','607159772','Blinni','Stock','14646','6736742','8715983108','Swedish','bstock5f@usatoday.com','bstock5f@dedecms.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf203','S82436K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10197','715167669','Shea','Sheaf','14747','8640576','2977149906','Portuguese','ssheaf5g@epa.gov','ssheaf5g@virginia.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf204','S21302','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10198','823175566','Janice','Stockey','14848','7872217','3586239350','Irish Gaelic','jstockey5h@yellowpages.com','jstockey5h@friendfeed.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf205','R85616','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10199','931183463','Lenette','Rigby','14949','6263850','5407924180','Aymara','lrigby5i@answers.com','lrigby5i@google.com.hk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf206','R031','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10200','1039191360','Kaylyn','Tiptaft','15050','4620148','5701143186','Burmese','ktiptaft5j@goo.gl','ktiptaft5j@cdbaby.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf207','S35228','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10201','1147199257','Sisile','Phippen','10101','4380821','5108109027','Catalan','sphippen5k@scribd.com','sphippen5k@imageshack.us','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf208','S5610','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10202','1255207154','Corinna','Ogilvie','10202','7401872','2712449372','Swedish','cogilvie5l@fc2.com','cogilvie5l@blogtalkradio.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf209','Z8661','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10203','1363215051','Yvon','Oswal','10303','3731136','8643311135','Croatian','yoswal5m@php.net','yoswal5m@bing.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf210','T7801XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10204','1471222948','Lurlene','McCallion','10404','5928056','4749550658','Irish Gaelic','lmccallion5n@princeton.edu','lmccallion5n@wiley.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf211','S60418A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10205','1579230845','Ferne','Sjostrom','10505','4650900','5094608971','Maltese','fsjostrom5o@boston.com','fsjostrom5o@princeton.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf212','K000','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10206','1687238742','Allis','Ussher','10606','2344590','8189978284','Tsonga','aussher5p@bigcartel.com','aussher5p@soup.io','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf213','L663','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10207','1795246639','Lisbeth','Hennemann','10707','6183294','5927181312','Indonesian','lhennemann5q@clickbank.net','lhennemann5q@chicagotribune.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf214','S46102D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10208','1903254536','Vlad','Kubat','10808','2784559','7855822412','Thai','vkubat5r@skyrock.com','vkubat5r@un.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf215','T24719S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10209','2011262433','Mannie','Fynn','10909','1013750','5981165789','Kurdish','mfynn5s@nih.gov','mfynn5s@goodreads.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf216','S32315K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10210','2119270330','Isobel','Backen','11010','7359912','4053124871','Bosnian','ibacken5t@npr.org','ibacken5t@printfriendly.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf217','S58911','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10211','2227278227','Nissie','Staples','11111','9203103','2681844989','Tok Pisin','nstaples5u@exblog.jp','nstaples5u@cnn.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf218','H61812','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10212','2335286124','Ab','Rainbow','11212','1728924','7767917886','Bosnian','arainbow5v@eventbrite.com','arainbow5v@t.co','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf219','S92242B','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10213','2443294021','Noland','Leindecker','11313','4072346','3968296744','Korean','nleindecker5w@wikimedia.org','nleindecker5w@nature.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf220','F3013','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10214','2551301918','Lucina','Harwick','11414','8937690','2323390470','Haitian Creole','lharwick5x@army.mil','lharwick5x@boston.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf221','S85131A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10215','2659309815','Eldredge','Newens','11515','5164063','3603674311','Dari','enewens5y@posterous.com','enewens5y@xrea.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf222','M8618','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10216','2767317712','Glen','Aviss','11616','3954079','6471487898','Tamil','gaviss5z@google.co.jp','gaviss5z@bbb.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf223','S638X9D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10217','2875325609','Skylar','Nice','11717','6465219','3636623337','West Frisian','snice60@newsvine.com','snice60@ycombinator.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf224','S92134','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10218','2983333506','Thibaud','Scardifeild','11818','9267169','2119145607','Tamil','tscardifeild61@is.gd','tscardifeild61@altervista.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf225','M7651','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10219','3091341403','Kial','Teesdale','11919','5344091','4413815061','Icelandic','kteesdale62@virginia.edu','kteesdale62@flavors.me','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf226','S82143A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10220','1095617996','Aaren','Sitch','12020','3877970','1659710618','Ndebele','asitch63@imdb.com','asitch63@netvibes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf227','S92335','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10221','987610099','Sean','Nicholes','12121','9284638','9384859839','Yiddish','snicholes64@ovh.net','snicholes64@java.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf228','Z1883','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10222','879602202','Herby','Zupa','12222','8163764','7961870693','Macedonian','hzupa65@multiply.com','hzupa65@tinypic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf229','T2110XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10223','771594305','Elle','Walenta','12323','2709051','4147120027','Azeri','ewalenta66@webs.com','ewalenta66@cornell.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf230','L025','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10224','663586408','Deedee','Da Costa','12424','7632851','4903107222','Burmese','ddacosta67@vinaora.com','ddacosta67@nasa.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf231','S52241R','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10225','555578511','Jeralee','Champe','12525','8333869','6786667562','Ndebele','jchampe68@cafepress.com','jchampe68@cisco.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf232','M8430XG','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10226','447570614','Andres','Cremen','12626','4575510','3429489530','Swati','acremen69@miibeian.gov.cn','acremen69@slashdot.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf233','S72036H','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10227','339562717','Bartel','Husher','12727','6534563','5447066602','Khmer','bhusher6a@freewebs.com','bhusher6a@omniture.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf234','E1037','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10228','231554820','Roch','Lockie','12828','2764885','5789243026','Bulgarian','rlockie6b@ebay.com','rlockie6b@abc.net.au','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf235','I6344','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10229','123546923','Daniella','Kinnaird','12929','7656251','1014344189','New Zealand Sign Language','dkinnaird6c@qq.com','dkinnaird6c@free.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf236','I69962','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10230','15539026','Anthony','Simonazzi','13030','8327714','9617092122','Fijian','asimonazzi6d@purevolume.com','asimonazzi6d@seesaa.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf237','C8498','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10231','92468871','Araldo','Cavie','13131','1477919','3271898358','Bulgarian','acavie6e@vkontakte.ru','acavie6e@ustream.tv','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf238','D529','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10232','200476768','Shurlock','Butterick','13232','9456209','7407695153','French','sbutterick6f@slashdot.org','sbutterick6f@yahoo.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf239','Z753','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10233','308484665','Peggie','Kail','13333','1962381','6253650989','New Zealand Sign Language','pkail6g@storify.com','pkail6g@merriam-webster.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf240','S66302S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10234','416492562','Winnah','Farries','13434','8320294','5425149922','Dhivehi','wfarries6h@yahoo.co.jp','wfarries6h@istockphoto.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf241','W2181XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10235','524500459','Granthem','Chinn','13535','8011856','7928258936','Tetum','gchinn6i@sfgate.com','gchinn6i@wsj.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf242','B0860','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10236','632508356','Yanaton','Stut','13636','1349401','8648662297','Punjabi','ystut6j@symantec.com','ystut6j@statcounter.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf243','T484X4','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10237','740516253','Leonore','Bolstridge','13737','5546491','6662994356','Azeri','lbolstridge6k@reference.com','lbolstridge6k@merriam-webster.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf244','C8375','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10238','848524150','Nomi','Amber','13838','8206693','2598955938','Danish','namber6l@youtu.be','namber6l@issuu.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf245','S63591D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10239','956532047','Ivar','Hooks','13939','2981440','9156806052','Hiri Motu','ihooks6m@multiply.com','ihooks6m@gov.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf246','T69019D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10240','1064539944','Bastian','Hunstone','14040','7600038','4035171543','Tamil','bhunstone6n@opensource.org','bhunstone6n@goo.gl','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf247','S91249','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10241','1172547841','Allie','Gillett','14141','9193105','3233149141','Persian','agillett6o@histats.com','agillett6o@fotki.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf248','V769XXS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10242','1280555738','Hilario','Cabena','14242','1044666','4215748111','Thai','hcabena6p@chicagotribune.com','hcabena6p@nydailynews.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf249','S2821','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10243','1388563635','Halli','Labin','14343','5290712','2968726474','Swedish','hlabin6q@google.com','hlabin6q@sohu.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf250','V305XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10244','1496571532','Artie','Stave','14444','8044990','4626442865','Malayalam','astave6r@biblegateway.com','astave6r@ucoz.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf251','M84864','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10245','1604579429','Trudi','Bissill','14545','8863823','1259907569','Luxembourgish','tbissill6s@tamu.edu','tbissill6s@spotify.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf252','I69019','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10246','1712587326','Horatio','Trazzi','14646','4725227','4976769900','Lao','htrazzi6t@is.gd','htrazzi6t@theglobeandmail.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf253','S82224F','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10247','1820595223','Adrien','Manser','14747','7640196','5989820650','Spanish','amanser6u@addtoany.com','amanser6u@ning.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf254','D150','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10248','1928603120','Merline','Osgerby','14848','6031499','8078432654','Norwegian','mosgerby6v@webs.com','mosgerby6v@networkadvertising.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf255','R40223','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10249','2036611017','Currey','Benzi','14949','4721568','6614005885','Haitian Creole','cbenzi6w@blogspot.com','cbenzi6w@nifty.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf256','T495X2S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10250','2144618914','Kristen','Skeene','15050','8518838','4717737894','Moldovan','kskeene6x@youtube.com','kskeene6x@photobucket.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf257','Y35291D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10251','2252626811','Kirstyn','Redier','10101','3161651','4131225317','Amharic','kredier6y@ibm.com','kredier6y@paypal.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf258','F18280','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10252','2360634708','Hart','Bollans','10202','1505227','3603490590','Bislama','hbollans6z@engadget.com','hbollans6z@surveymonkey.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf259','L210','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10253','2468642605','Annmaria','Brasseur','10303','1405424','9361365836','Bengali','abrasseur70@sbwire.com','abrasseur70@technorati.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf260','V819XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10254','2576650502','Duky','Found','10404','5836135','9569811315','Dutch','dfound71@indiegogo.com','dfound71@bing.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf261','N005','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10255','2684658399','Dannel','Lackie','10505','8485729','8965194098','Malagasy','dlackie72@virginia.edu','dlackie72@blogtalkradio.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf262','S61235A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10256','2792666296','Immanuel','Ratledge','10606','5240747','1758729582','Polish','iratledge73@thetimes.co.uk','iratledge73@angelfire.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf263','S72041M','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10257','2900674193','Stavros','Pittet','10707','4754368','7578017444','Kurdish','spittet74@usa.gov','spittet74@livejournal.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf264','Y99','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10258','3008682090','Amerigo','Millom','10808','3889459','5964313892','New Zealand Sign Language','amillom75@artisteer.com','amillom75@ehow.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf265','M84674A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10259','3116689987','Tracie','Spiers','10909','1763572','6456838000','New Zealand Sign Language','tspiers76@hud.gov','tspiers76@barnesandnoble.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf266','M86532','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10260','1070269412','Melosa','Frankcom','11010','3544647','9907357752','Belarusian','mfrankcom77@ft.com','mfrankcom77@canalblog.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf267','T407X1','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10261','962261515','Cecile','Cabane','11111','1480013','2005103595','Luxembourgish','ccabane78@dion.ne.jp','ccabane78@ft.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf268','S82456J','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10262','854253618','Petrina','Dunnaway','11212','3122896','9083098129','Marathi','pdunnaway79@sun.com','pdunnaway79@eventbrite.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf269','Z430','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10263','746245721','Darrelle','Blazi','11313','6060146','8878287040','Mongolian','dblazi7a@paypal.com','dblazi7a@chicagotribune.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf270','S2097','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10264','638237824','Verile','Kidner','11414','5258622','2091799224','Thai','vkidner7b@biglobe.ne.jp','vkidner7b@jugem.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf271','V581','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10265','530229927','Astra','Bille','11515','6279676','6323033216','Tswana','abille7c@bloglines.com','abille7c@deliciousdays.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf272','I69349','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10266','422222030','Ira','Leadstone','11616','7943130','9775969995','Norwegian','ileadstone7d@ning.com','ileadstone7d@china.com.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf273','S66291A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10267','314214133','Jessie','Meneely','11717','5115447','5441314322','Gagauz','jmeneely7e@huffingtonpost.com','jmeneely7e@xrea.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf274','S62246P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10268','206206236','Trixie','Pounds','11818','7295558','8447413552','Burmese','tpounds7f@japanpost.jp','tpounds7f@bravesites.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf275','W561','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10269','98198339','Benjy','Vanyutin','11919','1343889','1262439207','Quechua','bvanyutin7g@loc.gov','bvanyutin7g@a8.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf276','S022XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10270','9809558','Emmy','Doone','12020','9709504','7027782628','Filipino','edoone7h@trellian.com','edoone7h@mapquest.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf277','S9031XS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10271','117817455','Chilton','Yannikov','12121','2198382','2161232168','Malayalam','cyannikov7i@sohu.com','cyannikov7i@china.com.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf278','C9192','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10272','225825352','Kassie','Hutchinson','12222','8028306','8622834303','Afrikaans','khutchinson7j@unblog.fr','khutchinson7j@skyrock.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf279','E09329','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10273','333833249','Sue','Prangle','12323','9786777','7602966680','Haitian Creole','sprangle7k@weibo.com','sprangle7k@cloudflare.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf280','V5910','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10274','441841146','Salaidh','Fenty','12424','6085608','6507834292','German','sfenty7l@redcross.org','sfenty7l@csmonitor.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf281','K08114','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10275','549849043','Maura','Petasch','12525','3690911','6181296045','Filipino','mpetasch7m@techcrunch.com','mpetasch7m@webeden.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf282','M2483','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10276','657856940','Ruthann','Denziloe','12626','1735241','2133666493','Bulgarian','rdenziloe7n@opera.com','rdenziloe7n@scribd.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf283','T601X2D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10277','765864837','Bartholemy','Graeber','12727','4692725','3824760959','Telugu','bgraeber7o@theguardian.com','bgraeber7o@answers.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf284','T455','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10278','873872734','Claresta','Geroldi','12828','9511717','9663718952','Greek','cgeroldi7p@nytimes.com','cgeroldi7p@state.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf285','S79131D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10279','981880631','Peggy','Hillum','12929','6674014','4945549231','Yiddish','phillum7q@blogs.com','phillum7q@dot.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf286','T83490S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10280','1089888528','Maurise','Harral','13030','7576539','9417740364','Kurdish','mharral7r@pcworld.com','mharral7r@aol.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf287','S45992','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10281','1197896425','Birch','Halfacre','13131','1484454','7917473336','Yiddish','bhalfacre7s@google.ca','bhalfacre7s@army.mil','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf288','J44','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10282','1305904322','Felice','Peters','13232','6437257','9168846534','Azeri','fpeters7t@intel.com','fpeters7t@istockphoto.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf289','T39393A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10283','1413912219','Carolynn','Corlett','13333','5040232','5735941232','Dzongkha','ccorlett7u@posterous.com','ccorlett7u@bbb.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf290','S60012A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10284','1521920116','Dianemarie','Ritzman','13434','5732257','8052812004','Spanish','dritzman7v@gravatar.com','dritzman7v@lycos.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf291','T373X4S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10285','1629928013','Corbet','Fresson','13535','1637352','1982518136','Papiamento','cfresson7w@tinyurl.com','cfresson7w@whitehouse.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf292','Q268','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10286','1737935910','Hyacinthie','Moehle','13636','6487242','7955215166','Montenegrin','hmoehle7x@time.com','hmoehle7x@reddit.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf293','S63496S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10287','1845943807','Betti','Cain','13737','4849796','2579205944','Czech','bcain7y@cbc.ca','bcain7y@admin.ch','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf294','K8046','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10288','1953951704','Calv','Broadley','13838','3207758','3916397424','Macedonian','cbroadley7z@vinaora.com','cbroadley7z@sbwire.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf295','T23741','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10289','2061959601','Patrice','Bitterton','13939','9989050','8867747742','Albanian','pbitterton80@phpbb.com','pbitterton80@cbsnews.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf296','T524X4S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10290','2169967498','Atlante','Strongman','14040','8910919','9693634006','Marathi','astrongman81@businesswire.com','astrongman81@google.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf297','O3402','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10291','2277975395','Marrilee','Jozaitis','14141','3328714','8648143697','Punjabi','mjozaitis82@ibm.com','mjozaitis82@cisco.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf298','T63412D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10292','2385983292','Sigismundo','Dradey','14242','5175077','6742956026','Norwegian','sdradey83@sphinn.com','sdradey83@nationalgeographic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf299','T483X4','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10293','2493991189','Wandie','Dalloway','14343','3029991','1183460922','Telugu','wdalloway84@chronoengine.com','wdalloway84@com.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf300','S99911','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10294','2601999086','Natalya','Dumphries','14444','7632845','9476537132','Oriya','ndumphries85@telegraph.co.uk','ndumphries85@domainmarket.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf301','O361915','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10295','2710006983','Nil','Pratley','14545','1757782','7247511672','Dari','npratley86@goodreads.com','npratley86@wix.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf302','O2332','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10296','2818014880','Yul','Gottelier','14646','1944345','1988269350','Tajik','ygottelier87@adobe.com','ygottelier87@technorati.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf303','T5804XS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10297','2926022777','Abby','Capron','14747','6170691','7264093692','Kazakh','acapron88@hatena.ne.jp','acapron88@twitpic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf304','P838','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10298','3034030674','Hazel','Kohrt','14848','8726205','7866897491','Guaraní','hkohrt89@ehow.com','hkohrt89@mit.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf305','Z813','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10299','3142038571','Elsie','Casserly','14949','4195922','8902045538','Catalan','ecasserly8a@ycombinator.com','ecasserly8a@accuweather.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf306','S82444A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10300','1044920828','Vallie','Focke','15050','6889745','8769489007','Danish','vfocke8b@t.co','vfocke8b@intel.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf307','M80831K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10301','936912931','Orly','Duprey','10101','1699688','9885048769','Icelandic','oduprey8c@aol.com','oduprey8c@artisteer.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf308','S82442R','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10302','828905034','Dukey','Chrispin','10202','7404552','3178763859','Albanian','dchrispin8d@ning.com','dchrispin8d@rambler.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf309','S63519S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10303','720897137','Shea','Manon','10303','5682685','1312352249','Mongolian','smanon8e@abc.net.au','smanon8e@booking.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf310','Q360','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10304','612889240','Ferdinande','Battabee','10404','3790936','8764410272','Assamese','fbattabee8f@stanford.edu','fbattabee8f@istockphoto.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf311','T501X3','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10305','504881343','Hailey','Teague','10505','3663877','8769919445','Hindi','hteague8g@nhs.uk','hteague8g@liveinternet.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf312','S59202D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10306','396873446','Sibeal','Kildea','10606','3615600','5447095114','Bulgarian','skildea8h@phpbb.com','skildea8h@dedecms.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf313','M678','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10307','288865549','Trevar','Lemmon','10707','1073138','9618124256','French','tlemmon8i@liveinternet.ru','tlemmon8i@macromedia.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf314','T266','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10308','180857652','Ora','Whytock','10808','8895626','9786215075','Hindi','owhytock8j@sphinn.com','owhytock8j@behance.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf315','E102','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10309','72849755','Melessa','Krzysztof','10909','8487913','8646248635','Burmese','mkrzysztof8k@list-manage.com','mkrzysztof8k@cbsnews.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf316','M00841','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10310','35158142','Carmelina','Pirdue','11010','2969699','9598730522','Somali','cpirdue8l@go.com','cpirdue8l@dell.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf317','V602XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10311','143166039','Kikelia','Speek','11111','3824984','9516463697','Tsonga','kspeek8m@cnet.com','kspeek8m@thetimes.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf318','M84552S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10312','251173936','Fields','Flieg','11212','8307630','7878281332','Albanian','fflieg8n@privacy.gov.au','fflieg8n@shop-pro.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf319','S86992S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10313','359181833','Nita','Ziemecki','11313','5027100','6705946761','Portuguese','nziemecki8o@webeden.co.uk','nziemecki8o@engadget.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf320','M02161','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10314','467189730','Ame','Kenningley','11414','8296276','4616571384','West Frisian','akenningley8p@ucoz.com','akenningley8p@intel.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf321','N944','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10315','575197627','Yvette','Ohlsen','11515','5393096','5071660338','Sotho','yohlsen8q@jugem.jp','yohlsen8q@senate.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf322','S7721XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10316','683205524','Roland','Marxsen','11616','8978162','4619766563','Zulu','rmarxsen8r@webmd.com','rmarxsen8r@list-manage.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf323','Z0289','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10317','791213421','Arlyn','Shimuk','11717','6826746','9537989246','Japanese','ashimuk8s@discuz.net','ashimuk8s@miibeian.gov.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf324','S86092A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10318','899221318','Hildagard','Loft','11818','2526745','1707232427','Kurdish','hloft8t@nps.gov','hloft8t@moonfruit.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf325','S8331','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10319','1007229215','Padriac','Merwede','11919','3413781','4391314513','Maltese','pmerwede8u@discovery.com','pmerwede8u@friendfeed.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf326','H04319','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10320','1115237112','Sibley','Pfiffer','12020','7159205','4288525353','Albanian','spfiffer8v@ning.com','spfiffer8v@webnode.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf327','S92141A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10321','1223245009','Martynne','Etoile','12121','6213820','4434203045','Swahili','metoile8w@gnu.org','metoile8w@statcounter.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf328','V124XXA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10322','1331252906','Annalise','Drawmer','12222','2803724','9409908601','Hebrew','adrawmer8x@symantec.com','adrawmer8x@pinterest.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf329','H4922','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10323','1439260803','Terence','Barnardo','12323','9322080','1036334481','Macedonian','tbarnardo8y@reverbnation.com','tbarnardo8y@blogs.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf330','S2532','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10324','1547268700','Emmott','McKnish','12424','3286718','7241566251','Dari','emcknish8z@shareasale.com','emcknish8z@reddit.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf331','V9018XA','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10325','1655276597','Boyce','McNuff','12525','5250331','3416770590','Punjabi','bmcnuff90@ed.gov','bmcnuff90@imgur.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf332','T31','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10326','1763284494','Cecilio','MacGilfoyle','12626','7884151','7814753408','Tamil','cmacgilfoyle91@nps.gov','cmacgilfoyle91@spiegel.de','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf333','S55119S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10327','1871292391','Dukey','Boobier','12727','6318732','6681550347','Haitian Creole','dboobier92@yellowbook.com','dboobier92@earthlink.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf334','S82021M','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10328','1979300288','Imogene','Degoy','12828','5022751','7437405827','Somali','idegoy93@friendfeed.com','idegoy93@mashable.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf335','S4913','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10329','2087308185','Alejoa','Richley','12929','3927777','6677203363','Yiddish','arichley94@google.co.uk','arichley94@mapy.cz','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf336','T23702','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10330','2195316082','Esmaria','MacDermand','13030','5483084','7351520113','Chinese','emacdermand95@pinterest.com','emacdermand95@wikia.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf337','S99199A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10331','2303323979','Renaud','Mell','13131','4215323','3322573086','Malay','rmell96@amazonaws.com','rmell96@blogtalkradio.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf338','S95111A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10332','2411331876','Dwight','Pendry','13232','2640160','7319230006','Quechua','dpendry97@ihg.com','dpendry97@stanford.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf339','H53452','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10333','2519339773','Ilaire','Muldrew','13333','2766133','2947346884','Tsonga','imuldrew98@walmart.com','imuldrew98@ft.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf340','H401222','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10334','2627347670','Celia','Deinert','13434','8869963','8377155062','West Frisian','cdeinert99@sun.com','cdeinert99@soundcloud.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf341','S42481K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10335','2735355567','Arlen','Shadrach','13535','6184367','5704659286','Kashmiri','ashadrach9a@acquirethisname.com','ashadrach9a@upenn.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf342','T441X1','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10336','2843363464','Artur','Rawsthorne','13636','2285703','8317479244','French','arawsthorne9b@irs.gov','arawsthorne9b@reuters.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf343','T81534','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10337','2951371361','Colan','Baudacci','13737','1305924','5066106650','M?ori','cbaudacci9c@printfriendly.com','cbaudacci9c@bing.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf344','S42115B','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10338','3059379258','Mahalia','Markwelley','13838','4745698','4562317516','Romanian','mmarkwelley9d@fda.gov','mmarkwelley9d@bandcamp.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf345','S52271S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10339','3167387155','Ninetta','Kippen','13939','3890639','6127391632','Macedonian','nkippen9e@mac.com','nkippen9e@mapy.cz','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf346','S81021S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10340','1019572244','Ally','Suttie','14040','7146660','1868086921','Kazakh','asuttie9f@goodreads.com','asuttie9f@chronoengine.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf347','S72116H','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10341','911564347','Zaria','Boother','14141','9858013','7584839162','Polish','zboother9g@house.gov','zboother9g@ameblo.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf348','O6982X1','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10342','803556450','Cassi','Andrysek','14242','3494234','2617127539','Spanish','candrysek9h@barnesandnoble.com','candrysek9h@behance.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf349','S7602','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10343','695548553','Thacher','Mawson','14343','2407038','6004185791','New Zealand Sign Language','tmawson9i@mail.ru','tmawson9i@booking.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf350','Y36881A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10344','587540656','Arabelle','Sharvill','14444','1333827','1229960237','Korean','asharvill9j@smugmug.com','asharvill9j@indiatimes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf351','R7981','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10345','479532759','Yoshi','Moorerud','14545','2680207','8555452364','Marathi','ymoorerud9k@live.com','ymoorerud9k@utexas.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf352','T317','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10346','371524862','Raimondo','Arnaut','14646','6482798','9909909885','Macedonian','rarnaut9l@google.com','rarnaut9l@arizona.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf353','S12110K','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10347','263516965','Arlin','Aspy','14747','4530505','2397971255','Kazakh','aaspy9m@nytimes.com','aaspy9m@pagesperso-orange.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf354','X19XXXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10348','155509068','Dunstan','Dewdeny','14848','5680447','3086372183','Lithuanian','ddewdeny9n@tinypic.com','ddewdeny9n@hostgator.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf355','Z2803','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10349','47501171','Nora','Byrcher','14949','3694974','2998577754','Italian','nbyrcher9o@flickr.com','nbyrcher9o@fotki.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf356','C9240','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10350','60506726','Elmore','Lathwood','15050','1520301','2038730840','Kyrgyz','elathwood9p@tamu.edu','elathwood9p@google.nl','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf357','T2149','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10351','168514623','Rosana','Garvagh','10101','2139368','5553042541','Finnish','rgarvagh9q@berkeley.edu','rgarvagh9q@hibu.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf358','S41149A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10352','276522520','Hasheem','Pidgley','10202','7953206','7538046605','Bislama','hpidgley9r@psu.edu','hpidgley9r@spiegel.de','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf359','H47033','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10353','384530417','Clea','Gallemore','10303','9027553','6777572925','Maltese','cgallemore9s@behance.net','cgallemore9s@marriott.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf360','S61308A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10354','492538314','Job','Spelling','10404','8434287','1826619213','Albanian','jspelling9t@vistaprint.com','jspelling9t@virginia.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf361','H2122','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10355','600546211','Lombard','Iddens','10505','8916069','5338701705','Sotho','liddens9u@unc.edu','liddens9u@pagesperso-orange.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf362','S41121D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10356','708554108','Victoir','Lathy','10606','7213999','8717675978','Amharic','vlathy9v@list-manage.com','vlathy9v@wp.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf363','M89732','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10357','816562005','Shaughn','Rickards','10707','8485519','3287028214','Persian','srickards9w@furl.net','srickards9w@usa.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf364','S82264D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10358','924569902','Anica','Demogeot','10808','1405892','8157786341','Ndebele','ademogeot9x@multiply.com','ademogeot9x@blogtalkradio.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf365','T8412','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10359','1032577799','Evangelia','Petracco','10909','3631731','2788609308','Telugu','epetracco9y@pbs.org','epetracco9y@lulu.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf366','C7952','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10360','1140585696','Curt','Mc Caughen','11010','5404429','4426460888','Moldovan','cmccaughen9z@indiatimes.com','cmccaughen9z@squarespace.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf367','Y36091S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10361','1248593593','Agace','Rozzell','11111','4282638','2024261586','Amharic','arozzella0@cmu.edu','arozzella0@newsvine.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf368','V452XXD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10362','1356601490','Krystyna','Gurry','11212','4949527','4219253619','Lao','kgurrya1@ucoz.com','kgurrya1@europa.eu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf369','S62144G','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10363','1464609387','Algernon','Cuxson','11313','5672068','6258246613','Albanian','acuxsona2@so-net.ne.jp','acuxsona2@vimeo.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf370','S89212S','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10364','1572617284','Buiron','Icke','11414','1116371','7143864749','West Frisian','bickea3@diigo.com','bickea3@miibeian.gov.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf371','S8263XM','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10365','1680625181','L;urette','Nelane','11515','7403319','7286973678','Swahili','lnelanea4@wordpress.com','lnelanea4@woothemes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf372','J043','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10366','1788633078','Wye','Iddenden','11616','5960466','3107113272','Haitian Creole','widdendena5@unc.edu','widdendena5@ocn.ne.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf373','S52211D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10367','1896640975','Colan','Pratt','11717','5708604','7601512013','Italian','cpratta6@sina.com.cn','cpratta6@guardian.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf374','Y288XXS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10368','2004648872','Kim','Toyne','11818','9970625','6923167120','Pashto','ktoynea7@slashdot.org','ktoynea7@163.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf375','Y3791','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10369','2112656769','Harley','Zum Felde','11919','4969842','2009553594','Filipino','hzumfeldea8@barnesandnoble.com','hzumfeldea8@wordpress.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf376','A812','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10370','2220664666','Thain','Mosedill','12020','7371164','9827841237','Bulgarian','tmosedilla9@rambler.ru','tmosedilla9@over-blog.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf377','S2751','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10371','2328672563','Jarib','Leel','12121','8903906','5897742235','Gagauz','jleelaa@japanpost.jp','jleelaa@clickbank.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf378','S45212D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10372','2436680460','Kelsy','Buddell','12222','4402864','9313240893','Greek','kbuddellab@ezinearticles.com','kbuddellab@google.com.hk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf379','Q7102','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10373','2544688357','Mufinella','Arrighetti','12323','1219183','2384564296','Guaraní','marrighettiac@ning.com','marrighettiac@angelfire.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf380','S82456H','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10374','2652696254','Mira','Aberhart','12424','7730487','4457705240','Khmer','maberhartad@multiply.com','maberhartad@ebay.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf381','I70202','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10375','2760704151','Tudor','Turnor','12525','5193703','3155732712','Bislama','tturnorae@hc360.com','tturnorae@nationalgeographic.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf382','H3120','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10376','2868712048','Mylo','Lage','12626','2091635','3454980317','Kyrgyz','mlageaf@w3.org','mlageaf@so-net.ne.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf383','T360X1D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10377','2976719945','Tildi','Tenny','12727','3741471','4279658537','Hindi','ttennyag@noaa.gov','ttennyag@xing.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf384','O24019','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10378','3084727842','Meggy','Latus','12828','9521370','6294312885','German','mlatusah@about.com','mlatusah@globo.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf385','M84464','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10379','1102231557','Finley','Shingler','12929','7505777','1057951180','Czech','fshinglerai@constantcontact.com','fshinglerai@house.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf386','V671XXS','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10380','994223660','Sharla','Paynton','13030','3206215','3456561221','Northern Sotho','spayntonaj@multiply.com','spayntonaj@gov.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf387','S88022A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10381','886215763','Aldo','Blinco','13131','5426430','4011695623','Dhivehi','ablincoak@twitter.com','ablincoak@sina.com.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf388','S52032H','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10382','778207866','Kincaid','Ivanenko','13232','1502532','3318606923','Catalan','kivanenkoal@taobao.com','kivanenkoal@statcounter.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf389','S0094','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10383','670199969','Fredric','Hughman','13333','8846525','9941648484','Gagauz','fhughmanam@histats.com','fhughmanam@ezinearticles.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf390','S72046F','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10384','562192072','Penny','Coldicott','13434','2889217','4431723803','Tetum','pcoldicottan@seattletimes.com','pcoldicottan@psu.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf391','S72422D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10385','454184175','Heath','Bottomore','13535','4266623','1808170114','Tamil','hbottomoreao@histats.com','hbottomoreao@mapy.cz','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf392','S25311A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10386','346176278','Ashbey','Matson','13636','3416977','1909543204','Catalan','amatsonap@marketwatch.com','amatsonap@newyorker.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf393','S4102','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10387','238168381','Anny','Saltmarshe','13737','5923441','7521904364','Maltese','asaltmarsheaq@unicef.org','asaltmarsheaq@addthis.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf394','S89321D','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10388','130160484','Birk','Henden','13838','2744686','7906896043','M?ori','bhendenar@free.fr','bhendenar@narod.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf395','S99022P','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10389','22152587','Panchito','Huke','13939','7116915','7856919062','Amharic','phukeas@quantcast.com','phukeas@soup.io','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf396','S2222XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10390','85855310','Zorine','Binley','14040','2965229','1144551300','Gujarati','zbinleyat@pbs.org','zbinleyat@g.co','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf397','S46221','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10391','193863207','Honoria','Haddy','14141','8313140','3477389465','Moldovan','hhaddyau@mozilla.org','hhaddyau@bbc.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf398','S2231XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10392','301871104','Vina','Cattlow','14242','5327163','4758036405','Gujarati','vcattlowav@twitter.com','vcattlowav@goo.gl','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf399','O2302','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10393','409879001','Raddy','Gooddy','14343','9078183','5793990417','Kurdish','rgooddyaw@over-blog.com','rgooddyaw@naver.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf400','S026','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10394','517886898','Bink','Standring','14444','1194086','6172940993','Azeri','bstandringax@mlb.com','bstandringax@sina.com.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf401','M7104','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10395','625894795','Oliver','Sheppard','14545','5465218','6827168481','M?ori','oshepparday@cyberchimps.com','oshepparday@npr.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf402','I454','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10396','733902692','Tadd','Yockney','14646','6374602','4542530572','Sotho','tyockneyaz@godaddy.com','tyockneyaz@de.vu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf403','S53096','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10397','841910589','Coleman','Jozsa','14747','3425906','7654428908','Macedonian','cjozsab0@jigsy.com','cjozsab0@squarespace.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf404','S1082XD','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10398','949918486','Paulita','Andreacci','14848','2107411','4853265448','Dari','pandreaccib1@phoca.cz','pandreaccib1@google.pl','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf405','S49091','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10399','1057926383','Cherri','Awin','14949','4421494','2892813027','Catalan','cawinb2@arstechnica.com','cawinb2@w3.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf406','S53421A','1');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10400','1165934280','Rodrick','Hendron','15050','3687815','2024336021','Assamese','rhendronb3@liveinternet.ru','rhendronb3@bing.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf407','T3170','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10401','1273942177','Alfy','Apdell','10101','1337813','9902757268','Romanian','aapdellb4@icq.com','aapdellb4@surveymonkey.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf408','S21451S','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10402','1381950074','Mohandis','Creaser','10202','1374323','2038882080','Arabic','mcreaserb5@wordpress.org','mcreaserb5@oracle.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf409','S42402A','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10403','1489957971','Korney','MacAlister','10303','1832289','3241412033','Italian','kmacalisterb6@chron.com','kmacalisterb6@icio.us','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf410','S3643','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10404','1597965868','Michaelina','Bisterfeld','10404','9329947','3035669742','Montenegrin','mbisterfeldb7@nasa.gov','mbisterfeldb7@shareasale.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf411','S63237A','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10405','1705973765','Gill','Kinge','10505','5556903','8151239657','Marathi','gkingeb8@bloglovin.com','gkingeb8@princeton.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf412','V8031XA','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10406','1813981662','Fifi','Hammerson','10606','9361993','6625172411','Yiddish','fhammersonb9@virginia.edu','fhammersonb9@list-manage.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf413','C44500','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10407','1921989559','Vasily','Richt','10707','9010279','4611540594','Greek','vrichtba@eepurl.com','vrichtba@dedecms.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf414','Q79','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10408','2029997456','Hadria','Sheber','10808','7646475','4934910454','Swati','hsheberbb@marketwatch.com','hsheberbb@friendfeed.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf415','S93305A','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10409','2138005353','Aguie','Newart','10909','7943077','5261336578','Gujarati','anewartbc@blogspot.com','anewartbc@latimes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf416','S31114','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10410','2246013250','Carrol','Van Bruggen','11010','8781666','3429055390','Bislama','cvanbruggenbd@technorati.com','cvanbruggenbd@biblegateway.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf417','E09354','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10411','2354021147','Mariya','Najera','11111','6051188','2285614657','Northern Sotho','mnajerabe@wsj.com','mnajerabe@imgur.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf418','S85991','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10412','2462029044','Jennee','Thirst','11212','9897463','8573915877','Estonian','jthirstbf@github.com','jthirstbf@state.tx.us','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf419','W4903XA','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10413','2570036941','Esmeralda','Bodsworth','11313','3366486','3992871421','Japanese','ebodsworthbg@livejournal.com','ebodsworthbg@psu.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf420','S63036S','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10414','2678044838','Vilhelmina','Du Fray','11414','8684460','1304793268','Italian','vdufraybh@xinhuanet.com','vdufraybh@google.co.jp','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf421','K2920','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10415','2786052735','Wenda','Largan','11515','1449843','4167289033','Thai','wlarganbi@histats.com','wlarganbi@unesco.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf422','S21239','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10416','2894060632','Georgianne','Leupold','11616','7175253','9472163074','Moldovan','gleupoldbj@deviantart.com','gleupoldbj@princeton.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf423','S82021D','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10417','3002068529','Sterling','Dade','11717','6846779','6448305655','Gagauz','sdadebk@goodreads.com','sdadebk@springer.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf424','S72351Q','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10418','3110076426','Kaycee','Charlwood','11818','3465611','8604336992','Quechua','kcharlwoodbl@ca.gov','kcharlwoodbl@friendfeed.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf425','G40119','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10419','1076882973','Morgan','Craven','11919','7668320','7241405435','Haitian Creole','mcravenbm@bravesites.com','mcravenbm@hc360.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf426','S14132S','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10420','968875076','Ximenes','Farny','12020','3860414','4433163831','Italian','xfarnybn@scribd.com','xfarnybn@sciencedirect.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf427','O3491','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10421','860867179','Georgette','Corden','12121','5578280','5422065841','Kazakh','gcordenbo@eventbrite.com','gcordenbo@bigcartel.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf428','V872XXA','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10422','752859282','Klaus','Suett','12222','6535091','7342184065','Dzongkha','ksuettbp@stumbleupon.com','ksuettbp@mysql.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf429','T63632D','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10423','644851385','Derby','Walder','12323','5779410','2215848245','Georgian','dwalderbq@loc.gov','dwalderbq@nps.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf430','M2634','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10424','536843488','Rica','Clappison','12424','8487986','5752782553','Icelandic','rclappisonbr@cam.ac.uk','rclappisonbr@yolasite.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf431','S52614R','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10425','428835591','Christopher','Stegell','12525','8890422','4933784821','Indonesian','cstegellbs@vistaprint.com','cstegellbs@ow.ly','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf432','S60470D','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10426','320827694','Raven','Askwith','12626','4054761','6664582747','German','raskwithbt@hc360.com','raskwithbt@skype.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf433','W881XXA','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10427','212819797','Enrico','Lamers','12727','3487655','6303018922','Sotho','elamersbu@uol.com.br','elamersbu@europa.eu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf434','Q388','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10428','104811900','Merrilee','Sainsbury','12828','2057698','5598117705','Tsonga','msainsburybv@twitter.com','msainsburybv@istockphoto.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf435','Z622','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10429','3195997','Harper','Ebbins','12929','1427914','9311373594','Moldovan','hebbinsbw@squarespace.com','hebbinsbw@ifeng.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf436','S8781XA','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10430','111203894','Rozella','Shew','13030','4298694','4858328248','Georgian','rshewbx@jiathis.com','rshewbx@state.tx.us','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf437','S72453E','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10431','219211791','Neala','Klimkiewich','13131','4265117','3009757216','English','nklimkiewichby@angelfire.com','nklimkiewichby@ehow.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf438','S52321R','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10432','327219688','Thor','Wardlaw','13232','9589356','6726161671','Norwegian','twardlawbz@sina.com.cn','twardlawbz@ucoz.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf439','S46321D','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10433','435227585','Leanna','Farr','13333','7028434','2786489926','German','lfarrc0@sphinn.com','lfarrc0@house.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf440','O640XX9','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10434','543235482','Larine','Whittock','13434','7036452','1562821461','Kashmiri','lwhittockc1@symantec.com','lwhittockc1@nasa.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf441','G44309','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10435','651243379','Liesa','Lympany','13535','5720092','7122285810','Greek','llympanyc2@addthis.com','llympanyc2@ebay.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf442','D290','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10436','759251276','Derk','Rive','13636','2203749','4041787205','Catalan','drivec3@nymag.com','drivec3@nhs.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf443','W5981XD','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10437','867259173','Nettle','Demann','13737','9788114','1182358518','Amharic','ndemannc4@state.tx.us','ndemannc4@example.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf444','M1851','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10438','975267070','Lanna','Bartos','13838','8683977','6306269753','Kyrgyz','lbartosc5@narod.ru','lbartosc5@livejournal.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf445','S92244S','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10439','1083274967','Mar','Ranken','13939','4091223','9372695545','Czech','mrankenc6@edublogs.org','mrankenc6@rambler.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf446','M87819','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10440','1191282864','Jeremie','McGerr','14040','8228051','8679617580','Tswana','jmcgerrc7@dion.ne.jp','jmcgerrc7@thetimes.co.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf447','S82169G','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10441','1299290761','Olga','Bernardi','14141','5870480','7847866756','Georgian','obernardic8@prnewswire.com','obernardic8@zimbio.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf448','R932','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10442','1407298658','Junina','Colville','14242','7834128','1869133014','Tamil','jcolvillec9@hp.com','jcolvillec9@booking.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf449','S52522D','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10443','1515306555','Darbee','Mowat','14343','1454208','7857323297','Korean','dmowatca@ycombinator.com','dmowatca@unblog.fr','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf450','M1A161','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10444','1623314452','Berthe','Jancik','14444','9424031','8167652481','Catalan','bjancikcb@java.com','bjancikcb@reuters.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf451','V9229XA','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10445','1731322349','Bink','MacVaugh','14545','2843870','8002401347','Amharic','bmacvaughcc@ox.ac.uk','bmacvaughcc@arizona.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf452','M775','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10446','1839330246','Tiffani','Puddephatt','14646','6269911','3515805087','Korean','tpuddephattcd@list-manage.com','tpuddephattcd@nhs.uk','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf453','K560','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10447','1947338143','Reynold','Caulwell','14747','3571494','2747103616','Swedish','rcaulwellce@webmd.com','rcaulwellce@reverbnation.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf454','S82302','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10448','2055346040','Kerrill','Enticknap','14848','5430575','4749687010','Moldovan','kenticknapcf@ezinearticles.com','kenticknapcf@omniture.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf455','M4142','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10449','2163353937','Tuckie','Jepp','14949','8018109','7324452247','Georgian','tjeppcg@weebly.com','tjeppcg@sbwire.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf456','S92525G','2');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10450','2271361834','Elbertina','Boundey','15050','2478260','3753139988','Northern Sotho','eboundeych@imgur.com','eboundeych@yellowbook.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf457','T33812A','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10451','2379369731','Desmund','Gascone','10101','2505709','1063113199','Kyrgyz','dgasconeci@huffingtonpost.com','dgasconeci@lycos.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf458','S72131N','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10452','2487377628','Luz','Gisby','10202','1484986','7495129931','Hindi','lgisbycj@ezinearticles.com','lgisbycj@imdb.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf459','P0449','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10453','2595385525','Audi','Alloisi','10303','5048948','8262571013','Somali','aalloisick@pagesperso-orange.fr','aalloisick@seattletimes.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf460','S72342D','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10454','2703393422','Aurora','Kamall','10404','3026879','1252160354','Punjabi','akamallcl@networkadvertising.org','akamallcl@people.com.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf461','Z30433','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10455','2811401319','Robert','Brooksbie','10505','9969580','4686569030','Malayalam','rbrooksbiecm@wsj.com','rbrooksbiecm@dedecms.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf462','M71359','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10456','2919409216','Alvy','Dawidman','10606','2649000','2806285982','Thai','adawidmancn@intel.com','adawidmancn@jimdo.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf463','S839','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10457','3027417113','Rebecca','Strathdee','10707','2464775','2687830496','Japanese','rstrathdeeco@google.co.jp','rstrathdeeco@newyorker.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf464','T43603','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10458','3135425010','Akim','Challenor','10808','6511999','2889348530','Thai','achallenorcp@youtube.com','achallenorcp@reverbnation.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf465','S82162P','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10459','1051534389','Braden','Barradell','10909','3898458','3404888769','Amharic','bbarradellcq@phoca.cz','bbarradellcq@mit.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf466','S69','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10460','943526492','Clemmie','Tanton','11010','4610074','2441498161','Latvian','ctantoncr@geocities.jp','ctantoncr@washingtonpost.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf467','S52021N','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10461','835518595','Tasia','Shilstone','11111','9199157','9371971840','Assamese','tshilstonecs@usda.gov','tshilstonecs@google.cn','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf468','T69019','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10462','727510698','Halsey','Gash','11212','6474255','5347459197','Maltese','hgashct@bing.com','hgashct@cbsnews.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf469','J399','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10463','619502801','Pen','Keenan','11313','9547362','4228527001','Polish','pkeenancu@theatlantic.com','pkeenancu@ihg.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf470','L573','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10464','511494904','Minetta','Cassell','11414','1989661','5811263246','Polish','mcassellcv@paypal.com','mcassellcv@hexun.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf471','O3090','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10465','403487007','Cass','De Simone','11515','7463775','1796965596','Italian','cdesimonecw@surveymonkey.com','cdesimonecw@last.fm','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf472','S62318D','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10466','295479110','Dolph','Twist','11616','1340697','2633095545','Bengali','dtwistcx@oakley.com','dtwistcx@dropbox.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf473','S61358D','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10467','187471213','Pancho','Witling','11717','2937247','3583832302','Irish Gaelic','pwitlingcy@cbsnews.com','pwitlingcy@freewebs.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf474','Z8781','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10468','79463316','Binnie','Ranscomb','11818','7552890','9081537583','Latvian','branscombcz@upenn.edu','branscombcz@comsenz.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf475','S65111S','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10469','28544581','Leupold','Swinfon','11919','3889700','8807972427','Hiri Motu','lswinfond0@mit.edu','lswinfond0@google.es','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf476','S72034A','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10470','136552478','Kamillah','Teers','12020','6166722','5138095806','Lao','kteersd1@wunderground.com','kteersd1@wunderground.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf477','S92909P','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10471','244560375','Kalle','Eakens','12121','6022186','6325935614','Polish','keakensd2@chicagotribune.com','keakensd2@com.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf478','S99132K','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10472','352568272','Demeter','Mellmoth','12222','5051468','5994744741','Tajik','dmellmothd3@japanpost.jp','dmellmothd3@godaddy.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf479','H26049','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10473','460576169','Deane','Merrell','12323','8515135','6363707474','Pashto','dmerrelld4@webs.com','dmerrelld4@ovh.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf480','W16132','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10474','568584066','Manolo','Robel','12424','9406960','8386704777','Azeri','mrobeld5@phpbb.com','mrobeld5@cisco.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf481','W5659','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10475','676591963','Bastien','Yegoshin','12525','1656882','7466284507','Dhivehi','byegoshind6@bloomberg.com','byegoshind6@tripadvisor.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf482','S06363D','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10476','784599860','Sadie','Fullick','12626','7583774','7333098983','Nepali','sfullickd7@jiathis.com','sfullickd7@wikimedia.org','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf483','Y9343','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10477','892607757','Sarette','Thorndycraft','12727','4988552','8651470231','Italian','sthorndycraftd8@theglobeandmail.com','sthorndycraftd8@virginia.edu','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf484','S340','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10478','1000615654','Fanya','Marnane','12828','7779281','8916533351','Icelandic','fmarnaned9@surveymonkey.com','fmarnaned9@dagondesign.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf485','T50Z95','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10479','1108623551','Penelope','Ibbotson','12929','8680275','9018809086','Irish Gaelic','pibbotsonda@sitemeter.com','pibbotsonda@cdc.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf486','S91131D','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10480','1216631448','Faunie','Freshwater','13030','4688030','4406529996','Tajik','ffreshwaterdb@state.gov','ffreshwaterdb@spotify.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf487','B960','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10481','1324639345','Rriocard','Prowting','13131','4447976','1448325765','Tamil','rprowtingdc@huffingtonpost.com','rprowtingdc@ifeng.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf488','E1301','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10482','1432647242','Alysa','Upcraft','13232','4897757','6106870940','Burmese','aupcraftdd@amazon.de','aupcraftdd@wp.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf489','S2780','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10483','1540655139','Shandy','Pietasch','13333','5059458','6824994794','English','spietaschde@imgur.com','spietaschde@engadget.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf490','S92345','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10484','1648663036','Christyna','Hewlings','13434','9214083','8459738393','Assamese','chewlingsdf@prlog.org','chewlingsdf@army.mil','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf491','S31153','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10485','1756670933','Lib','Wootton','13535','7516163','4563767097','Mongolian','lwoottondg@spotify.com','lwoottondg@twitter.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf492','S6732','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10486','1864678830','Lita','Lankford','13636','7027227','3031467457','Lao','llankforddh@domainmarket.com','llankforddh@disqus.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf493','S63635S','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10487','1972686727','Mariana','Gethouse','13737','9244470','8366334538','English','mgethousedi@vistaprint.com','mgethousedi@acquirethisname.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf494','S41022S','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10488','2080694624','Koenraad','Odams','13838','1617536','3984446090','Malagasy','kodamsdj@theguardian.com','kodamsdj@jiathis.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf495','G44221','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10489','2188702521','Natassia','Kingaby','13939','6724045','2159121954','Kashmiri','nkingabydk@ifeng.com','nkingabydk@cbslocal.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf496','S1010XS','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10490','2296710418','Oren','Spittal','14040','5429431','8584621677','Bengali','ospittaldl@soup.io','ospittaldl@elpais.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf497','S82123F','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10491','2404718315','Ida','Easum','14141','5543671','9614622859','Telugu','ieasumdm@biglobe.ne.jp','ieasumdm@godaddy.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf498','O092','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10492','2512726212','Tamarah','Cauthra','14242','4181214','3892271121','Thai','tcauthradn@bloglines.com','tcauthradn@mac.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf499','X001XXA','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10493','2620734109','Daffie','Sinderson','14343','3093238','1023937802','French','dsindersondo@is.gd','dsindersondo@chron.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf500','Z204','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10494','2728742006','Pryce','Beddall','14444','9340010','2446650611','Kazakh','pbeddalldp@senate.gov','pbeddalldp@shutterfly.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf501','L101','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10495','2836749903','Theressa','Valintine','14545','8327258','1092750723','Bengali','tvalintinedq@wsj.com','tvalintinedq@businessweek.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf502','V679XXD','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10496','2944757800','Else','Stratton','14646','8240694','8705045022','Indonesian','estrattondr@npr.org','estrattondr@cbc.ca','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf503','S9490','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10497','3052765697','Enrika','Gilding','14747','7776189','7252232181','Somali','egildingds@umich.edu','egildingds@epa.gov','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf504','S8291XP','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10498','3160773594','Gage','Bras','14848','7823581','2817211286','West Frisian','gbrasdt@infoseek.co.jp','gbrasdt@bloomberg.com','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf505','S5801','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10499','1026185805','Minna','Gozard','14949','4259836','6693417970','Khmer','mgozarddu@dell.com','mgozarddu@seesaa.net','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf506','S1192XS','3');
Insert into USUARIOS (ID,NUMERO_DOCUMENTO,NOMBRES,APELLIDOS,ID_CIUDAD,TELEFONO,CELULAR,IDIOMA,CORREO_UNO,CORREO_DOS,FOTOGRAFIA,CODIGO_INVITACION,ID_TIPO_USUARIO) values ('10500','918177908','Margie','Smithson','15050','3273245','2592922972','Armenian','msmithsondv@oaic.gov.au','msmithsondv@liveinternet.ru','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf507','Z9664','3');


-----------------------------Insercción de datos tabla Detalle_usuario_conductor------------------------------------------------------------
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('200','10001','100',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('201','10002','101',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('202','10003','102',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('203','10004','103',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('204','10005','104',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('205','10006','105',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('206','10007','106',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('207','10008','107',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('208','10009','108',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('209','10010','109',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('210','10011','110',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('211','10012','111',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('212','10013','112',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('213','10014','113',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('214','10015','114',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('215','10016','115',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('216','10017','116',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('217','10018','117',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('218','10019','118',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('219','10020','119',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('220','10021','120',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('221','10022','121',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('222','10023','122',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('223','10024','123',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('224','10025','124',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('225','10026','125',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('226','10027','126',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('227','10028','127',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('228','10029','128',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('229','10030','129',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('230','10031','130',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('231','10032','131',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('232','10033','132',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('233','10034','133',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('234','10035','134',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('235','10036','135',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('236','10037','136',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('237','10038','137',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('238','10039','138',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('239','10040','139',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('240','10041','140',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('241','10042','141',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('242','10043','142',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('243','10044','143',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('244','10045','144',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('245','10046','145',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('246','10047','146',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('247','10048','147',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('248','10049','148',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('249','10050','149',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('250','10051','150',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('251','10052','151',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('252','10053','152',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('253','10054','153',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('254','10055','154',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('255','10056','155',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('256','10057','156',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('257','10058','157',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('258','10059','158',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('259','10060','159',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('260','10061','160',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('261','10062','161',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('262','10063','162',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('263','10064','163',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('264','10065','164',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('265','10066','165',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('266','10067','166',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('267','10068','167',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('268','10069','168',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('269','10070','169',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('270','10071','170',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('271','10072','171',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('272','10073','172',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('273','10074','173',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('274','10075','174',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('275','10076','175',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('276','10077','176',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('277','10078','177',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('278','10079','178',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('279','10080','179',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('280','10081','180',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('281','10082','181',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('282','10083','182',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('283','10084','183',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('284','10085','184',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('285','10086','185',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('286','10087','186',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('287','10088','187',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('288','10089','188',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('289','10090','189',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('290','10091','190',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('291','10092','191',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('292','10093','192',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('293','10094','193',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('294','10095','194',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('295','10096','195',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('296','10097','196',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('297','10098','197',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('298','10099','198',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('299','10100','199',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('300','10101','200',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('301','10102','201',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('302','10103','202',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('303','10104','203',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('304','10105','204',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('305','10106','205',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('306','10107','206',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('307','10108','207',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('308','10109','208',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('309','10110','209',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('310','10111','210',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('311','10112','211',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('312','10113','212',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('313','10114','213',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('314','10115','214',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('315','10116','215',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('316','10117','216',null);
Insert into DETALLES_USUARIOS_CONDUCTORES (ID,ID_USUARIO,ID_AUTOMOVIL,NUMERO_LICENCIA) values ('317','10118','217',null);


-----------------------------Insercción de datos tabla Tarjetas_credito------------------------------------------------------------

Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30001','2439750158','Bancolombia',to_date('25/08/18','DD/MM/RR'),'576928','10001','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30002','9050615511','Bancolombia',to_date('25/08/18','DD/MM/RR'),'972348','10002','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30003','8683983528','Bancolombia',to_date('26/04/18','DD/MM/RR'),'643667','10003','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30004','6669054335','Bancolombia',to_date('26/01/18','DD/MM/RR'),'645517','10004','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30005','7532484238','Bancolombia',to_date('09/03/18','DD/MM/RR'),'728802','10005','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30006','6050156417','Bancolombia',to_date('27/12/17','DD/MM/RR'),'977530','10006','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30007','4375423803','Bancolombia',to_date('10/05/18','DD/MM/RR'),'327267','10007','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30008','2709191644','Bancolombia',to_date('09/02/18','DD/MM/RR'),'883639','10008','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30009','7477285852','Bancolombia',to_date('13/06/18','DD/MM/RR'),'192036','10009','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30010','1688082204','Bancolombia',to_date('13/08/18','DD/MM/RR'),'456816','10010','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30011','9367236522','Bancolombia',to_date('29/03/18','DD/MM/RR'),'807846','10011','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30012','7353219637','Bancolombia',to_date('20/09/18','DD/MM/RR'),'459823','10012','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30013','4086028034','Bancolombia',to_date('27/08/18','DD/MM/RR'),'857855','10013','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30014','630195366','Bancolombia',to_date('26/02/18','DD/MM/RR'),'337856','10014','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30015','6074701237','Bancolombia',to_date('01/10/17','DD/MM/RR'),'583973','10015','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30016','4593722268','Bancolombia',to_date('24/06/18','DD/MM/RR'),'855359','10016','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30017','1510018743','Bancolombia',to_date('30/03/18','DD/MM/RR'),'918002','10017','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30018','6395104535','Bancolombia',to_date('04/02/18','DD/MM/RR'),'181472','10018','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30019','4565330644','Bancolombia',to_date('01/08/18','DD/MM/RR'),'708682','10019','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30020','5421134997','Bancolombia',to_date('30/07/18','DD/MM/RR'),'399992','10020','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30021','7887682738','Bancolombia',to_date('10/05/18','DD/MM/RR'),'980239','10021','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30022','483883948','Bancolombia',to_date('25/12/17','DD/MM/RR'),'559540','10022','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30023','8930526152','Bancolombia',to_date('29/06/18','DD/MM/RR'),'565339','10023','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30024','2808506465','Bancolombia',to_date('24/11/17','DD/MM/RR'),'563617','10024','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30025','2351277449','Bancolombia',to_date('04/02/18','DD/MM/RR'),'614826','10025','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30026','2197601784','Bancolombia',to_date('03/05/18','DD/MM/RR'),'607328','10026','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30027','835442403','Bancolombia',to_date('24/11/17','DD/MM/RR'),'476851','10027','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30028','1862416125','Bancolombia',to_date('04/07/18','DD/MM/RR'),'611126','10028','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30029','5942361312','Bancolombia',to_date('15/01/18','DD/MM/RR'),'951902','10029','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30030','6783978052','Bancolombia',to_date('05/12/17','DD/MM/RR'),'144118','10030','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30031','1154159507','Bancolombia',to_date('08/08/18','DD/MM/RR'),'113843','10031','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30032','9375018164','Bancolombia',to_date('30/01/18','DD/MM/RR'),'535050','10032','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30033','835517500','Bancolombia',to_date('12/05/18','DD/MM/RR'),'185090','10033','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30034','5876478180','Bancolombia',to_date('21/10/17','DD/MM/RR'),'223963','10034','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30035','7200079944','Bancolombia',to_date('11/06/18','DD/MM/RR'),'150893','10035','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30036','5046269783','Bancolombia',to_date('30/01/18','DD/MM/RR'),'755062','10036','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30037','447072005','Bancolombia',to_date('21/09/18','DD/MM/RR'),'343064','10037','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30038','8005384130','Bancolombia',to_date('01/03/18','DD/MM/RR'),'234406','10038','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30039','5961994090','Bancolombia',to_date('26/07/18','DD/MM/RR'),'736916','10039','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30040','5338356228','Bancolombia',to_date('25/06/18','DD/MM/RR'),'707347','10040','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30041','7079736021','Bancolombia',to_date('29/09/17','DD/MM/RR'),'497050','10041','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30042','901883085','Bancolombia',to_date('27/02/18','DD/MM/RR'),'575311','10042','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30043','6597596749','Bancolombia',to_date('12/10/17','DD/MM/RR'),'562725','10043','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30044','3432063075','Bancolombia',to_date('10/07/18','DD/MM/RR'),'127201','10044','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30045','5007645664','Bancolombia',to_date('13/11/17','DD/MM/RR'),'277521','10045','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30046','9149974297','Bancolombia',to_date('18/09/18','DD/MM/RR'),'661697','10046','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30047','7055134129','Bancolombia',to_date('04/12/17','DD/MM/RR'),'367701','10047','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30048','3375114303','Bancolombia',to_date('25/05/18','DD/MM/RR'),'882202','10048','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30049','7843094369','Bancolombia',to_date('07/01/18','DD/MM/RR'),'901211','10049','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30050','4251366441','Bancolombia',to_date('02/04/18','DD/MM/RR'),'715321','10050','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30051','2811219277','Bancolombia',to_date('08/06/18','DD/MM/RR'),'379939','10051','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30052','4446015095','Bancolombia',to_date('01/01/18','DD/MM/RR'),'291527','10052','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30053','4808735377','Bancolombia',to_date('15/06/18','DD/MM/RR'),'354669','10053','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30054','3838090306','Bancolombia',to_date('28/11/17','DD/MM/RR'),'289266','10054','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30055','1966105797','Bancolombia',to_date('03/03/18','DD/MM/RR'),'151859','10055','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30056','3682508805','Bancolombia',to_date('30/12/17','DD/MM/RR'),'347144','10056','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30057','3960936265','Bancolombia',to_date('09/05/18','DD/MM/RR'),'724816','10057','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30058','6313660463','Bancolombia',to_date('05/08/18','DD/MM/RR'),'823900','10058','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30059','250514532','Bancolombia',to_date('27/04/18','DD/MM/RR'),'345710','10059','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30060','7042035712','Bancolombia',to_date('04/05/18','DD/MM/RR'),'797063','10060','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30061','150514832','Bancolombia',to_date('25/01/18','DD/MM/RR'),'871448','10061','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30062','9516944965','Bancolombia',to_date('15/12/17','DD/MM/RR'),'628630','10062','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30063','3861982536','Bancolombia',to_date('09/05/18','DD/MM/RR'),'627175','10063','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30064','5957583812','Bancolombia',to_date('02/03/18','DD/MM/RR'),'565760','10064','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30065','3407278659','Bancolombia',to_date('02/02/18','DD/MM/RR'),'392192','10065','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30066','4249406377','Bancolombia',to_date('14/01/18','DD/MM/RR'),'639326','10066','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30067','8655279706','Bancolombia',to_date('28/03/18','DD/MM/RR'),'948290','10067','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30068','4450606299','Bancolombia',to_date('10/12/17','DD/MM/RR'),'425495','10068','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30069','7480472358','Bancolombia',to_date('02/09/18','DD/MM/RR'),'431832','10069','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30070','74936107','Bancolombia',to_date('16/11/17','DD/MM/RR'),'373244','10070','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30071','3817179804','Bancolombia',to_date('11/08/18','DD/MM/RR'),'305229','10071','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30072','2202683291','Bancolombia',to_date('04/05/18','DD/MM/RR'),'668998','10072','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30073','4198815070','Bancolombia',to_date('08/09/18','DD/MM/RR'),'860037','10073','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30074','6545034278','Bancolombia',to_date('10/10/17','DD/MM/RR'),'525142','10074','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30075','1385664835','Bancolombia',to_date('09/11/17','DD/MM/RR'),'969007','10075','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30076','2232392392','Bancolombia',to_date('12/08/18','DD/MM/RR'),'769468','10076','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30077','6749126677','Bancolombia',to_date('22/04/18','DD/MM/RR'),'394377','10077','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30078','4373349371','Bancolombia',to_date('10/11/17','DD/MM/RR'),'953302','10078','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30079','9532079998','Bancolombia',to_date('05/12/17','DD/MM/RR'),'318449','10079','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30080','2579191968','Bancolombia',to_date('29/03/18','DD/MM/RR'),'217607','10080','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30081','389088498','Bancolombia',to_date('02/11/17','DD/MM/RR'),'955149','10081','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30082','1183793456','Bancolombia',to_date('02/08/18','DD/MM/RR'),'747529','10082','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30083','4941431405','Bancolombia',to_date('03/03/18','DD/MM/RR'),'506052','10083','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30084','541864149','Bancolombia',to_date('01/03/18','DD/MM/RR'),'296520','10084','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30085','2743126248','Bancolombia',to_date('26/12/17','DD/MM/RR'),'742475','10085','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30086','1214943713','Bancolombia',to_date('29/12/17','DD/MM/RR'),'969952','10086','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30087','7446216611','Bancolombia',to_date('29/01/18','DD/MM/RR'),'146528','10087','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30088','4355717933','Bancolombia',to_date('12/03/18','DD/MM/RR'),'604899','10088','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30089','1607878216','Bancolombia',to_date('27/10/17','DD/MM/RR'),'611355','10089','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30090','9676076295','Bancolombia',to_date('07/10/17','DD/MM/RR'),'149842','10090','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30091','4163711252','Bancolombia',to_date('07/03/18','DD/MM/RR'),'215173','10091','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30092','2662106948','Bancolombia',to_date('16/11/17','DD/MM/RR'),'477569','10092','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30093','6293284348','Bancolombia',to_date('24/04/18','DD/MM/RR'),'676051','10093','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30094','8378656977','Bancolombia',to_date('02/12/17','DD/MM/RR'),'327039','10094','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30095','4028900336','Bancolombia',to_date('31/03/18','DD/MM/RR'),'644670','10095','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30096','3727309644','Bancolombia',to_date('16/03/18','DD/MM/RR'),'477405','10096','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30097','3127737300','Bancolombia',to_date('28/12/17','DD/MM/RR'),'389136','10097','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30098','507119266','Bancolombia',to_date('28/06/18','DD/MM/RR'),'372236','10098','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30099','8693395688','Bancolombia',to_date('22/09/18','DD/MM/RR'),'273901','10099','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30100','5854926792','Bancolombia',to_date('10/01/18','DD/MM/RR'),'380292','10100','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30101','2180187807','BBVA',to_date('02/03/18','DD/MM/RR'),'757898','10101','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30102','9387594432','BBVA',to_date('15/01/18','DD/MM/RR'),'888811','10102','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30103','1425391265','BBVA',to_date('16/08/18','DD/MM/RR'),'588027','10103','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30104','2786776368','BBVA',to_date('24/11/17','DD/MM/RR'),'608212','10104','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30105','8376215132','BBVA',to_date('22/12/17','DD/MM/RR'),'887964','10105','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30106','7035954198','BBVA',to_date('26/12/17','DD/MM/RR'),'598090','10106','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30107','6477207109','BBVA',to_date('26/05/18','DD/MM/RR'),'290844','10107','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30108','467035458','BBVA',to_date('01/12/17','DD/MM/RR'),'573827','10108','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30109','4177780235','BBVA',to_date('30/11/17','DD/MM/RR'),'991952','10109','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30110','8328191504','BBVA',to_date('07/02/18','DD/MM/RR'),'109274','10110','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30111','1413531660','BBVA',to_date('17/10/17','DD/MM/RR'),'912907','10111','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30112','6490874210','BBVA',to_date('18/09/18','DD/MM/RR'),'729513','10112','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30113','363015205','BBVA',to_date('15/09/18','DD/MM/RR'),'590130','10113','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30114','1396580492','BBVA',to_date('27/04/18','DD/MM/RR'),'384750','10114','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30115','1242073086','BBVA',to_date('13/11/17','DD/MM/RR'),'880042','10115','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30116','4955247911','BBVA',to_date('25/01/18','DD/MM/RR'),'309886','10116','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30117','6825203592','BBVA',to_date('31/12/17','DD/MM/RR'),'554268','10117','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30118','1782277145','BBVA',to_date('06/03/18','DD/MM/RR'),'877351','10118','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30119','6378947791','BBVA',to_date('04/12/17','DD/MM/RR'),'451845','10119','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30120','5640898917','BBVA',to_date('25/04/18','DD/MM/RR'),'408783','10120','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30121','7726072776','BBVA',to_date('28/07/18','DD/MM/RR'),'784905','10121','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30122','7292464920','BBVA',to_date('20/10/17','DD/MM/RR'),'234870','10122','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30123','1824645325','BBVA',to_date('05/11/17','DD/MM/RR'),'211055','10123','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30124','7640088941','BBVA',to_date('09/09/18','DD/MM/RR'),'381287','10124','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30125','5639955864','BBVA',to_date('01/05/18','DD/MM/RR'),'632145','10125','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30126','9063363907','BBVA',to_date('20/04/18','DD/MM/RR'),'165841','10126','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30127','4741295729','BBVA',to_date('09/04/18','DD/MM/RR'),'788377','10127','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30128','4585054944','BBVA',to_date('05/08/18','DD/MM/RR'),'280553','10128','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30129','1151788937','BBVA',to_date('25/04/18','DD/MM/RR'),'413423','10129','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30130','2052313702','BBVA',to_date('21/06/18','DD/MM/RR'),'938894','10130','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30131','9833710581','BBVA',to_date('01/04/18','DD/MM/RR'),'594484','10131','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30132','1455152188','BBVA',to_date('07/07/18','DD/MM/RR'),'997707','10132','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30133','8351416878','BBVA',to_date('23/05/18','DD/MM/RR'),'753571','10133','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30134','120593025','BBVA',to_date('16/12/17','DD/MM/RR'),'336187','10134','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30135','4974475339','BBVA',to_date('20/06/18','DD/MM/RR'),'485722','10135','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30136','2867482801','BBVA',to_date('15/10/17','DD/MM/RR'),'743004','10136','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30137','3670279474','BBVA',to_date('19/02/18','DD/MM/RR'),'671134','10137','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30138','6840360369','BBVA',to_date('09/04/18','DD/MM/RR'),'230050','10138','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30139','9503447046','BBVA',to_date('07/10/17','DD/MM/RR'),'245478','10139','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30140','4174773270','BBVA',to_date('16/09/18','DD/MM/RR'),'488671','10140','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30141','1655988646','BBVA',to_date('05/03/18','DD/MM/RR'),'579125','10141','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30142','6680603145','BBVA',to_date('16/02/18','DD/MM/RR'),'701503','10142','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30143','5621795601','BBVA',to_date('17/07/18','DD/MM/RR'),'152281','10143','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30144','3719329828','BBVA',to_date('20/10/17','DD/MM/RR'),'935363','10144','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30145','9653943553','BBVA',to_date('18/12/17','DD/MM/RR'),'761915','10145','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30146','8367299884','BBVA',to_date('01/01/18','DD/MM/RR'),'479354','10146','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30147','4817331860','BBVA',to_date('28/11/17','DD/MM/RR'),'960499','10147','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30148','4418031391','BBVA',to_date('21/07/18','DD/MM/RR'),'535539','10148','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30149','2867763371','BBVA',to_date('01/10/17','DD/MM/RR'),'531432','10149','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30150','1522916431','BBVA',to_date('25/12/17','DD/MM/RR'),'212642','10150','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30151','6607794130','BBVA',to_date('19/05/18','DD/MM/RR'),'401420','10151','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30152','2322983411','BBVA',to_date('23/05/18','DD/MM/RR'),'943675','10152','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30153','3528135948','BBVA',to_date('06/08/18','DD/MM/RR'),'176550','10153','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30154','4974680323','BBVA',to_date('01/06/18','DD/MM/RR'),'771179','10154','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30155','9945140302','BBVA',to_date('19/11/17','DD/MM/RR'),'278158','10155','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30156','1909670391','BBVA',to_date('12/02/18','DD/MM/RR'),'145569','10156','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30157','3355387673','BBVA',to_date('04/09/18','DD/MM/RR'),'291036','10157','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30158','1847078788','BBVA',to_date('17/06/18','DD/MM/RR'),'970160','10158','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30159','2175689204','BBVA',to_date('02/11/17','DD/MM/RR'),'556697','10159','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30160','6604934721','BBVA',to_date('14/06/18','DD/MM/RR'),'296202','10160','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30161','8842802875','BBVA',to_date('29/05/18','DD/MM/RR'),'508782','10161','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30162','8429662219','BBVA',to_date('08/02/18','DD/MM/RR'),'172183','10162','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30163','1102812749','BBVA',to_date('26/05/18','DD/MM/RR'),'780447','10163','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30164','4899743874','BBVA',to_date('26/01/18','DD/MM/RR'),'588108','10164','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30165','4226487850','BBVA',to_date('01/12/17','DD/MM/RR'),'190310','10165','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30166','6185248670','BBVA',to_date('20/03/18','DD/MM/RR'),'788076','10166','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30167','8520998224','BBVA',to_date('21/05/18','DD/MM/RR'),'100530','10167','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30168','1563484439','BBVA',to_date('23/08/18','DD/MM/RR'),'524148','10168','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30169','4004023602','BBVA',to_date('18/07/18','DD/MM/RR'),'819524','10169','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30170','2231928957','BBVA',to_date('28/02/18','DD/MM/RR'),'204254','10170','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30171','5694901304','BBVA',to_date('19/05/18','DD/MM/RR'),'697653','10171','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30172','9450291411','BBVA',to_date('14/08/18','DD/MM/RR'),'190716','10172','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30173','9664136352','BBVA',to_date('13/09/18','DD/MM/RR'),'165576','10173','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30174','7018260116','BBVA',to_date('18/09/18','DD/MM/RR'),'146081','10174','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30175','4920368119','BBVA',to_date('24/05/18','DD/MM/RR'),'801919','10175','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30176','6402332755','BBVA',to_date('10/04/18','DD/MM/RR'),'561801','10176','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30177','5385019089','BBVA',to_date('10/05/18','DD/MM/RR'),'714410','10177','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30178','76671674','BBVA',to_date('21/04/18','DD/MM/RR'),'122955','10178','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30179','345329341','BBVA',to_date('07/09/18','DD/MM/RR'),'169023','10179','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30180','5216921303','BBVA',to_date('15/12/17','DD/MM/RR'),'274528','10180','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30181','2118879334','BBVA',to_date('18/01/18','DD/MM/RR'),'823891','10181','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30182','3645312714','BBVA',to_date('12/08/18','DD/MM/RR'),'669135','10182','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30183','7252855139','BBVA',to_date('14/04/18','DD/MM/RR'),'163420','10183','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30184','8102078219','BBVA',to_date('29/11/17','DD/MM/RR'),'987611','10184','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30185','9661206570','BBVA',to_date('09/01/18','DD/MM/RR'),'270855','10185','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30186','2492838102','BBVA',to_date('11/12/17','DD/MM/RR'),'352508','10186','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30187','9553139132','BBVA',to_date('05/07/18','DD/MM/RR'),'641087','10187','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30188','7737644865','BBVA',to_date('26/07/18','DD/MM/RR'),'404901','10188','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30189','8037743543','BBVA',to_date('27/04/18','DD/MM/RR'),'170204','10189','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30190','8189112619','BBVA',to_date('31/05/18','DD/MM/RR'),'439461','10190','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30191','6789274235','BBVA',to_date('26/05/18','DD/MM/RR'),'978883','10191','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30192','2482523990','BBVA',to_date('22/01/18','DD/MM/RR'),'174257','10192','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30193','3933616581','BBVA',to_date('02/03/18','DD/MM/RR'),'738521','10193','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30194','5354559774','BBVA',to_date('30/03/18','DD/MM/RR'),'616990','10194','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30195','9712085724','BBVA',to_date('01/12/17','DD/MM/RR'),'612241','10195','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30196','9239462740','BBVA',to_date('16/10/17','DD/MM/RR'),'849997','10196','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30197','7924273689','BBVA',to_date('11/09/18','DD/MM/RR'),'325423','10197','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30198','2398545164','BBVA',to_date('27/09/17','DD/MM/RR'),'772272','10198','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30199','5850112855','BBVA',to_date('04/01/18','DD/MM/RR'),'894124','10199','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30200','916548430','BBVA',to_date('22/01/18','DD/MM/RR'),'996582','10200','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30201','6749819222','Citibank',to_date('18/04/18','DD/MM/RR'),'605366','10201','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30202','7079786649','Citibank',to_date('30/05/18','DD/MM/RR'),'484419','10202','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30203','1503247104','Citibank',to_date('18/11/17','DD/MM/RR'),'623011','10203','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30204','5275109962','Citibank',to_date('20/10/17','DD/MM/RR'),'578300','10204','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30205','7642668244','Citibank',to_date('16/06/18','DD/MM/RR'),'618495','10205','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30206','2272114369','Citibank',to_date('05/09/18','DD/MM/RR'),'357815','10206','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30207','7151111827','Citibank',to_date('18/02/18','DD/MM/RR'),'873493','10207','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30208','7305418315','Citibank',to_date('13/04/18','DD/MM/RR'),'232670','10208','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30209','2331931380','Citibank',to_date('24/10/17','DD/MM/RR'),'449859','10209','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30210','1602570272','Citibank',to_date('09/03/18','DD/MM/RR'),'110752','10210','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30211','7158580725','Citibank',to_date('15/12/17','DD/MM/RR'),'527370','10211','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30212','6337805755','Citibank',to_date('22/07/18','DD/MM/RR'),'153858','10212','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30213','5140032503','Citibank',to_date('05/12/17','DD/MM/RR'),'730180','10213','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30214','8411679837','Citibank',to_date('11/10/17','DD/MM/RR'),'161133','10214','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30215','7051572865','Citibank',to_date('22/04/18','DD/MM/RR'),'180930','10215','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30216','8591424050','Citibank',to_date('20/11/17','DD/MM/RR'),'445774','10216','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30217','165846585','Citibank',to_date('30/01/18','DD/MM/RR'),'853463','10217','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30218','784055637','Citibank',to_date('14/06/18','DD/MM/RR'),'379665','10218','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30219','7610420212','Citibank',to_date('18/10/17','DD/MM/RR'),'441538','10219','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30220','367973960','Citibank',to_date('28/12/17','DD/MM/RR'),'565467','10220','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30221','371126606','Citibank',to_date('10/12/17','DD/MM/RR'),'344825','10221','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30222','5937599101','Citibank',to_date('02/11/17','DD/MM/RR'),'417392','10222','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30223','286398834','Citibank',to_date('20/02/18','DD/MM/RR'),'175978','10223','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30224','360322530','Citibank',to_date('19/11/17','DD/MM/RR'),'285916','10224','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30225','9490642983','Citibank',to_date('07/10/17','DD/MM/RR'),'187398','10225','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30226','4264824435','Citibank',to_date('28/07/18','DD/MM/RR'),'929603','10226','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30227','4714834983','Citibank',to_date('31/12/17','DD/MM/RR'),'297659','10227','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30228','1898343020','Citibank',to_date('14/08/18','DD/MM/RR'),'927376','10228','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30229','821232193','Citibank',to_date('24/01/18','DD/MM/RR'),'251266','10229','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30230','9462951241','Citibank',to_date('29/03/18','DD/MM/RR'),'522497','10230','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30231','2606915712','Citibank',to_date('05/07/18','DD/MM/RR'),'856121','10231','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30232','5725219410','Citibank',to_date('09/07/18','DD/MM/RR'),'200091','10232','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30233','8087441710','Citibank',to_date('25/10/17','DD/MM/RR'),'524852','10233','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30234','940514575','Citibank',to_date('19/04/18','DD/MM/RR'),'358248','10234','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30235','950134015','Citibank',to_date('18/02/18','DD/MM/RR'),'171298','10235','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30236','410479071','Citibank',to_date('24/07/18','DD/MM/RR'),'706480','10236','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30237','409977306','Citibank',to_date('17/02/18','DD/MM/RR'),'496758','10237','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30238','4864750033','Citibank',to_date('11/04/18','DD/MM/RR'),'435850','10238','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30239','4911566477','Citibank',to_date('23/06/18','DD/MM/RR'),'792891','10239','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30240','7128818499','Citibank',to_date('27/10/17','DD/MM/RR'),'928150','10240','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30241','4478811466','Citibank',to_date('18/03/18','DD/MM/RR'),'783705','10241','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30242','156797631','Citibank',to_date('02/06/18','DD/MM/RR'),'837439','10242','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30243','3291681339','Citibank',to_date('10/12/17','DD/MM/RR'),'587963','10243','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30244','8855720511','Citibank',to_date('29/09/17','DD/MM/RR'),'378972','10244','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30245','8387598070','Citibank',to_date('13/02/18','DD/MM/RR'),'349538','10245','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30246','6852024903','Citibank',to_date('06/08/18','DD/MM/RR'),'804414','10246','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30247','1540892255','Citibank',to_date('03/03/18','DD/MM/RR'),'562988','10247','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30248','5191980921','Citibank',to_date('07/05/18','DD/MM/RR'),'814466','10248','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30249','9346287160','Citibank',to_date('25/06/18','DD/MM/RR'),'965406','10249','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30250','1322304246','Citibank',to_date('03/10/17','DD/MM/RR'),'911730','10250','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30251','9808618715','Citibank',to_date('15/06/18','DD/MM/RR'),'816409','10251','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30252','8396849765','Citibank',to_date('02/05/18','DD/MM/RR'),'505414','10252','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30253','1521773645','Citibank',to_date('27/08/18','DD/MM/RR'),'809532','10253','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30254','6009979773','Citibank',to_date('10/04/18','DD/MM/RR'),'919956','10254','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30255','685390780','Citibank',to_date('25/08/18','DD/MM/RR'),'991179','10255','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30256','7865594437','Citibank',to_date('01/02/18','DD/MM/RR'),'745065','10256','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30257','5895407110','Citibank',to_date('02/12/17','DD/MM/RR'),'443471','10257','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30258','6809365893','Citibank',to_date('01/12/17','DD/MM/RR'),'945241','10258','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30259','5516174643','Citibank',to_date('24/01/18','DD/MM/RR'),'995272','10259','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30260','7065491692','Citibank',to_date('04/04/18','DD/MM/RR'),'490360','10260','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30261','7835752247','Citibank',to_date('07/03/18','DD/MM/RR'),'714468','10261','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30262','3508911160','Citibank',to_date('20/03/18','DD/MM/RR'),'927642','10262','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30263','2151064689','Citibank',to_date('23/05/18','DD/MM/RR'),'662583','10263','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30264','1974540367','Citibank',to_date('16/10/17','DD/MM/RR'),'183516','10264','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30265','5188021528','Citibank',to_date('27/12/17','DD/MM/RR'),'566755','10265','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30266','5663414223','Citibank',to_date('19/12/17','DD/MM/RR'),'882245','10266','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30267','6185325152','Citibank',to_date('27/08/18','DD/MM/RR'),'802052','10267','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30268','6716763341','Citibank',to_date('18/01/18','DD/MM/RR'),'927709','10268','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30269','4765941906','Citibank',to_date('28/08/18','DD/MM/RR'),'850415','10269','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30270','7579445069','Citibank',to_date('11/11/17','DD/MM/RR'),'329462','10270','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30271','9025583857','Citibank',to_date('07/07/18','DD/MM/RR'),'661704','10271','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30272','9279788957','Citibank',to_date('25/03/18','DD/MM/RR'),'478108','10272','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30273','1309026653','Citibank',to_date('18/01/18','DD/MM/RR'),'720067','10273','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30274','4390300687','Citibank',to_date('19/11/17','DD/MM/RR'),'931370','10274','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30275','3063787779','Citibank',to_date('14/04/18','DD/MM/RR'),'811782','10275','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30276','3226685678','Citibank',to_date('08/02/18','DD/MM/RR'),'620386','10276','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30277','5988419917','Citibank',to_date('30/03/18','DD/MM/RR'),'452025','10277','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30278','5180320526','Citibank',to_date('04/01/18','DD/MM/RR'),'647906','10278','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30279','9802017124','Citibank',to_date('19/04/18','DD/MM/RR'),'217185','10279','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30280','9745299987','Citibank',to_date('05/09/18','DD/MM/RR'),'704895','10280','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30281','5016572410','Citibank',to_date('10/08/18','DD/MM/RR'),'387061','10281','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30282','7105795352','Citibank',to_date('27/07/18','DD/MM/RR'),'242794','10282','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30283','6872716142','Citibank',to_date('03/08/18','DD/MM/RR'),'331045','10283','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30284','9589920594','Citibank',to_date('24/04/18','DD/MM/RR'),'961106','10284','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30285','4255346437','Citibank',to_date('20/10/17','DD/MM/RR'),'814769','10285','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30286','5769215828','Citibank',to_date('08/06/18','DD/MM/RR'),'131544','10286','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30287','544936892','Citibank',to_date('26/12/17','DD/MM/RR'),'457779','10287','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30288','948899042','Citibank',to_date('07/09/18','DD/MM/RR'),'702968','10288','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30289','670917664','Citibank',to_date('27/02/18','DD/MM/RR'),'357667','10289','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30290','6491152871','Citibank',to_date('22/09/18','DD/MM/RR'),'790582','10290','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30291','502993278','Citibank',to_date('08/07/18','DD/MM/RR'),'422959','10291','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30292','8168232089','Citibank',to_date('04/02/18','DD/MM/RR'),'168516','10292','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30293','2723203212','Citibank',to_date('03/01/18','DD/MM/RR'),'923562','10293','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30294','8480212802','Citibank',to_date('03/12/17','DD/MM/RR'),'503428','10294','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30295','7730377349','Citibank',to_date('27/12/17','DD/MM/RR'),'198020','10295','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30296','6614632299','Citibank',to_date('12/11/17','DD/MM/RR'),'570636','10296','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30297','3498327283','Citibank',to_date('17/11/17','DD/MM/RR'),'130285','10297','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30298','2428567829','Citibank',to_date('01/07/18','DD/MM/RR'),'922861','10298','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30299','5545603247','Citibank',to_date('16/05/18','DD/MM/RR'),'346391','10299','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30300','748551891','Citibank',to_date('11/03/18','DD/MM/RR'),'875531','10300','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30301','5992689567','Davivienda',to_date('06/03/18','DD/MM/RR'),'656932','10301','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30302','2068127075','Davivienda',to_date('24/12/17','DD/MM/RR'),'666506','10302','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30303','4572232075','Davivienda',to_date('13/10/17','DD/MM/RR'),'766151','10303','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30304','4756066925','Davivienda',to_date('24/12/17','DD/MM/RR'),'859900','10304','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30305','5124122811','Davivienda',to_date('11/11/17','DD/MM/RR'),'695507','10305','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30306','2694012175','Davivienda',to_date('31/05/18','DD/MM/RR'),'763516','10306','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30307','3171962241','Davivienda',to_date('20/03/18','DD/MM/RR'),'784013','10307','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30308','4157865227','Davivienda',to_date('17/06/18','DD/MM/RR'),'904517','10308','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30309','7061878568','Davivienda',to_date('26/05/18','DD/MM/RR'),'868900','10309','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30310','6503830408','Davivienda',to_date('01/10/17','DD/MM/RR'),'612858','10310','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30311','3066560147','Davivienda',to_date('22/06/18','DD/MM/RR'),'798461','10311','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30312','707649900','Davivienda',to_date('30/06/18','DD/MM/RR'),'701300','10312','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30313','5496008964','Davivienda',to_date('19/08/18','DD/MM/RR'),'282827','10313','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30314','9642301865','Davivienda',to_date('09/05/18','DD/MM/RR'),'656096','10314','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30315','2266878395','Davivienda',to_date('11/07/18','DD/MM/RR'),'576573','10315','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30316','7994205569','Davivienda',to_date('30/11/17','DD/MM/RR'),'296137','10316','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30317','1945055413','Davivienda',to_date('06/06/18','DD/MM/RR'),'211352','10317','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30318','1127436821','Davivienda',to_date('01/02/18','DD/MM/RR'),'264618','10318','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30319','2015994661','Davivienda',to_date('18/06/18','DD/MM/RR'),'690923','10319','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30320','7807298650','Davivienda',to_date('26/01/18','DD/MM/RR'),'565136','10320','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30321','4750150835','Davivienda',to_date('03/02/18','DD/MM/RR'),'549499','10321','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30322','1925018830','Davivienda',to_date('03/10/17','DD/MM/RR'),'222522','10322','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30323','228981786','Davivienda',to_date('28/03/18','DD/MM/RR'),'923003','10323','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30324','3379954624','Davivienda',to_date('14/05/18','DD/MM/RR'),'299888','10324','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30325','9863384542','Davivienda',to_date('16/05/18','DD/MM/RR'),'709839','10325','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30326','5416229292','Davivienda',to_date('21/12/17','DD/MM/RR'),'426567','10326','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30327','6071571537','Davivienda',to_date('22/12/17','DD/MM/RR'),'298999','10327','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30328','8598120235','Davivienda',to_date('06/11/17','DD/MM/RR'),'894253','10328','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30329','8669119900','Davivienda',to_date('02/07/18','DD/MM/RR'),'375209','10329','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30330','5808541778','Davivienda',to_date('29/04/18','DD/MM/RR'),'679160','10330','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30331','7919172640','Davivienda',to_date('22/02/18','DD/MM/RR'),'832005','10331','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30332','1559730935','Davivienda',to_date('25/08/18','DD/MM/RR'),'528353','10332','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30333','3388595747','Davivienda',to_date('06/11/17','DD/MM/RR'),'909185','10333','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30334','1659551900','Davivienda',to_date('05/06/18','DD/MM/RR'),'318217','10334','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30335','510195962','Davivienda',to_date('02/08/18','DD/MM/RR'),'439002','10335','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30336','9718280944','Davivienda',to_date('17/05/18','DD/MM/RR'),'703993','10336','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30337','2188422570','Davivienda',to_date('07/12/17','DD/MM/RR'),'663386','10337','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30338','1915162882','Davivienda',to_date('25/10/17','DD/MM/RR'),'213849','10338','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30339','6498779772','Davivienda',to_date('07/02/18','DD/MM/RR'),'341747','10339','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30340','2690807580','Davivienda',to_date('26/10/17','DD/MM/RR'),'767948','10340','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30341','1819267784','Davivienda',to_date('14/03/18','DD/MM/RR'),'121950','10341','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30342','4705233069','Davivienda',to_date('07/04/18','DD/MM/RR'),'967842','10342','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30343','4678071776','Davivienda',to_date('09/08/18','DD/MM/RR'),'521609','10343','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30344','3115709668','Davivienda',to_date('09/12/17','DD/MM/RR'),'618235','10344','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30345','6913599560','Davivienda',to_date('23/07/18','DD/MM/RR'),'765595','10345','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30346','8834808118','Davivienda',to_date('22/12/17','DD/MM/RR'),'163231','10346','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30347','4597840117','Davivienda',to_date('21/04/18','DD/MM/RR'),'478943','10347','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30348','3504697725','Davivienda',to_date('28/05/18','DD/MM/RR'),'793544','10348','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30349','8233373273','Davivienda',to_date('31/05/18','DD/MM/RR'),'414456','10349','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30350','8549816620','Davivienda',to_date('08/02/18','DD/MM/RR'),'774758','10350','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30351','3509678680','Davivienda',to_date('19/06/18','DD/MM/RR'),'582187','10351','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30352','6370988847','Davivienda',to_date('20/10/17','DD/MM/RR'),'145228','10352','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30353','1147000670','Davivienda',to_date('24/09/18','DD/MM/RR'),'136045','10353','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30354','6395830104','Davivienda',to_date('05/03/18','DD/MM/RR'),'199373','10354','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30355','1220092657','Davivienda',to_date('16/09/18','DD/MM/RR'),'308318','10355','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30356','1044698632','Davivienda',to_date('07/08/18','DD/MM/RR'),'563457','10356','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30357','9713097572','Davivienda',to_date('04/08/18','DD/MM/RR'),'253426','10357','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30358','2788032080','Davivienda',to_date('28/06/18','DD/MM/RR'),'432323','10358','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30359','3049512962','Davivienda',to_date('21/07/18','DD/MM/RR'),'147685','10359','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30360','7724350353','Davivienda',to_date('16/06/18','DD/MM/RR'),'856409','10360','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30361','1463963327','Davivienda',to_date('31/08/18','DD/MM/RR'),'456539','10361','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30362','4838985657','Davivienda',to_date('20/07/18','DD/MM/RR'),'231738','10362','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30363','5624473540','Davivienda',to_date('18/04/18','DD/MM/RR'),'405390','10363','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30364','258691611','Davivienda',to_date('20/02/18','DD/MM/RR'),'773447','10364','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30365','7092244196','Davivienda',to_date('29/06/18','DD/MM/RR'),'945060','10365','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30366','2232388069','Davivienda',to_date('01/12/17','DD/MM/RR'),'327401','10366','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30367','8938737799','Davivienda',to_date('01/07/18','DD/MM/RR'),'830294','10367','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30368','1354508106','Davivienda',to_date('23/10/17','DD/MM/RR'),'944334','10368','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30369','5201015565','Davivienda',to_date('02/09/18','DD/MM/RR'),'428135','10369','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30370','2432720172','Davivienda',to_date('08/08/18','DD/MM/RR'),'519971','10370','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30371','4882007460','Davivienda',to_date('30/11/17','DD/MM/RR'),'726774','10371','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30372','7682484616','Davivienda',to_date('12/09/18','DD/MM/RR'),'288969','10372','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30373','7570005899','Davivienda',to_date('18/06/18','DD/MM/RR'),'696215','10373','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30374','6810627146','Davivienda',to_date('13/12/17','DD/MM/RR'),'173717','10374','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30375','732698243','Davivienda',to_date('29/06/18','DD/MM/RR'),'252741','10375','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30376','6687022237','Davivienda',to_date('19/11/17','DD/MM/RR'),'745742','10376','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30377','1854843494','Davivienda',to_date('26/06/18','DD/MM/RR'),'188706','10377','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30378','4456409452','Davivienda',to_date('10/12/17','DD/MM/RR'),'203465','10378','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30379','1440582084','Davivienda',to_date('20/10/17','DD/MM/RR'),'232317','10379','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30380','473643634','Davivienda',to_date('20/10/17','DD/MM/RR'),'543566','10380','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30381','5146240523','Davivienda',to_date('21/12/17','DD/MM/RR'),'483420','10381','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30382','8465073120','Davivienda',to_date('04/12/17','DD/MM/RR'),'995151','10382','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30383','2397425890','Davivienda',to_date('29/03/18','DD/MM/RR'),'133617','10383','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30384','3626703479','Davivienda',to_date('21/02/18','DD/MM/RR'),'941615','10384','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30385','7960382689','Davivienda',to_date('19/07/18','DD/MM/RR'),'155521','10385','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30386','4942190134','Davivienda',to_date('12/04/18','DD/MM/RR'),'764495','10386','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30387','1680727842','Davivienda',to_date('09/07/18','DD/MM/RR'),'829039','10387','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30388','6343999736','Davivienda',to_date('15/01/18','DD/MM/RR'),'214101','10388','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30389','2879082765','Davivienda',to_date('30/05/18','DD/MM/RR'),'480183','10389','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30390','3366698187','Davivienda',to_date('15/11/17','DD/MM/RR'),'438732','10390','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30391','6720683020','Davivienda',to_date('08/12/17','DD/MM/RR'),'279416','10391','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30392','4497868214','Davivienda',to_date('10/06/18','DD/MM/RR'),'637313','10392','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30393','1139833510','Davivienda',to_date('14/10/17','DD/MM/RR'),'326973','10393','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30394','5307436939','Davivienda',to_date('21/03/18','DD/MM/RR'),'539678','10394','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30395','8830745065','Davivienda',to_date('22/08/18','DD/MM/RR'),'973096','10395','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30396','124627021','Davivienda',to_date('30/05/18','DD/MM/RR'),'349024','10396','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30397','3123784991','Davivienda',to_date('18/07/18','DD/MM/RR'),'663775','10397','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30398','6213455493','Davivienda',to_date('08/09/18','DD/MM/RR'),'451973','10398','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30399','4808600420','Davivienda',to_date('10/11/17','DD/MM/RR'),'255688','10399','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30400','50029827','Davivienda',to_date('14/09/18','DD/MM/RR'),'551226','10400','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30401','6116510833','Davivienda',to_date('13/05/18','DD/MM/RR'),'712536','10401','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30402','4169172531','Davivienda',to_date('26/10/17','DD/MM/RR'),'418359','10402','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30403','6264126608','Davivienda',to_date('20/12/17','DD/MM/RR'),'331059','10403','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30404','1251392474','Davivienda',to_date('19/11/17','DD/MM/RR'),'892778','10404','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30405','2854056434','Davivienda',to_date('09/04/18','DD/MM/RR'),'319355','10405','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30406','4287710584','Davivienda',to_date('22/12/17','DD/MM/RR'),'480495','10406','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30407','6689174905','Davivienda',to_date('10/06/18','DD/MM/RR'),'795910','10407','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30408','8210168916','Davivienda',to_date('15/01/18','DD/MM/RR'),'104655','10408','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30409','8133855373','Davivienda',to_date('13/08/18','DD/MM/RR'),'401732','10409','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30410','9681927397','Davivienda',to_date('21/01/18','DD/MM/RR'),'523821','10410','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30411','5394764875','Davivienda',to_date('13/05/18','DD/MM/RR'),'923727','10411','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30412','3085450122','Davivienda',to_date('24/10/17','DD/MM/RR'),'241474','10412','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30413','960554289','Davivienda',to_date('06/05/18','DD/MM/RR'),'746869','10413','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30414','4426362938','Davivienda',to_date('26/05/18','DD/MM/RR'),'115284','10414','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30415','9285795749','Davivienda',to_date('02/05/18','DD/MM/RR'),'854817','10415','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30416','4790560996','Davivienda',to_date('13/09/18','DD/MM/RR'),'276570','10416','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30417','8213021649','Davivienda',to_date('15/01/18','DD/MM/RR'),'456947','10417','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30418','2547643731','Davivienda',to_date('13/02/18','DD/MM/RR'),'529567','10418','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30419','3843370273','Davivienda',to_date('15/01/18','DD/MM/RR'),'770581','10419','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30420','1403017212','Davivienda',to_date('13/01/18','DD/MM/RR'),'229210','10420','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30421','842178341','Davivienda',to_date('31/03/18','DD/MM/RR'),'320254','10421','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30422','4560254192','Davivienda',to_date('10/11/17','DD/MM/RR'),'697701','10422','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30423','7462199890','Davivienda',to_date('22/06/18','DD/MM/RR'),'999722','10423','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30424','110193237','Davivienda',to_date('28/10/17','DD/MM/RR'),'221833','10424','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30425','3110518821','Davivienda',to_date('28/04/18','DD/MM/RR'),'184401','10425','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30426','9255979396','Davivienda',to_date('04/03/18','DD/MM/RR'),'195074','10426','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30427','9274574037','Davivienda',to_date('19/11/17','DD/MM/RR'),'980952','10427','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30428','2469604826','Davivienda',to_date('13/01/18','DD/MM/RR'),'145123','10428','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30429','9782395730','Davivienda',to_date('27/05/18','DD/MM/RR'),'340225','10429','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30430','6419404967','Davivienda',to_date('20/09/18','DD/MM/RR'),'367357','10430','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30431','7118446262','Davivienda',to_date('16/05/18','DD/MM/RR'),'612965','10431','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30432','5428222948','Davivienda',to_date('24/03/18','DD/MM/RR'),'301849','10432','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30433','959897232','Davivienda',to_date('23/07/18','DD/MM/RR'),'866836','10433','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30434','7800786927','Davivienda',to_date('01/08/18','DD/MM/RR'),'502508','10434','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30435','4091289681','Davivienda',to_date('01/09/18','DD/MM/RR'),'962522','10435','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30436','2467917576','Davivienda',to_date('13/07/18','DD/MM/RR'),'598215','10436','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30437','2704929106','Davivienda',to_date('08/11/17','DD/MM/RR'),'930755','10437','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30438','8530664590','Davivienda',to_date('17/02/18','DD/MM/RR'),'207626','10438','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30439','6461360905','Davivienda',to_date('10/03/18','DD/MM/RR'),'758124','10439','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30440','1306783852','Davivienda',to_date('23/06/18','DD/MM/RR'),'362099','10440','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30441','3455065813','Davivienda',to_date('10/12/17','DD/MM/RR'),'951703','10441','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30442','8059194291','Davivienda',to_date('02/01/18','DD/MM/RR'),'850717','10442','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30443','4876015937','Davivienda',to_date('21/08/18','DD/MM/RR'),'596997','10443','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30444','6222192408','Davivienda',to_date('13/09/18','DD/MM/RR'),'911538','10444','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30445','868853151','Davivienda',to_date('14/04/18','DD/MM/RR'),'456745','10445','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30446','6126882318','Davivienda',to_date('16/04/18','DD/MM/RR'),'346024','10446','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30447','6765763090','Davivienda',to_date('07/10/17','DD/MM/RR'),'238707','10447','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30448','977593460','Davivienda',to_date('28/06/18','DD/MM/RR'),'304329','10448','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30449','4214568303','Davivienda',to_date('23/02/18','DD/MM/RR'),'534068','10449','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30450','6207406125','Davivienda',to_date('16/08/18','DD/MM/RR'),'223629','10450','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30451','4047769495','Davivienda',to_date('10/08/18','DD/MM/RR'),'366202','10451','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30452','7676342899','Davivienda',to_date('08/04/18','DD/MM/RR'),'845844','10452','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30453','6415382837','Davivienda',to_date('07/10/17','DD/MM/RR'),'298728','10453','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30454','3578271489','Davivienda',to_date('02/10/17','DD/MM/RR'),'884781','10454','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30455','4410721577','Davivienda',to_date('19/11/17','DD/MM/RR'),'824748','10455','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30456','2671218613','Davivienda',to_date('19/08/18','DD/MM/RR'),'422556','10456','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30457','3058380704','Davivienda',to_date('14/05/18','DD/MM/RR'),'478660','10457','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30458','1463291825','Davivienda',to_date('04/08/18','DD/MM/RR'),'221129','10458','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30459','6704790039','Davivienda',to_date('12/11/17','DD/MM/RR'),'890686','10459','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30460','9648031908','Davivienda',to_date('31/01/18','DD/MM/RR'),'623909','10460','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30461','7333756262','Davivienda',to_date('14/12/17','DD/MM/RR'),'804985','10461','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30462','7764204765','Davivienda',to_date('19/05/18','DD/MM/RR'),'162792','10462','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30463','8051325273','Davivienda',to_date('27/02/18','DD/MM/RR'),'173448','10463','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30464','3905548461','Davivienda',to_date('03/02/18','DD/MM/RR'),'838818','10464','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30465','6271679366','Davivienda',to_date('13/05/18','DD/MM/RR'),'762734','10465','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30466','8358708041','Davivienda',to_date('29/03/18','DD/MM/RR'),'491961','10466','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30467','2233998936','Davivienda',to_date('15/10/17','DD/MM/RR'),'579164','10467','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30468','1885178913','Davivienda',to_date('27/02/18','DD/MM/RR'),'298936','10468','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30469','8905531989','Davivienda',to_date('29/04/18','DD/MM/RR'),'320227','10469','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30470','5275774303','Davivienda',to_date('22/11/17','DD/MM/RR'),'430477','10470','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30471','4513314591','Davivienda',to_date('07/05/18','DD/MM/RR'),'587888','10471','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30472','7366517801','Davivienda',to_date('23/03/18','DD/MM/RR'),'917534','10472','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30473','8821918769','Davivienda',to_date('15/06/18','DD/MM/RR'),'868400','10473','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30474','9368125481','Davivienda',to_date('05/04/18','DD/MM/RR'),'870380','10474','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30475','8734550372','Davivienda',to_date('07/01/18','DD/MM/RR'),'546685','10475','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30476','382943821','Davivienda',to_date('03/05/18','DD/MM/RR'),'715366','10476','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30477','1701027607','Davivienda',to_date('23/01/18','DD/MM/RR'),'488086','10477','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30478','834862883','Davivienda',to_date('16/04/18','DD/MM/RR'),'577656','10478','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30479','5645682319','Davivienda',to_date('25/06/18','DD/MM/RR'),'764821','10479','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30480','4646024187','Davivienda',to_date('04/09/18','DD/MM/RR'),'169019','10480','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30481','9222520998','Davivienda',to_date('25/10/17','DD/MM/RR'),'219556','10481','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30482','1136179194','Davivienda',to_date('29/05/18','DD/MM/RR'),'452523','10482','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30483','2177289467','Davivienda',to_date('12/04/18','DD/MM/RR'),'652380','10483','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30484','2737912172','Davivienda',to_date('12/05/18','DD/MM/RR'),'155183','10484','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30485','3344253980','Davivienda',to_date('20/10/17','DD/MM/RR'),'400802','10485','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30486','5931716696','Davivienda',to_date('28/09/17','DD/MM/RR'),'291410','10486','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30487','5511327980','Davivienda',to_date('07/08/18','DD/MM/RR'),'770402','10487','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30488','8766668514','Davivienda',to_date('28/01/18','DD/MM/RR'),'239619','10488','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30489','2307231218','Davivienda',to_date('21/06/18','DD/MM/RR'),'529398','10489','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30490','259716154','Davivienda',to_date('12/08/18','DD/MM/RR'),'141282','10490','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30491','9298483074','Davivienda',to_date('24/04/18','DD/MM/RR'),'158746','10491','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30492','2603986465','Davivienda',to_date('12/04/18','DD/MM/RR'),'850527','10492','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30493','4011470678','Davivienda',to_date('22/07/18','DD/MM/RR'),'825517','10493','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30494','9363860779','Davivienda',to_date('10/10/17','DD/MM/RR'),'625850','10494','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30495','5447030536','Davivienda',to_date('19/03/18','DD/MM/RR'),'861998','10495','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30496','2867148359','Davivienda',to_date('27/07/18','DD/MM/RR'),'361741','10496','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30497','7355790153','Davivienda',to_date('07/01/18','DD/MM/RR'),'375110','10497','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30498','2609382960','Davivienda',to_date('31/12/17','DD/MM/RR'),'511625','10498','False');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30499','630444730','Davivienda',to_date('25/02/18','DD/MM/RR'),'866041','10499','True');
Insert into TARJETAS_CREDITO (ID,NUMERO_TARJETA,BANCO,FECHA_VENCIMIENTO,CODIGO_SEGURIDAD,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('30500','8013758427','Davivienda',to_date('18/09/18','DD/MM/RR'),'197030','10500','False');

-----------------------------Insercción de datos tabla Cuentas_empresariales------------------------------------------------------------
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20001','Riffpedia','10450','30001');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20002','Voolith','10451','30002');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20003','Npath','10452','30003');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20004','Riffpath','10453','30004');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20005','Tazz','10454','30005');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20006','Youopia','10455','30006');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20007','Aivee','10456','30007');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20008','Realblab','10457','30008');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20009','Wikizz','10458','30009');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20010','Twitterbridge','10459','30010');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20011','Photobug','10460','30011');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20012','Rhyzio','10461','30012');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20013','Twitterlist','10462','30013');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20014','Zava','10463','30014');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20015','Wikivu','10464','30015');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20016','Bluejam','10465','30016');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20017','Zoombox','10466','30017');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20018','Oyondu','10467','30018');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20019','Gigaclub','10468','30019');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20020','Photobug','10469','30020');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20021','Meejo','10470','30021');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20022','Jabbercube','10471','30022');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20023','Quinu','10472','30023');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20024','Wikido','10473','30024');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20025','Digitube','10474','30025');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20026','Meezzy','10475','30026');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20027','Skilith','10476','30027');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20028','Feedfish','10477','30028');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20029','Rhynoodle','10478','30029');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20030','Topicware','10479','30030');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20031','Trunyx','10480','30031');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20032','Jayo','10481','30032');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20033','DabZ','10482','30033');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20034','Teklist','10483','30034');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20035','BlogXS','10484','30035');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20036','Gigaclub','10485','30036');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20037','Realmix','10486','30037');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20038','Quaxo','10487','30038');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20039','Mycat','10488','30039');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20040','Flipstorm','10489','30040');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20041','Kazu','10490','30041');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20042','Livefish','10491','30042');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20043','Bubbletube','10492','30043');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20044','Dynava','10493','30044');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20045','Quaxo','10494','30045');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20046','InnoZ','10495','30046');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20047','Centidel','10496','30047');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20048','Twinder','10497','30048');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20049','Photojam','10498','30049');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20050','Buzzshare','10499','30050');
Insert into CUENTAS_EMPRESARIALES (ID,NOMBRE_EMPRESA,ID_USUARIO,ID_TDC) values ('20051','Voomm','10500','30051');

-----------------------------Insercción de datos tabla Cuentas_clientes------------------------------------------------------------
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9001','20001','10020',to_date('03/03/17','DD/MM/RR'),to_date('15/07/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9003','20002','10021',to_date('14/03/18','DD/MM/RR'),to_date('20/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9005','20003','10022',to_date('05/06/18','DD/MM/RR'),to_date('22/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9007','20004','10023',to_date('12/09/18','DD/MM/RR'),to_date('12/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9009','20005','10024',to_date('24/02/17','DD/MM/RR'),to_date('17/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9011','20006','10025',to_date('18/06/18','DD/MM/RR'),to_date('14/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9013','20007','10026',to_date('06/09/17','DD/MM/RR'),to_date('20/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9015','20008','10027',to_date('17/03/17','DD/MM/RR'),to_date('24/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9017','20009','10028',to_date('16/08/17','DD/MM/RR'),to_date('06/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9019','20010','10029',to_date('18/12/17','DD/MM/RR'),to_date('23/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9021','20011','10030',to_date('05/04/17','DD/MM/RR'),to_date('25/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9023','20012','10031',to_date('01/06/18','DD/MM/RR'),to_date('04/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9025','20013','10032',to_date('28/04/18','DD/MM/RR'),to_date('31/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9027','20014','10033',to_date('27/04/17','DD/MM/RR'),to_date('07/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9029','20015','10034',to_date('25/03/17','DD/MM/RR'),to_date('03/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9031','20016','10035',to_date('21/06/17','DD/MM/RR'),to_date('03/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9033','20017','10036',to_date('30/05/18','DD/MM/RR'),to_date('19/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9035','20018','10037',to_date('13/01/17','DD/MM/RR'),to_date('17/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9037','20019','10038',to_date('12/04/17','DD/MM/RR'),to_date('23/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9039','20020','10039',to_date('01/06/18','DD/MM/RR'),to_date('02/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9041','20021','10040',to_date('31/01/17','DD/MM/RR'),to_date('11/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9043','20022','10041',to_date('17/09/17','DD/MM/RR'),to_date('29/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9045','20023','10042',to_date('06/05/17','DD/MM/RR'),to_date('15/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9047','20024','10043',to_date('22/05/17','DD/MM/RR'),to_date('10/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9049','20025','10044',to_date('12/03/18','DD/MM/RR'),to_date('25/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9051','20026','10045',to_date('22/12/17','DD/MM/RR'),to_date('10/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9053','20027','10046',to_date('21/10/17','DD/MM/RR'),to_date('13/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9055','20028','10047',to_date('05/06/18','DD/MM/RR'),to_date('10/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9057','20029','10048',to_date('01/02/17','DD/MM/RR'),to_date('15/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9059','20030','10049',to_date('31/03/18','DD/MM/RR'),to_date('14/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9061','20031','10050',to_date('19/05/17','DD/MM/RR'),to_date('23/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9063','20032','10051',to_date('27/09/17','DD/MM/RR'),to_date('02/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9065','20033','10052',to_date('21/02/18','DD/MM/RR'),to_date('01/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9067','20034','10053',to_date('18/09/17','DD/MM/RR'),to_date('12/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9069','20035','10054',to_date('22/12/17','DD/MM/RR'),to_date('18/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9071','20036','10055',to_date('10/09/17','DD/MM/RR'),to_date('22/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9073','20037','10056',to_date('15/09/17','DD/MM/RR'),to_date('09/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9075','20038','10057',to_date('23/08/18','DD/MM/RR'),to_date('09/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9077','20039','10058',to_date('21/01/18','DD/MM/RR'),to_date('20/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9079','20040','10059',to_date('18/04/18','DD/MM/RR'),to_date('18/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9081','20041','10060',to_date('04/03/18','DD/MM/RR'),to_date('14/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9083','20042','10061',to_date('17/03/18','DD/MM/RR'),to_date('15/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9085','20043','10062',to_date('07/04/18','DD/MM/RR'),to_date('13/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9087','20044','10063',to_date('10/09/18','DD/MM/RR'),to_date('04/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9089','20045','10064',to_date('15/05/18','DD/MM/RR'),to_date('26/07/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9091','20046','10065',to_date('24/06/17','DD/MM/RR'),to_date('12/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9093','20047','10066',to_date('13/12/16','DD/MM/RR'),to_date('14/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9095','20048','10067',to_date('11/06/18','DD/MM/RR'),to_date('24/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9097','20049','10068',to_date('20/08/17','DD/MM/RR'),to_date('28/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9099','20050','10069',to_date('06/08/17','DD/MM/RR'),to_date('26/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9101','20051','10070',to_date('30/08/17','DD/MM/RR'),to_date('29/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9103','20001','10071',to_date('05/10/17','DD/MM/RR'),to_date('09/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9105','20002','10072',to_date('16/09/18','DD/MM/RR'),to_date('13/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9107','20003','10073',to_date('10/01/18','DD/MM/RR'),to_date('30/07/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9109','20004','10074',to_date('26/05/18','DD/MM/RR'),to_date('26/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9111','20005','10075',to_date('28/05/18','DD/MM/RR'),to_date('07/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9113','20006','10076',to_date('20/06/18','DD/MM/RR'),to_date('26/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9115','20007','10077',to_date('21/06/18','DD/MM/RR'),to_date('03/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9117','20008','10078',to_date('05/05/17','DD/MM/RR'),to_date('11/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9119','20009','10079',to_date('24/08/18','DD/MM/RR'),to_date('27/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9121','20010','10080',to_date('25/05/17','DD/MM/RR'),to_date('28/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9123','20011','10081',to_date('31/03/18','DD/MM/RR'),to_date('24/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9125','20012','10082',to_date('06/08/17','DD/MM/RR'),to_date('28/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9127','20013','10083',to_date('07/09/17','DD/MM/RR'),to_date('03/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9129','20014','10084',to_date('30/05/17','DD/MM/RR'),to_date('06/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9131','20015','10085',to_date('29/12/16','DD/MM/RR'),to_date('16/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9133','20016','10086',to_date('28/02/17','DD/MM/RR'),to_date('31/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9135','20017','10087',to_date('08/09/17','DD/MM/RR'),to_date('22/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9137','20018','10088',to_date('29/09/17','DD/MM/RR'),to_date('06/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9139','20019','10089',to_date('11/07/18','DD/MM/RR'),to_date('04/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9141','20020','10090',to_date('20/10/17','DD/MM/RR'),to_date('14/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9143','20021','10091',to_date('12/06/18','DD/MM/RR'),to_date('22/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9145','20022','10092',to_date('11/01/18','DD/MM/RR'),to_date('14/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9147','20023','10093',to_date('13/03/18','DD/MM/RR'),to_date('27/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9149','20024','10094',to_date('24/05/17','DD/MM/RR'),to_date('26/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9151','20025','10095',to_date('04/12/17','DD/MM/RR'),to_date('22/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9153','20026','10096',to_date('04/03/17','DD/MM/RR'),to_date('16/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9155','20027','10097',to_date('23/02/18','DD/MM/RR'),to_date('07/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9157','20028','10098',to_date('29/11/17','DD/MM/RR'),to_date('16/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9159','20029','10099',to_date('20/02/17','DD/MM/RR'),to_date('25/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9161','20030','10100',to_date('11/01/17','DD/MM/RR'),to_date('04/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9163','20031','10101',to_date('30/12/17','DD/MM/RR'),to_date('25/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9165','20032','10102',to_date('20/06/18','DD/MM/RR'),to_date('05/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9167','20033','10103',to_date('20/03/17','DD/MM/RR'),to_date('31/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9169','20034','10104',to_date('26/05/17','DD/MM/RR'),to_date('25/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9171','20035','10105',to_date('25/02/18','DD/MM/RR'),to_date('08/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9173','20036','10106',to_date('30/10/17','DD/MM/RR'),to_date('20/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9175','20037','10107',to_date('31/01/17','DD/MM/RR'),to_date('17/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9177','20038','10108',to_date('11/10/17','DD/MM/RR'),to_date('29/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9179','20039','10109',to_date('26/09/17','DD/MM/RR'),to_date('28/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9181','20040','10110',to_date('30/11/17','DD/MM/RR'),to_date('08/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9183','20041','10111',to_date('15/06/18','DD/MM/RR'),to_date('16/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9185','20042','10112',to_date('12/12/16','DD/MM/RR'),to_date('18/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9187','20043','10113',to_date('11/02/17','DD/MM/RR'),to_date('27/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9189','20044','10114',to_date('07/01/18','DD/MM/RR'),to_date('06/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9191','20045','10115',to_date('03/02/18','DD/MM/RR'),to_date('08/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9193','20046','10116',to_date('16/09/18','DD/MM/RR'),to_date('13/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9195','20047','10117',to_date('09/08/18','DD/MM/RR'),to_date('20/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9197','20048','10118',to_date('04/03/18','DD/MM/RR'),to_date('28/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9199','20049','10119',to_date('24/04/17','DD/MM/RR'),to_date('24/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9201','20050','10120',to_date('18/09/18','DD/MM/RR'),to_date('23/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9203','20051','10121',to_date('24/09/18','DD/MM/RR'),to_date('28/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9205','20001','10122',to_date('27/08/17','DD/MM/RR'),to_date('16/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9207','20002','10123',to_date('04/07/18','DD/MM/RR'),to_date('23/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9209','20003','10124',to_date('15/04/17','DD/MM/RR'),to_date('15/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9211','20004','10125',to_date('25/08/17','DD/MM/RR'),to_date('31/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9213','20005','10126',to_date('31/05/18','DD/MM/RR'),to_date('14/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9215','20006','10127',to_date('08/02/18','DD/MM/RR'),to_date('03/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9217','20007','10128',to_date('05/02/18','DD/MM/RR'),to_date('28/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9219','20008','10129',to_date('10/05/18','DD/MM/RR'),to_date('03/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9221','20009','10130',to_date('09/09/17','DD/MM/RR'),to_date('16/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9223','20010','10131',to_date('25/05/18','DD/MM/RR'),to_date('26/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9225','20011','10132',to_date('10/04/17','DD/MM/RR'),to_date('08/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9227','20012','10133',to_date('06/12/16','DD/MM/RR'),to_date('09/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9229','20013','10134',to_date('18/03/17','DD/MM/RR'),to_date('07/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9231','20014','10135',to_date('18/07/17','DD/MM/RR'),to_date('18/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9233','20015','10136',to_date('08/03/17','DD/MM/RR'),to_date('23/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9235','20016','10137',to_date('02/03/17','DD/MM/RR'),to_date('16/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9237','20017','10138',to_date('22/12/17','DD/MM/RR'),to_date('05/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9239','20018','10139',to_date('11/06/17','DD/MM/RR'),to_date('01/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9241','20019','10140',to_date('08/03/17','DD/MM/RR'),to_date('24/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9243','20020','10141',to_date('25/02/17','DD/MM/RR'),to_date('28/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9245','20021','10142',to_date('04/04/17','DD/MM/RR'),to_date('22/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9247','20022','10143',to_date('20/06/17','DD/MM/RR'),to_date('13/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9249','20023','10144',to_date('26/04/17','DD/MM/RR'),to_date('01/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9251','20024','10145',to_date('19/09/18','DD/MM/RR'),to_date('06/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9253','20025','10146',to_date('05/08/17','DD/MM/RR'),to_date('28/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9255','20026','10147',to_date('07/09/18','DD/MM/RR'),to_date('09/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9257','20027','10148',to_date('17/09/18','DD/MM/RR'),to_date('06/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9259','20028','10149',to_date('26/05/17','DD/MM/RR'),to_date('02/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9261','20029','10150',to_date('16/12/17','DD/MM/RR'),to_date('09/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9263','20030','10151',to_date('20/07/17','DD/MM/RR'),to_date('10/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9265','20031','10152',to_date('09/04/17','DD/MM/RR'),to_date('09/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9267','20032','10153',to_date('10/01/18','DD/MM/RR'),to_date('26/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9269','20033','10154',to_date('30/01/18','DD/MM/RR'),to_date('20/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9271','20034','10155',to_date('13/08/17','DD/MM/RR'),to_date('09/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9273','20035','10156',to_date('20/03/18','DD/MM/RR'),to_date('13/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9275','20036','10157',to_date('22/03/18','DD/MM/RR'),to_date('11/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9277','20037','10158',to_date('23/06/18','DD/MM/RR'),to_date('12/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9279','20038','10159',to_date('19/06/17','DD/MM/RR'),to_date('29/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9281','20039','10160',to_date('04/04/17','DD/MM/RR'),to_date('21/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9283','20040','10161',to_date('07/07/18','DD/MM/RR'),to_date('11/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9285','20041','10162',to_date('01/07/17','DD/MM/RR'),to_date('08/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9287','20042','10163',to_date('07/08/17','DD/MM/RR'),to_date('24/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9289','20043','10164',to_date('28/01/17','DD/MM/RR'),to_date('02/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9291','20044','10165',to_date('03/04/18','DD/MM/RR'),to_date('01/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9293','20045','10166',to_date('26/01/18','DD/MM/RR'),to_date('07/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9295','20046','10167',to_date('25/01/18','DD/MM/RR'),to_date('26/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9297','20047','10168',to_date('20/09/18','DD/MM/RR'),to_date('08/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9299','20048','10169',to_date('29/01/17','DD/MM/RR'),to_date('24/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9301','20049','10170',to_date('31/01/17','DD/MM/RR'),to_date('23/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9303','20050','10171',to_date('14/07/17','DD/MM/RR'),to_date('09/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9305','20051','10172',to_date('12/07/17','DD/MM/RR'),to_date('02/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9307','20001','10173',to_date('12/08/18','DD/MM/RR'),to_date('10/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9309','20002','10174',to_date('18/09/18','DD/MM/RR'),to_date('24/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9311','20003','10175',to_date('20/12/17','DD/MM/RR'),to_date('16/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9313','20004','10176',to_date('07/05/17','DD/MM/RR'),to_date('03/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9315','20005','10177',to_date('08/07/17','DD/MM/RR'),to_date('30/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9317','20006','10178',to_date('30/07/18','DD/MM/RR'),to_date('08/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9319','20007','10179',to_date('20/05/17','DD/MM/RR'),to_date('01/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9321','20008','10180',to_date('09/06/17','DD/MM/RR'),to_date('07/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9323','20009','10181',to_date('12/05/18','DD/MM/RR'),to_date('23/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9325','20010','10182',to_date('02/09/17','DD/MM/RR'),to_date('02/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9327','20011','10183',to_date('28/04/18','DD/MM/RR'),to_date('25/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9329','20012','10184',to_date('07/04/17','DD/MM/RR'),to_date('15/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9331','20013','10185',to_date('24/02/17','DD/MM/RR'),to_date('07/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9333','20014','10186',to_date('04/07/17','DD/MM/RR'),to_date('08/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9335','20015','10187',to_date('28/09/18','DD/MM/RR'),to_date('26/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9337','20016','10188',to_date('28/12/16','DD/MM/RR'),to_date('20/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9339','20017','10189',to_date('01/02/17','DD/MM/RR'),to_date('03/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9341','20018','10190',to_date('03/10/17','DD/MM/RR'),to_date('23/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9343','20019','10191',to_date('31/05/17','DD/MM/RR'),to_date('25/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9345','20020','10192',to_date('16/05/17','DD/MM/RR'),to_date('28/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9347','20021','10193',to_date('31/01/18','DD/MM/RR'),to_date('05/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9349','20022','10194',to_date('18/07/18','DD/MM/RR'),to_date('11/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9351','20023','10195',to_date('02/02/18','DD/MM/RR'),to_date('16/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9353','20024','10196',to_date('06/09/17','DD/MM/RR'),to_date('23/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9355','20025','10197',to_date('27/03/18','DD/MM/RR'),to_date('12/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9357','20026','10198',to_date('01/10/17','DD/MM/RR'),to_date('16/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9359','20027','10199',to_date('31/08/18','DD/MM/RR'),to_date('23/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9361','20028','10200',to_date('25/06/17','DD/MM/RR'),to_date('20/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9363','20029','10201',to_date('20/03/18','DD/MM/RR'),to_date('31/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9365','20030','10202',to_date('27/11/17','DD/MM/RR'),to_date('08/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9367','20031','10203',to_date('22/01/18','DD/MM/RR'),to_date('22/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9369','20032','10204',to_date('08/06/17','DD/MM/RR'),to_date('06/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9371','20033','10205',to_date('14/08/18','DD/MM/RR'),to_date('17/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9373','20034','10206',to_date('15/05/18','DD/MM/RR'),to_date('24/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9375','20035','10207',to_date('25/09/17','DD/MM/RR'),to_date('09/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9377','20036','10208',to_date('29/04/18','DD/MM/RR'),to_date('26/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9379','20037','10209',to_date('15/12/17','DD/MM/RR'),to_date('16/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9381','20038','10210',to_date('12/12/16','DD/MM/RR'),to_date('04/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9383','20039','10211',to_date('25/06/18','DD/MM/RR'),to_date('22/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9385','20040','10212',to_date('13/03/18','DD/MM/RR'),to_date('17/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9387','20041','10213',to_date('22/09/18','DD/MM/RR'),to_date('08/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9389','20042','10214',to_date('03/06/18','DD/MM/RR'),to_date('06/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9391','20043','10215',to_date('03/03/18','DD/MM/RR'),to_date('18/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9393','20044','10216',to_date('20/12/16','DD/MM/RR'),to_date('03/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9395','20045','10217',to_date('11/01/18','DD/MM/RR'),to_date('18/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9397','20046','10218',to_date('11/04/17','DD/MM/RR'),to_date('07/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9399','20047','10219',to_date('24/03/18','DD/MM/RR'),to_date('27/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9401','20048','10220',to_date('21/04/18','DD/MM/RR'),to_date('25/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9403','20049','10221',to_date('08/12/16','DD/MM/RR'),to_date('14/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9405','20050','10222',to_date('02/11/17','DD/MM/RR'),to_date('10/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9407','20051','10223',to_date('18/02/17','DD/MM/RR'),to_date('26/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9409','20001','10224',to_date('23/09/18','DD/MM/RR'),to_date('08/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9411','20002','10225',to_date('10/05/18','DD/MM/RR'),to_date('02/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9413','20003','10226',to_date('05/08/17','DD/MM/RR'),to_date('05/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9415','20004','10227',to_date('13/09/18','DD/MM/RR'),to_date('21/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9417','20005','10228',to_date('16/05/17','DD/MM/RR'),to_date('01/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9419','20006','10229',to_date('06/08/18','DD/MM/RR'),to_date('20/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9421','20007','10230',to_date('23/05/17','DD/MM/RR'),to_date('15/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9423','20008','10231',to_date('20/01/17','DD/MM/RR'),to_date('02/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9425','20009','10232',to_date('29/05/17','DD/MM/RR'),to_date('22/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9427','20010','10233',to_date('07/03/17','DD/MM/RR'),to_date('20/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9429','20011','10234',to_date('21/06/17','DD/MM/RR'),to_date('20/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9431','20012','10235',to_date('20/08/17','DD/MM/RR'),to_date('09/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9433','20013','10236',to_date('10/06/18','DD/MM/RR'),to_date('19/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9435','20014','10237',to_date('18/07/17','DD/MM/RR'),to_date('20/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9437','20015','10238',to_date('26/12/16','DD/MM/RR'),to_date('22/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9439','20016','10239',to_date('26/09/17','DD/MM/RR'),to_date('10/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9441','20017','10240',to_date('15/11/17','DD/MM/RR'),to_date('01/07/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9443','20018','10241',to_date('24/03/18','DD/MM/RR'),to_date('25/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9445','20019','10242',to_date('21/12/16','DD/MM/RR'),to_date('28/05/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9447','20020','10243',to_date('02/03/18','DD/MM/RR'),to_date('24/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9449','20021','10244',to_date('14/05/17','DD/MM/RR'),to_date('02/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9451','20022','10245',to_date('28/09/17','DD/MM/RR'),to_date('25/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9453','20023','10246',to_date('29/01/17','DD/MM/RR'),to_date('16/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9455','20024','10247',to_date('21/02/18','DD/MM/RR'),to_date('15/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9457','20025','10248',to_date('05/03/17','DD/MM/RR'),to_date('09/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9459','20026','10249',to_date('20/09/18','DD/MM/RR'),to_date('17/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9461','20027','10250',to_date('17/06/18','DD/MM/RR'),to_date('29/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9463','20028','10251',to_date('07/03/17','DD/MM/RR'),to_date('28/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9465','20029','10252',to_date('11/04/18','DD/MM/RR'),to_date('21/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9467','20030','10253',to_date('10/09/18','DD/MM/RR'),to_date('28/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9469','20031','10254',to_date('02/05/17','DD/MM/RR'),to_date('22/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9471','20032','10255',to_date('08/08/18','DD/MM/RR'),to_date('11/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9473','20033','10256',to_date('24/03/18','DD/MM/RR'),to_date('28/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9475','20034','10257',to_date('12/05/17','DD/MM/RR'),to_date('26/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9477','20035','10258',to_date('05/12/17','DD/MM/RR'),to_date('19/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9479','20036','10259',to_date('15/09/17','DD/MM/RR'),to_date('15/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9481','20037','10260',to_date('26/03/17','DD/MM/RR'),to_date('06/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9483','20038','10261',to_date('09/03/17','DD/MM/RR'),to_date('23/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9485','20039','10262',to_date('06/11/17','DD/MM/RR'),to_date('31/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9487','20040','10263',to_date('28/03/17','DD/MM/RR'),to_date('09/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9489','20041','10264',to_date('20/01/18','DD/MM/RR'),to_date('25/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9491','20042','10265',to_date('06/07/18','DD/MM/RR'),to_date('16/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9493','20043','10266',to_date('13/04/17','DD/MM/RR'),to_date('29/03/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9495','20044','10267',to_date('29/12/17','DD/MM/RR'),to_date('31/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9497','20045','10268',to_date('20/03/17','DD/MM/RR'),to_date('23/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9499','20046','10269',to_date('05/06/17','DD/MM/RR'),to_date('28/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9501','20047','10270',to_date('07/06/18','DD/MM/RR'),to_date('17/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9503','20048','10271',to_date('30/01/17','DD/MM/RR'),to_date('18/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9505','20049','10272',to_date('19/12/17','DD/MM/RR'),to_date('10/04/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9507','20050','10273',to_date('09/07/17','DD/MM/RR'),to_date('01/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9509','20051','10274',to_date('14/09/17','DD/MM/RR'),to_date('12/01/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9511','20001','10275',to_date('25/11/17','DD/MM/RR'),to_date('19/02/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9513','20002','10276',to_date('10/06/18','DD/MM/RR'),to_date('30/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9515','20003','10277',to_date('29/06/17','DD/MM/RR'),to_date('08/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9517','20004','10278',to_date('24/11/17','DD/MM/RR'),to_date('25/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9519','20005','10279',to_date('16/04/17','DD/MM/RR'),to_date('11/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9521','20006','10280',to_date('28/01/18','DD/MM/RR'),to_date('06/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9523','20007','10281',to_date('30/04/17','DD/MM/RR'),to_date('16/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9525','20008','10282',to_date('22/12/16','DD/MM/RR'),to_date('24/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9527','20009','10283',to_date('17/07/18','DD/MM/RR'),to_date('24/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9529','20010','10284',to_date('17/10/17','DD/MM/RR'),to_date('26/06/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9531','20011','10285',to_date('25/12/16','DD/MM/RR'),to_date('22/04/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9533','20012','10286',to_date('22/03/17','DD/MM/RR'),to_date('10/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9535','20013','10287',to_date('21/04/17','DD/MM/RR'),to_date('22/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9537','20014','10288',to_date('01/06/17','DD/MM/RR'),to_date('30/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9539','20015','10289',to_date('21/09/17','DD/MM/RR'),to_date('10/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9541','20016','10290',to_date('11/07/17','DD/MM/RR'),to_date('17/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9543','20017','10291',to_date('28/08/17','DD/MM/RR'),to_date('13/03/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9545','20018','10292',to_date('06/01/17','DD/MM/RR'),to_date('01/08/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9547','20019','10293',to_date('11/03/17','DD/MM/RR'),to_date('22/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9549','20020','10294',to_date('06/05/17','DD/MM/RR'),to_date('20/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9551','20021','10295',to_date('15/11/17','DD/MM/RR'),to_date('22/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9553','20022','10296',to_date('17/09/18','DD/MM/RR'),to_date('16/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9555','20023','10297',to_date('03/07/17','DD/MM/RR'),to_date('29/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9557','20024','10298',to_date('27/10/17','DD/MM/RR'),to_date('10/07/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9559','20025','10299',to_date('27/08/17','DD/MM/RR'),to_date('27/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9561','20026','10300',to_date('31/07/18','DD/MM/RR'),to_date('31/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9563','20027','10301',to_date('08/08/18','DD/MM/RR'),to_date('26/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9565','20028','10302',to_date('06/07/18','DD/MM/RR'),to_date('15/02/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9567','20029','10303',to_date('28/10/17','DD/MM/RR'),to_date('06/09/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9569','20030','10304',to_date('06/07/18','DD/MM/RR'),to_date('27/10/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9571','20031','10305',to_date('25/08/18','DD/MM/RR'),to_date('23/12/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9573','20032','10306',to_date('04/04/18','DD/MM/RR'),to_date('10/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9575','20033','10307',to_date('01/05/18','DD/MM/RR'),to_date('09/06/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9577','20034','10308',to_date('14/11/17','DD/MM/RR'),to_date('20/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9579','20035','10309',to_date('25/09/17','DD/MM/RR'),to_date('25/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9581','20036','10310',to_date('13/05/18','DD/MM/RR'),to_date('29/11/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9583','20037','10311',to_date('26/05/18','DD/MM/RR'),to_date('21/08/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9585','20038','10312',to_date('13/07/18','DD/MM/RR'),to_date('01/09/18','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9587','20039','10313',to_date('05/06/18','DD/MM/RR'),to_date('05/01/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9589','20040','10314',to_date('24/05/17','DD/MM/RR'),to_date('24/12/17','DD/MM/RR'),'True');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9591','20041','10315',to_date('30/10/17','DD/MM/RR'),to_date('25/11/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9593','20042','10319',to_date('30/03/17','DD/MM/RR'),to_date('26/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9595','20043','10320',to_date('13/03/17','DD/MM/RR'),to_date('20/05/18','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9597','20044','10321',to_date('17/01/18','DD/MM/RR'),to_date('30/10/17','DD/MM/RR'),'False');
Insert into CUENTAS_CLIENTES (ID,ID_CUENTA_EMPRESARIAL,ID_USUARIO,FECHA_INICIO,FECHA_FIN,ESTADO) values ('9599','20045','10322',to_date('04/02/18','DD/MM/RR'),to_date('24/05/18','DD/MM/RR'),'True');


-----------------------------Insercción de datos tabla Codigos_promocionales------------------------------------------------------------
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('1','102945','12000','10121','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('6','108842','14000','10122','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('11','114739','20000','10123','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('16','120636','40000','10124','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('21','126533','44000','10125','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('26','132430','53000','10126','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('31','138327','62000','10127','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('36','144224','71000','10128','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('41','150121','80000','10129','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('46','156018','89000','10130','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('51','161915','98000','10131','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('56','167812','107000','10132','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('61','173709','116000','10133','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('66','179606','125000','10134','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('71','185503','134000','10135','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('76','191400','143000','10136','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('81','197297','152000','10137','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('86','203194','161000','10138','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('91','209091','170000','10139','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('96','214988','179000','10140','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('101','220885','188000','10141','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('106','226782','12000','10142','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('111','232679','14000','10143','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('116','238576','20000','10144','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('121','244473','224000','10145','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('126','250370','233000','10146','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('131','256267','12000','10147','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('136','262164','14000','10148','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('141','268061','20000','10149','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('146','273958','269000','10150','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('151','279855','278000','10151','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('156','285752','12000','10152','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('161','291649','14000','10153','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('166','297546','20000','10154','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('171','303443','314000','10155','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('176','309340','323000','10156','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('181','315237','332000','10157','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('186','321134','12000','10158','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('191','327031','14000','10159','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('196','332928','20000','10160','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('201','338825','368000','10161','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('206','344722','377000','10162','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('211','350619','386000','10163','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('216','356516','395000','10164','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('221','362413','404000','10165','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('226','368310','413000','10166','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('231','374207','12000','10167','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('236','380104','14000','10168','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('241','386001','20000','10169','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('246','391898','449000','10170','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('251','397795','458000','10171','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('256','403692','467000','10172','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('261','409589','476000','10173','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('266','415486','485000','10174','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('271','421383','494000','10175','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('276','427280','12000','10176','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('281','433177','14000','10177','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('286','439074','20000','10178','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('291','444971','530000','10179','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('296','450868','539000','10180','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('301','456765','548000','10181','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('306','462662','557000','10182','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('311','468559','566000','10183','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('316','474456','12000','10184','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('321','480353','14000','10185','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('326','486250','20000','10186','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('331','492147','602000','10187','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('336','498044','611000','10188','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('341','503941','620000','10189','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('346','509838','12000','10190','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('351','515735','14000','10191','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('356','521632','20000','10192','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('361','527529','656000','10193','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('366','533426','665000','10194','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('371','539323','674000','10195','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('376','545220','12000','10196','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('381','551117','14000','10197','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('386','557014','20000','10198','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('391','562911','710000','10199','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('396','568808','719000','10200','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('401','574705','728000','10201','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('406','580602','737000','10202','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('411','586499','746000','10203','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('416','592396','755000','10204','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('421','598293','12000','10205','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('426','604190','14000','10206','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('431','610087','20000','10207','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('436','615984','791000','10208','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('441','621881','800000','10209','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('446','627778','809000','10210','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('451','633675','818000','10211','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('456','639572','12000','10212','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('461','645469','14000','10213','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('466','651366','20000','10214','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('471','657263','854000','10215','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('476','663160','12000','10216','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('481','669057','14000','10217','False');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('486','674954','20000','10218','True');
Insert into CODIGOS_PROMOCIONALES (ID,CODIGO_PROMOCIONAL,VALOR,ID_USUARIO,ESTADO) values ('491','680851','890000','10219','False');


-----------------------------Insercción de datos tabla PayPal------------------------------------------------------------

Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('400','7395082885',null,'True','10119','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('401','4940712354',null,'False','10120','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('402','485552744',null,'True','10121','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('403','6302325358',null,'False','10122','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('404','6281227840',null,'True','10123','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('405','7300796753',null,'False','10124','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('406','5510474653',null,'True','10125','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('407','357870530',null,'False','10126','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('408','4066264514',null,'True','10127','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('409','4941212371',null,'False','10128','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('410','9013571689',null,'True','10129','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('411','4998264966',null,'False','10130','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('412','9140675777',null,'True','10131','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('413','6638616862',null,'False','10132','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('414','7327609997',null,'True','10133','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('415','5947188910',null,'False','10134','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('416','7535829554',null,'True','10135','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('417','2691043096',null,'False','10136','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('418','6242795795',null,'True','10137','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('419','1924241196',null,'False','10138','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('420','5078876448',null,'True','10139','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('421','1270678671',null,'False','10140','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('422','229172954',null,'True','10141','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('423','4782359942',null,'False','10142','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('424','8766323673',null,'True','10143','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('425','6811447516',null,'False','10144','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('426','4665494681',null,'True','10145','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('427','2111569356',null,'False','10146','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('428','604829280',null,'True','10147','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('429','713197188',null,'False','10148','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('430','5076378645',null,'True','10149','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('431','3794988272',null,'False','10150','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('432','3868224297',null,'True','10151','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('433','7021291140',null,'False','10152','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('434','3895617822',null,'True','10153','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('435','5022402114',null,'False','10154','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('436','370549074',null,'True','10155','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('437','783934858',null,'False','10156','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('438','3166666842',null,'True','10157','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('439','5539718135',null,'False','10158','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('440','8512271272',null,'True','10159','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('441','5816974386',null,'False','10160','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('442','9070775123',null,'True','10161','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('443','7420150532',null,'False','10162','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('444','4512146601',null,'True','10163','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('445','776506137',null,'False','10164','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('446','2530622361',null,'True','10165','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('447','4497154785',null,'False','10166','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('448','4766055845',null,'True','10167','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('449','5634527112',null,'False','10168','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('450','1356687954',null,'True','10169','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('451','9360826405',null,'False','10170','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('452','5939587984',null,'True','10171','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('453','6904140674',null,'False','10172','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('454','9872682747',null,'True','10173','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('455','4853118926',null,'False','10174','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('456','4430837635',null,'True','10175','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('457','9849756578',null,'False','10176','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('458','6880364551',null,'True','10177','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('459','2488232602',null,'False','10178','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('460','4511031460',null,'True','10179','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('461','6352340806',null,'False','10180','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('462','8564430525',null,'True','10181','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('463','3774749353',null,'False','10182','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('464','1856868796',null,'True','10183','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('465','8765456262',null,'False','10184','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('466','1053582757',null,'True','10185','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('467','4017716008',null,'False','10186','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('468','1322821739',null,'True','10187','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('469','8292557237',null,'False','10188','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('470','2180420447',null,'True','10189','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('471','9558401331',null,'False','10190','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('472','4126739513',null,'True','10191','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('473','1164554832',null,'False','10192','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('474','632954078',null,'True','10193','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('475','4198010919',null,'False','10194','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('476','1584400072',null,'True','10195','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('477','5435498384',null,'False','10196','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('478','6505356053',null,'True','10197','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('479','2693795214',null,'False','10198','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('480','8610138275',null,'True','10199','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('481','6909490436',null,'False','10200','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('482','8177765647',null,'True','10201','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('483','6118565481',null,'False','10202','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('484','7930462692',null,'True','10203','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('485','5789518583',null,'False','10204','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('486','9037419879',null,'True','10205','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('487','2978056908',null,'False','10206','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('488','6261746974',null,'True','10207','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('489','9565871186',null,'False','10208','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('490','3392913952',null,'True','10209','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('491','6329751587',null,'False','10210','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('492','3854680791',null,'True','10211','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('493','2189901944',null,'False','10212','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('494','165321040',null,'True','10213','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('495','3264124033',null,'False','10214','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('496','5334040080',null,'True','10215','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('497','2022257855',null,'False','10216','False');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('498','3207450660',null,'True','10217','True');
Insert into PAYPAL (ID,CUENTA_USUARIO,BANCO,CUENTA_ACTIVA,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('499','3899999673',null,'False','10218','False');


-----------------------------Insercción de datos tabla Efectivos------------------------------------------------------------

Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('200','10199','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('202','10200','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('204','10201','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('206','10202','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('208','10203','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('210','10204','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('212','10205','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('214','10206','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('216','10207','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('218','10208','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('220','10209','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('222','10210','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('224','10211','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('226','10212','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('228','10213','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('230','10214','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('232','10215','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('234','10216','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('236','10217','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('238','10218','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('240','10219','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('242','10220','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('244','10221','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('246','10222','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('248','10223','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('250','10224','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('252','10225','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('254','10226','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('256','10227','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('258','10228','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('260','10229','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('262','10230','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('264','10231','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('266','10232','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('268','10233','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('270','10234','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('272','10235','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('274','10236','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('276','10237','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('278','10238','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('280','10239','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('282','10240','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('284','10241','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('286','10242','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('288','10243','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('290','10244','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('292','10245','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('294','10246','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('296','10247','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('298','10248','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('300','10249','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('302','10250','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('304','10251','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('306','10252','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('308','10253','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('310','10254','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('312','10255','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('314','10256','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('316','10257','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('318','10258','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('320','10259','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('322','10260','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('324','10261','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('326','10262','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('328','10263','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('330','10264','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('332','10265','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('334','10266','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('336','10267','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('338','10268','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('340','10269','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('342','10270','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('344','10271','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('346','10272','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('348','10273','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('350','10274','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('352','10275','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('354','10276','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('356','10277','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('358','10278','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('360','10279','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('362','10280','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('364','10281','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('366','10282','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('368','10283','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('370','10284','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('372','10285','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('374','10286','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('376','10287','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('378','10288','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('380','10289','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('382','10290','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('384','10291','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('386','10292','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('388','10293','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('390','10294','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('392','10295','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('394','10296','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('396','10297','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('398','10298','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('400','10299','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('402','10300','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('404','10301','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('406','10302','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('408','10303','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('410','10304','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('412','10305','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('414','10306','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('416','10307','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('418','10308','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('420','10309','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('422','10310','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('424','10311','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('426','10312','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('428','10313','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('430','10314','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('432','10315','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('434','10316','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('436','10317','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('438','10318','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('440','10319','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('442','10320','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('444','10321','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('446','10322','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('448','10323','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('450','10324','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('452','10325','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('454','10326','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('456','10327','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('458','10328','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('460','10329','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('462','10330','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('464','10331','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('466','10332','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('468','10333','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('470','10334','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('472','10335','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('474','10336','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('476','10337','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('478','10338','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('480','10339','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('482','10340','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('484','10341','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('486','10342','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('488','10343','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('490','10344','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('492','10345','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('494','10346','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('496','10347','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('498','10348','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('500','10349','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('502','10350','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('504','10351','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('506','10352','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('508','10353','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('510','10354','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('512','10355','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('514','10356','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('516','10357','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('518','10358','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('520','10359','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('522','10360','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('524','10361','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('526','10362','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('528','10363','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('530','10364','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('532','10365','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('534','10366','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('536','10367','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('538','10368','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('540','10369','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('542','10370','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('544','10371','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('546','10372','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('548','10373','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('550','10374','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('552','10375','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('554','10376','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('556','10377','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('558','10378','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('560','10379','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('562','10380','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('564','10381','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('566','10382','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('568','10383','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('570','10384','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('572','10385','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('574','10386','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('576','10387','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('578','10388','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('580','10389','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('582','10390','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('584','10391','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('586','10392','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('588','10393','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('590','10394','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('592','10395','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('594','10396','False');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('596','10397','True');
Insert into EFECTIVOS (ID,ID_USUARIO,ENVIAR_CORREO_FACTURA) values ('598','10398','False');


-----------------------------Insercción de datos tabla cuenta_ahorros------------------------------------------------------------
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('1','35287213901','False','200','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('2','49136924739','True','201','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('3','49130662670','False','202','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('4','53791265939','True','203','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('5','49115274953','True','204','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('6','51576706354','False','205','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('7','35515401070','False','206','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('8','56022437636','False','207','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('9','35445275158','True','208','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('10','54620323428','False','209','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('11','35782753235','False','210','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('12','37428312176','False','211','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('13','48444950703','False','212','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('14','35748656867','True','213','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('15','56418256344','False','214','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('16','37428366409','False','215','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('17','40179501931','False','216','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('18','35690142132','False','217','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('19','56022184379','False','218','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('20','67595634310','False','219','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('21','63311049994','False','220','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('22','63704410375','True','221','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('23','30430077476','True','222','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('24','49032577761','True','223','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('25','40413725477','False','224','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('26','35594580563','False','225','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('27','67672129973','True','226','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('28','35845324370','True','227','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('29','35794106642','True','228','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('30','49362602156','False','229','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('31','37428365474','False','230','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('32','55825857558','True','231','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('33','35589027739','False','232','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('34','35381088492','False','233','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('35','30492106588','False','234','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('36','35555592975','True','235','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('37','35429040259','False','236','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('38','53771964409','False','237','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('39','67594317429','False','238','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('40','35441295083','False','239','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('41','50023536289','False','240','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('42','35366374350','False','241','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('43','35614625314','False','242','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('44','35436258236','True','243','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('45','50189078327','False','244','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('46','49130671800','False','245','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('47','49051647905','False','246','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('48','35332942585','True','247','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('49','56022384399','False','248','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('50','30112090552','True','249','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('51','50076641430','True','250','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('52','35359562203','False','251','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('53','35549938410','False','252','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('54','37230154923','True','253','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('55','35800150470','False','254','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('56','35841403360','True','255','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('57','35329262008','False','256','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('58','30067968223','False','257','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('59','35384613309','True','258','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('60','35793262008','False','259','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('61','35327711260','False','260','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('62','50383445080','True','261','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('63','37388119172','False','262','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('64','34016597355','False','263','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('65','30415230954','False','264','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('66','37428811302','True','265','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('67','35790292669','False','266','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('68','56418299606','True','267','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('69','67612319362','False','268','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('70','30549736966','False','269','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('71','60433675777','True','270','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('72','49360383889','False','271','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('73','51001790228','True','272','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('74','35453398973','True','273','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('75','56104405034','False','274','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('76','51087526629','True','275','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('77','52044280798','True','276','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('78','35469339363','False','277','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('79','35543520054','True','278','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('80','35745351769','True','279','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('81','53620010465','True','280','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('82','37230115439','True','281','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('83','56022495643','True','282','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('84','50200631620','False','283','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('85','63811307999','False','284','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('86','35626954816','False','285','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('87','56022373561','False','286','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('88','35720598250','False','287','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('89','63337954523','True','288','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('90','40179556645','False','289','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('91','52013386027','True','290','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('92','35565117626','False','291','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('93','35733769048','True','292','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('94','51001418233','False','293','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('95','20191870156','True','294','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('96','49053790376','True','295','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('97','37462276949','False','296','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('98','49364735782','False','297','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('99','35827375209','False','298','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('100','49059583554','True','299','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('101','30585809540','True','300','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('102','30307518397','False','301','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('103','36014257854','False','302','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('104','35595876828','True','303','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('105','35718686458','True','304','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('106','35722283249','True','305','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('107','48444814713','False','306','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('108','30234148621','False','307','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('109','35700147825','True','308','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('110','30332984317','False','309','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('111','56022168103','True','310','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('112','55336193856','True','311','False');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('113','50483736383','False','312','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('114','35653172081','False','313','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('115','35710699364','False','314','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('116','63852700996','False','315','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('117','35725201271','True','316','True');
Insert into CUENTA_AHORROS (ID,CUENTA_CONDUCTOR,CUENTA_ACTIVA,ID_USUARIO_CONDUCTOR,ENVIAR_COMPROBANTE_PAGO) values ('118','20151002933','False','317','False');

-----------------------------Insercción de datos tabla Ubicaciones------------------------------------------------------------
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3120','16,1860744','58,465971','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3122','12,5532982','55,6840317','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3124','17,3522939','52,279986','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3126','107,8655766','30,9578398','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3128','122,541','-8,5139','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3130','126,679524','3,957378','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3132','13,499827','59,3800269','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3134','7,3732655','5,1215877','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3136','-70,95','9,25','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3138','31,1995755','-24,7237668','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3140','113,83012','22,141482','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3142','125,1233876','6,2266087','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3144','110,7480064','-7,0519444','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3146','130,7788921','45,730664','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3148','110,5930548','-2,321899','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3150','-7,4435441','13,5543249','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3152','44,0088697','36,2062933','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3154','37,4596409','-0,5388381','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3156','114,4046814','23,0878573','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3158','103,819836','1,352083','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3160','13,4676693','59,3846971','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3162','106,8209006','-6,192143','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3164','6,362623','49,5635135','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3166','106,666626','32,158809','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3168','118,916309','25,119815','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3170','57,6539388','59,0922905','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3172','113,404729','23,385158','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3174','-87,603826','15,3179065','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3176','2,394771','48,819324','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3178','15,3692353','45,0775463','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3180','3,8260916','47,2115555','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3182','16,2061552','51,9075123','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3184','116,640263','28,065079','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3186','139,7874841','37,4056028','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3188','15,0266516','50,7911439','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3190','111,8270486','-8,1553145','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3192','-42,64911','-19,538062','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3194','12,9793725','55,4386676','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3196','18,188947','45,5623078','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3198','-48,4560109','-14,4681236','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3200','14,4764786','59,3213237','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3202','27,7095936','60,5848255','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3204','101,6716295','3,2093353','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3206','-90,0443217','35,1241195','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3208','105,888827','28,753497','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3210','34,904544','32,519016','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3212','116,799278','26,656649','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3214','5,1249662','7,9903188','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3216','123,9266643','10,333833','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3218','17,8873144','59,2050499','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3220','115,858197','28,682892','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3222','43,1704696','54,1407588','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3224','27,3914185','-26,3517681','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3226','33,8550829','-11,0171949','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3228','112,2771485','-7,6633857','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3230','-9,3472738','39,1605965','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3232','-84,0284827','9,9576111','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3234','-86,3754398','41,6919638','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3236','45,3923','13,81436','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3238','117,62965','29,00701','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3240','106,8370122','-6,6359299','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3242','-119,45237','49,03306','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3244','139,3844092','37,9337124','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3246','113,8659097','-6,9909214','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3248','7,7825969','48,8134287','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3250','105,7676313','26,6679155','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3252','17,6411818','49,0225427','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3254','4,9192294','52,3770271','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3256','121,022581','31,627447','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3258','-98,7623874','20,0910963','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3260','12,8719616','50,2318521','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3262','118,949684','40,407578','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3264','121,0011959','14,3876884','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3266','90,1838976','22,9627499','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3268','-83,00685','9,93689','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3270','-3,664859','16,4175955','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3272','21,9974055','49,8259726','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3274','115,46687','22,954056','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3276','32,4706123','53,4334331','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3278','-72,0145063','45,7849952','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3280','31,3141291','-2,6343036','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3282','18,5268253','-33,5938745','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3284','46,19045','43,10528','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3286','19,1068043','47,5735211','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3288','-44,9965028','-12,1444393','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3290','106,8211843','26,7418451','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3292','-9,3180715','38,7638314','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3294','22,9085768','38,3542718','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3296','-75,6906241','8,2459842','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3298','6,1717148','44,0527811','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3300','-113,8687','52,13342','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3302','12,3698636','50,0795334','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3304','-157,86','21,31','205');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3306','121,0485932','14,5008343','207');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3308','-4,191742','33,613239','209');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3310','23,518328','49,799354','211');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3312','106,8974964','-6,5092532','213');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3314','-72,8207035','10,8312641','201');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3316','25,2298685','48,3667546','203');
Insert into UBICACIONES (ID,LONGITUD,LATITUD,ID_SERVICIO) values ('3318','106,762807','23,961903','205');

-----------------------------Insercción de datos tabla Viajes_compartidos------------------------------------------------------------

Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('20','10119','10001','1330346');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('40','10120','10002','1210000');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('60','10121','10003','19170,91');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('80','10122','10004','1313756');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('100','10123','10005','1169794');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('120','10124','10006','1685291');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('140','10125','10007','1108512');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('160','10126','10008','1330347');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('180','10127','10009','1210001');
Insert into VIAJES_COMPARTIDOS (ID,ID_USUARIO,ID_SERVICIO,TARIFA_VALOR) values ('200','10128','10010','19171,91');

-----------------------------Insercción de datos tabla Servicios------------------------------------------------------------TARIFA_DINAMICA
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2001',to_date('24/05/18','DD/MM/RR'),'10:33 AM','10:57 AM','208','50000','10101','200','Efectivo','False','10189','UberX','3120','24 min','638 Straubel Center','49375 Pearson Place','True','20','10');
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2003',to_date('12/07/18','DD/MM/RR'),'06:23 AM','02:02 PM','209','200000','10202','202','Efectivo','False','10190','Black','3122','7 min','3 Rowland Terrace','895 Quincy Terrace','False','40','13');
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2005',to_date('21/11/17','DD/MM/RR'),'07:28 AM','10:52 AM','210','30000','10303','204','Efectivo','True','10191','UberX','3124','3 min','78 Lien Parkway','0 Lindbergh Terrace','False','60','16');
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2007',to_date('28/07/18','DD/MM/RR'),'08:42 AM','10:57 AM','211','18000','10404','400','Paypal','False','10192','Black','3126','2 min','839 Petterle Circle','198 Debra Avenue','True','80','19');
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2009',to_date('19/12/17','DD/MM/RR'),'04:16 AM','11:42 PM','212','12000','10505','401','Paypal','True','10193','UberX','3128','7 min','43 Saint Paul Avenue','14 Westerfield Parkway','True','100','22');
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2011',to_date('09/08/18','DD/MM/RR'),'11:46 AM','01:14 PM','213','24000','10606','402','Paypal','True','10194','UberX','3130','2 min','481 Fair Oaks Plaza','5 Fordem Place','True','120','25');
Insert into SERVICIOS (ID,FECHA_VIAJE,HORA_INICIAL,HORA_FINAL,ID_USUARIO_CONDUCTOR,VALOR_SERVICIO,ID_CIUDAD,ID_MEDIO_PAGO,TIPO_MEDIO_PAGO,ESTADO_SERVICIO,ID_USUARIO,TIPO_SERVICIO,ID_UBICACION,TIEMPO_VIAJE,DIRECCION_ORIGEN,DIRECCION_DESTINO,TARIFA_DINAMICA,ID_VIAJE_COMPARTIDO,DISTANCIA) values ('2013',to_date('07/06/18','DD/MM/RR'),'01:21 PM','07:18 PM','214','15000','10707','403','Paypal','True','10195','UberX','3132','6 min','84759 Moulton Hill','3 Melody Pass','True','140','28');

-----------------------------Insercción de datos tabla Detalle_factura------------------------------------------------------------
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4010','Valor otros recargos','13000','2001');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4011','valor reserva','2000','2001');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4012','valor propinas','5000','2001');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4013','Valor otros recargos','60000','2003');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4014','valor reserva','10000','2003');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4015','valor propinas','12000','2003');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4016','Valor otros recargos','20000','2005');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4017','valor reserva','13000','2005');
Insert into DETALLES_FACTURAS (ID,CONCEPTOS,VALOR,ID_SERVICIO) values ('4018','valor propinas','12000','2005');

-----------------------------Insercción de datos tabla pagos_conductores------------------------------------------------------------

Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1101','200','1','Lion, african','907156,33',to_date('17/09/18','DD/MM/RR'),to_date('21/05/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1103','201','2','Dolphin, bottle-nose','994173,07',to_date('28/09/18','DD/MM/RR'),to_date('02/05/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1105','202','3','Plover, three-banded','854516,57',to_date('06/09/18','DD/MM/RR'),to_date('10/11/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1107','203','4','Langur, hanuman','897903,13',to_date('22/05/18','DD/MM/RR'),to_date('25/06/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1109','204','5','Aardwolf','845322,43',to_date('08/05/17','DD/MM/RR'),to_date('11/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1111','205','6','Hawk, red-tailed','853349,95',to_date('23/05/18','DD/MM/RR'),to_date('02/08/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1113','206','7','Eastern diamondback rattlesnake','907344,23',to_date('23/04/17','DD/MM/RR'),to_date('07/01/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1115','207','8','Stork, yellow-billed','937848,19',to_date('12/05/18','DD/MM/RR'),to_date('11/04/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1117','208','9','Flightless cormorant','994977,48',to_date('16/09/17','DD/MM/RR'),to_date('04/01/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1119','209','10','Constrictor, eastern boa','847261,61',to_date('13/03/17','DD/MM/RR'),to_date('20/06/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1121','210','11','Savannah deer','989644,92',to_date('06/07/17','DD/MM/RR'),to_date('20/08/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1123','211','12','Red-tailed hawk','884063,88',to_date('07/03/17','DD/MM/RR'),to_date('15/02/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1125','212','13','Australian sea lion','912066,37',to_date('28/04/17','DD/MM/RR'),to_date('19/12/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1127','213','14','Groundhog','894016,05',to_date('13/11/17','DD/MM/RR'),to_date('04/07/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1129','214','15','Spotted wood sandpiper','967985,21',to_date('17/04/18','DD/MM/RR'),to_date('29/06/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1131','215','16','Tortoise, burmese black mountain','788099,18',to_date('07/02/18','DD/MM/RR'),to_date('05/09/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1133','216','17','Caracara, yellow-headed','928773,07',to_date('19/01/18','DD/MM/RR'),to_date('16/08/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1135','217','18','Great skua','955792,08',to_date('03/09/18','DD/MM/RR'),to_date('23/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1137','218','19','Manatee','904807,55',to_date('18/05/17','DD/MM/RR'),to_date('18/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1139','219','20','Mountain lion','789743,19',to_date('30/06/17','DD/MM/RR'),to_date('15/06/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1141','220','21','Civet (unidentified)','906716,29',to_date('12/11/17','DD/MM/RR'),to_date('22/03/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1143','221','22','Blesbok','796248,2',to_date('15/09/18','DD/MM/RR'),to_date('17/07/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1145','222','23','Squirrel, indian giant','891920,48',to_date('19/03/17','DD/MM/RR'),to_date('21/01/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1147','223','24','Blue and yellow macaw','882250',to_date('13/10/17','DD/MM/RR'),to_date('18/02/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1149','224','25','Cobra, egyptian','934580,41',to_date('08/09/17','DD/MM/RR'),to_date('23/01/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1151','225','26','Common green iguana','988910,52',to_date('14/02/17','DD/MM/RR'),to_date('04/05/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1153','226','27','Burmese black mountain tortoise','986533,65',to_date('01/08/17','DD/MM/RR'),to_date('27/03/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1155','227','28','Serval','840910,8',to_date('27/08/18','DD/MM/RR'),to_date('02/06/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1157','228','29','Golden eagle','803632,18',to_date('05/12/17','DD/MM/RR'),to_date('18/09/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1159','229','30','Pied crow','790375,57',to_date('01/06/18','DD/MM/RR'),to_date('25/02/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1161','230','31','Starling, superb','960732,84',to_date('28/03/18','DD/MM/RR'),to_date('23/06/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1163','231','32','Pine snake (unidentified)','838833,85',to_date('25/02/18','DD/MM/RR'),to_date('21/08/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1165','232','33','Deer, swamp','985475,61',to_date('15/09/17','DD/MM/RR'),to_date('25/08/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1167','233','34','Lemming, collared','836618',to_date('09/04/17','DD/MM/RR'),to_date('28/09/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1169','234','35','Tsessebe','883668,2',to_date('15/10/18','DD/MM/RR'),to_date('01/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1171','235','36','Boa, columbian rainbow','889455,24',to_date('30/07/17','DD/MM/RR'),to_date('05/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1173','236','37','Ass, asiatic wild','838490,37',to_date('18/02/17','DD/MM/RR'),to_date('06/05/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1175','237','38','Stork, marabou','929075,98',to_date('09/12/17','DD/MM/RR'),to_date('30/10/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1177','238','39','Heron, gray','909224,46',to_date('20/05/17','DD/MM/RR'),to_date('21/07/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1179','239','40','Knob-nosed goose','947411,4',to_date('29/01/17','DD/MM/RR'),to_date('17/11/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1181','240','41','Bare-faced go away bird','789496,28',to_date('22/06/18','DD/MM/RR'),to_date('03/05/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1183','241','42','Old world fruit bat (unidentified)','815484,37',to_date('18/09/17','DD/MM/RR'),to_date('28/02/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1185','242','43','Wallaby, tammar','864044,24',to_date('21/07/17','DD/MM/RR'),to_date('30/06/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1187','243','44','Spur-winged goose','915383,74',to_date('21/09/17','DD/MM/RR'),to_date('11/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1189','244','45','Purple grenadier','992532,26',to_date('19/08/18','DD/MM/RR'),to_date('20/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1191','245','46','Potoroo','925311,85',to_date('24/05/17','DD/MM/RR'),to_date('11/09/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1193','246','47','Bustard, stanley','810019,97',to_date('26/09/18','DD/MM/RR'),to_date('27/10/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1195','247','48','Emerald green tree boa','915167,54',to_date('31/08/18','DD/MM/RR'),to_date('23/02/17','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1197','248','49','Civet, small-toothed palm','868765,56',to_date('04/08/17','DD/MM/RR'),to_date('01/02/18','DD/MM/RR'));
Insert into PAGO_CONDUCTORES (ID,ID_USUARIO_CONDUCTOR,ID_CUENTA_AHORROS,OBSERVACIONES,VALOR_PAGADO,FECHA_INICIAL,FECHA_FINAL) values ('1199','249','50','Tortoise, desert','927044,05',to_date('12/05/17','DD/MM/RR'),to_date('13/11/17','DD/MM/RR'));

--ANA MARÌA ALARCON ARBOLEDA
--Solucion ASSIGNMENT 2 Funciones ,vistas, procedimientos

---------------PUNTO NO.1 ------------------------------------------
/*
Crear una vista llamada “MEDIOS_PAGO_CLIENTES” que contenga las siguientes columnas:
CLIENTE_ID, NOMBRE_CLIENTE (Si tiene el nombre y el apellido separados en columnas, deberán
estar unidas en una sola), MEDIO_PAGO_ID, TIPO (TDC, Android, Paypal, Efectivo),
DETALLES_MEDIO_PAGO, EMPRESARIAL (FALSO o VERDADERO), NOMBRE_EMPRESA (Si la
columna Empresarial es falso, este campo aparecerá Nulo).
*/

CREATE OR REPLACE VIEW MEDIOS_PAGO_CLIENTES as
SELECT DISTINCT US.ID AS CLIENTE_ID , US.NOMBRES || ' ' || US.APELLIDOS AS NOMBRES,
PA.ID AS MEDIO_PAGO_ID, 'PAYPAL' AS TIPO, US.CORREO_UNO AS DETALLE_MEDIO_PAGO,
'FALSE' EMPRESARIAL, ' ' NOMBRE_EMPRESA
FROM USUARIOS US
INNER JOIN PAYPAL PA ON PA.ID_USUARIO = US.ID
UNION 
SELECT DISTINCT US.ID AS CLIENTE_ID , US.NOMBRES || ' ' || US.APELLIDOS AS NOMBRES,
EF.ID AS MEDIO_PAGO_ID, 'EFECTIVO' AS TIPO, ' ' AS DETALLE_MEDIO_PAGO,
'FALSE' AS EMPRESARIAL, ' ' AS NOMBRE_EMPRESA
FROM USUARIOS US
INNER JOIN EFECTIVOS EF ON EF.ID_USUARIO = US.ID
UNION
SELECT DISTINCT US.ID AS CLIENTE_ID , US.NOMBRES || ' ' || US.APELLIDOS AS NOMBRES,
TC.ID AS MEDIO_PAGO_ID, 'TARJETA CREDITO' AS TIPO, CAST(TC.NUMERO_TARJETA AS VARCHAR2(255)) AS DETALLE_MEDIO_PAGO,
'TRUE' EMPRESARIAL, CM.NOMBRE_EMPRESA NOMBRE_EMPRESA
FROM USUARIOS US
INNER JOIN TARJETAS_CREDITO TC ON TC.ID_USUARIO = US.ID
INNER JOIN CUENTAS_EMPRESARIALES CM ON CM.ID_TDC = TC.ID
ORDER BY CLIENTE_ID ASC;

--SELECT * FROM MEDIOS_PAGO_CLIENTES

---------------PUNTO NO.2 ------------------------------------------
/*
Cree una vista que permita listar los viajes de cada cliente ordenados cronológicamente. El nombre
de la vista será “VIAJES_CLIENTES”, los campos que tendrá son: FECHA_VIAJE,
NOMBRE_CONDUCTOR, PLACA_VEHICULO, NOMBRE_CLIENTE, VALOR_TOTAL,
TARIFA_DINAMICA (FALSO O VERDADERO), TIPO_SERVICIO (UberX o UberBlack),
CIUDAD_VIAJE.
*/

CREATE OR REPLACE VIEW VIAJES_CLIENTES AS
SELECT TO_DATE (SE.FECHA_VIAJE,'DD/MM/YYYY') FECHA_VIAJE, USC.NOMBRES ||' '|| USC.APELLIDOS NOMBRE_CONDUCTOR, 
AU.PLACA PLACA_VEHICULO, US.NOMBRES ||' '||US.APELLIDOS NOMBRE_CLIENTE,
SE.VALOR_SERVICIO VALOR_TOTAL, SE.TARIFA_DINAMICA TARIFA_DINAMICA,
SE.TIPO_SERVICIO TIPO_SERVICIO, CI.CIUDAD CIUDAD_VIAJE
FROM SERVICIOS SE
INNER JOIN DETALLES_USUARIOS_CONDUCTORES DC ON DC.ID = SE.ID_USUARIO_CONDUCTOR
INNER JOIN USUARIOS USC ON USC.ID = DC.ID_USUARIO
INNER JOIN USUARIOS US ON US.ID = SE.ID_USUARIO
INNER JOIN AUTOMOVILES AU ON AU.ID = DC.ID_AUTOMOVIL
INNER JOIN CIUDADES CI ON CI.ID = SE.ID_CIUDAD
ORDER BY TO_DATE (SE.FECHA_VIAJE,'DD/MM/YY') ASC;

---------------PUNTO NO.3 ------------------------------------------
/*
Cree y evidencie el plan de ejecución de la vista VIAJES_CLIENTES. Cree al menos un índice donde
mejore el rendimiento del query y muestre el nuevo plan de ejecución.
*/

EXPLAIN PLAN SET STATEMENT_ID = 'ExplainPlan_1' FOR 
select * from VIAJES_CLIENTES;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE','ExplainPlan_1','TYPICAL'));

--Creacion del indice indicado en la tabla DETALLE_USUARIOS_CONDUSTORES en el campo id_usuario.
--DROP INDEX USUARIOS_CONDUCTORES;
CREATE UNIQUE INDEX USUARIOS_CONDUCTORES ON DETALLES_USUARIOS_CONDUCTORES(ID_USUARIO);

---------------PUNTO NO.4 ------------------------------------------
/*
Las directivas han decidido implementar el valor de la tarifa por cada kilómetro recorrido y el valor de
la tarifa por minuto transcurrido de acuerdo a cada ciudad. También han decidido almacenar el valor
de la tarifa base para cada ciudad. Para esto usted deberá crear tres de columnas de tipo numérico y
en la tabla que sea conveniente (Se sugiere que sea en la tabla de Ciudades en caso de tenerla
disponible) Ejemplo:
a. Medellín: el valor por cada kilómetro es: 764.525994 pesos colombianos y el valor por minuto
es de: 178.571429 pesos colombianos. El valor de la tarifa base es de 2500
b. Bogotá: el valor por cada kilómetro es: 522.43456 pesos colombianos y el valor por minuto es
de: 173.1273 pesos colombianos. El valor de la tarifa base es de 2400
c. Llenar diversos valores para las demás ciudad.
*/

/*ALTER TABLE Ciudades (
   Id INT NOT NULL PRIMARY KEY,
   ciudad VARCHAR2(255),
   Id_pais INT NOT NULL,
   tarifa_kilometro NUMBER, -- Columna 1 dicionada
   tarifa_minuto NUMBER,-- Columna 2 dicionada
   tarifa_base NUMBER -- Columna 3 dicionada
   );*/
   
--SELECT * FROM Ciudades CU
--WHERE CU.ID IN ('10101','10202');

---------------PUNTO NO.5 ------------------------------------------
/*
Crear una función llamada VALOR_DISTANCIA que reciba la distancia en kilómetros y el nombre de
la ciudad donde se hizo el servicio. Con esta información deberá buscar el valor por cada kilómetro
dependiendo de la ciudad donde esté ubicado el viaje. Deberá retornar el resultado de multiplicar la
distancia recorrida y el valor de cada kilómetro dependiendo de la ciudad. Si la distancia es menor a 0
kilómetros o la ciudad no es válida deberá levantar una excepción propia. Ejemplo: Viaje_ID: 342 que
fue hecho en Medellín y la distancia fue 20.68km. En este caso deberá retornar 20.68 * 764.525994 =
15810.3976
*/

CREATE OR REPLACE FUNCTION VALOR_DISTANCIA(distancia IN NUMBER,nom_cudad IN VARCHAR2) 
RETURN NUMBER AS
total CIUDADES.TARIFA_KILOMETRO%type := 0;
execiudad EXCEPTION;
execdistancia EXCEPTION;
BEGIN 
 IF (nom_cudad is null) OR (distancia <= 0)
THEN 
RAISE execiudad;
RAISE execdistancia;
ELSE
SELECT (distancia * CU.TARIFA_KILOMETRO)
INTO total FROM CIUDADES CU
WHERE CU.CIUDAD LIKE nom_cudad||'%';--Medellìn
RETURN total; 
END IF;
EXCEPTION 
WHEN execiudad OR execdistancia THEN
dbms_output.put_line('El valor de la distancia no puede ser cero o el nombre de la ciudad esta incorrecto');
WHEN OTHERS THEN 
dbms_output.put_line('No se ha encontrado el registro');
END;
--NO_DATA_FOUND


--BEGIN 
--dbms_output.put_line('El resultado es: ' || VALOR_DISTANCIA(20.68,'cucuta'));
--END;


---------------PUNTO NO.6 ------------------------------------------
/*
Crear una función llamada VALOR_TIEMPO que reciba la cantidad de minutos del servicio y el
nombre de la ciudad donde se hizo el servicio. Con esta información deberá buscar el valor por cada
minuto dependiendo de la ciudad donde esté ubicado el viaje. Deberá retornar el resultado de
multiplicar la distancia recorrida y el valor de cada minuto dependiendo de la ciudad. Si la cantidad de
minutos es menor a 0 o la ciudad no es válida deberá levantar una excepción propia. Ejemplo:
Viaje_ID: 342 que fue hecho en Medellín y el tiempo fue 28 minutos. En este caso deberá retornar 28
* 178.571429 = 5000.00001
*/

CREATE OR REPLACE FUNCTION VALOR_TIEMPO(cantidad IN NUMBER,nom_cudad IN VARCHAR2) 
RETURN NUMBER AS
total CIUDADES.TARIFA_MINUTO%type := 0;
execiudad EXCEPTION;
execantidad EXCEPTION;
BEGIN 
IF (nom_cudad is null) OR (cantidad  <= 0)
THEN 
RAISE execiudad;
RAISE execantidad;
ELSE
SELECT (cantidad * CU.TARIFA_MINUTO)
INTO total FROM CIUDADES CU
WHERE CU.CIUDAD LIKE nom_cudad||'%';--Medellìn
RETURN total; 
END IF;
EXCEPTION 
WHEN execiudad OR execantidad  THEN
dbms_output.put_line('El valor de la distancia no puede ser cero o el nombre de la ciudad esta incorrecto');
WHEN OTHERS THEN 
dbms_output.put_line('No se ha encontrado el registro');
END;

--BEGIN 
--dbms_output.put_line('El resultado es: ' || VALOR_TIEMPO(28,'Medellìn'));
--END;

---------------PUNTO NO.7 ------------------------------------------
/*
Crear un procedimiento almacenado que se llame CALCULAR_TARIFA, deberá recibir el ID del viaje.
Para calcular la tarifa se requiere lo siguiente:
a. Si el estado del viaje es diferente a REALIZADO, deberá insertar 0 en el valor de la tarifa.
b. Buscar el valor de la tarifa base dependiendo de la ciudad donde se haya hecho el servicio.
c. Invocar la función VALOR_DISTANCIA
d. Invocar la función VALOR_TIEMPO
e. Deberá buscar todos los detalles de cada viaje y sumarlos.
f. Sumar la tarifa base más el resultado de la función VALOR_DISTANCIA más el resultado de
la función VALOR_TIEMPO y el resultado de la sumatoria de los detalles del viaje.
g. Actualizar el registro del viaje con el resultado obtenido.
h. Si alguna de las funciones levanta una excepción, esta deberá ser controlada y actualizar el
valor del viaje con 0.
*/

CREATE OR REPLACE PROCEDURE CALCULAR_TARIFA(viaje IN INT) AS
estado SERVICIOS.ESTADO_SERVICIO%type := null;
ciudad_viaje CIUDADES.CIUDAD%type := null;
tarifa_base CIUDADES.TARIFA_BASE%type := 0;
tiempo_viaje SERVICIOS.TIEMPO_VIAJE%type := 0;
distancia SERVICIOS.DISTANCIA%type := 0;
detalle_viaje NUMBER := 0;
valor_tiem NUMBER := 0;
valor_dist NUMBER := 0;
valor_tarifa NUMBER := 0;
BEGIN 
 SELECT DISTINCT SERVICIOS.ESTADO_SERVICIO, CIUDADES.TARIFA_BASE, 
 SERVICIOS.TIEMPO_VIAJE, SERVICIOS.DISTANCIA,
 SUM(DETALLES_FACTURAS.VALOR)OVER(PARTITION BY DETALLES_FACTURAS.ID_SERVICIO),
 CIUDADES.CIUDAD
 INTO estado, tarifa_base, tiempo_viaje,distancia,detalle_viaje,ciudad_viaje
 FROM SERVICIOS 
 INNER JOIN CIUDADES ON CIUDADES.ID = SERVICIOS.ID_CIUDAD
 INNER JOIN DETALLES_FACTURAS ON DETALLES_FACTURAS.ID_SERVICIO = SERVICIOS.ID
 WHERE SERVICIOS.ID = viaje;

 IF (estado <> 'True')
  THEN
  valor_tarifa := 0;
  valor_tiem := VALOR_TIEMPO(tiempo_viaje,ciudad_viaje);
  valor_dist := VALOR_DISTANCIA(distancia,ciudad_viaje);
  valor_tarifa := tarifa_base + valor_tiem + valor_dist + detalle_viaje;
  
  UPDATE SERVICIOS SE
  SET SE.VALOR_SERVICIO = valor_tarifa
  WHERE SE.ID = viaje  ;  
   dbms_output.put_line('VALOR DE LA TARIFA: '||' '|| valor_tarifa ||' '||'Actualizado correctamente');  
 ELSE
 dbms_output.put_line('No es posible actualizar el valor del servicio');
 END IF;
END;

--EXEC CALCULAR_TARIFA(2001);
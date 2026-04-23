unidad 1





1. diferencias entre inner join y righnt join  y incluir un ejemplo aplicado al caso ?

INNER JOIN se usa cuando solo quieres ver los datos que tienen relación en ambas tablas, o sea, lo que sí coincide.
RIGHT JOIN te muestra todos los datos de la tabla derecha, aunque algunos no tengan relación con la otra tabla.
Con INNER JOIN solo ves los clientes que sí han hecho pedidos.
Con RIGHT JOIN ves todos los pedidos, incluso si no sabes qué cliente los hizo.

2. casos de uso de subconsultas en select, from y where 
En SELECT: se usa para sacar un dato extra, como contar cosas.
En FROM: sirve como si fuera una tabla temporal que creas en el momento.
En WHERE: ayuda a filtrar resultados con otra consulta.


3. función y utilidad de las funciones de agregación 

Contar registros
Sacar promedios
Saber el mayor o menor valor

4. diferencias entre índice y vista
Índice: sirve para que la base de datos busque más rápido, como un índice de un libro.
Vista: es como una consulta guardada que puedes usar como si fuera una tabla.
 
5. impacto positivo y negativo de los índices  en el rendimiento de una base fde datos 

Lo positivo es que hacen que las consultas sean más rápidas.
Lo negativo es que hacen que guardar o modificar datos sea más lento y ocupan espacio. 


unidad 2 




1. diferencias entre función y procedimiento almacenado 
Función (FUNCTION):
Siempre devuelve un valor (RETURN).
Se puede usar dentro de consultas (SELECT).
Procedimiento almacenado (PROCEDURE):
No necesariamente devuelve un valor.
Se ejecuta con CALL.
Puede realizar operaciones más complejas (INSERT, UPDATE, DELETE).

2. uso de variables y estructura de control en sql procedimientos
Variables: almacenan datos temporales

DECLARE edad INT;
SET edad = 20;

Estructuras de control:

Condicionales:
IF edad >= 18 THEN
   SELECT 'Mayor de edad';
ELSE
   SELECT 'Menor de edad';
END IF;
Ciclos:
WHILE edad < 30 DO
   SET edad = edad + 1;
END WHILE;
 
3. que problema resuelve un disparo (tigerr)
Automatiza acciones en la base de datos.
Se ejecuta cuando ocurre un evento (INSERT, UPDATE, DELETE).
Ejemplo de uso:
Validar datos automáticamente
Registrar cambios (auditoría)
Problema que resuelve: evita errores humanos y mantiene la integridad de los datos.

4. importancia de las transacciones y las propiedades acid
Garantizan que las operaciones en la base de datos sean seguras.

ACID:

A (Atomicidad): todo o nada
C (Consistencia): datos válidos
I (Aislamiento): transacciones independientes
D (Durabilidad): cambios permanentes
 

 5. diferencias entre commit y rollback 
COMMIT:
Guarda definitivamente los cambios.
ROLLBACK:
Deshace los cambios si hay error.


unidad 3




1. diferencia entre usuario y perfil
Usuario: persona o cuenta que accede a la BD.
Perfil/Rol: conjunto de permisos asignados a varios usuarios. 

2. que es la granularidad de permisos
Nivel de detalle con el que se asignan permisos.
Puede ser:
Base de datos completa
Tabla
Columna 

3. tipos de respaldo y escenario de uso 
Completo: copia toda la BD → recuperación total
Diferencial: solo cambios desde último respaldo → más rápido
Incremental: cambios desde el último respaldo → ahorro de espacio

4. diferencia entre replicación y fragmentación 
Replicación:
Copia la BD en varios servidores
Mejora disponibilidad
Fragmentación:
Divide la BD en partes
Mejora rendimiento

5. importancia  de seguridad y disponibilidad de la información 
Seguridad: protege datos contra accesos no autorizados
Disponibilidad: asegura que los datos estén accesibles cuando se necesiten



reflexión 

1. ¿Qué unidad dominas con mayor seguridad?
La unidad I, correspondiente a la extracción de datos (DQL), ya que manejo con mayor facilidad la construcción de consultas SQL, el uso de JOINs, subconsultas y funciones de agregación para obtener información relevante de la base de datos.

2. ¿en cual necesitas mayor refuerzo ?
En la unidad II, programación procedimental, especialmente en la creación de procedimientos almacenados, funciones y triggers, debido a que requieren una lógica más estructurada y el uso correcto de delimitadores y variables.

3. ¿que actividades te resultan mas complejas y por que ?
Las actividades relacionadas con triggers y transacciones fueron las más complejas, ya que implican comprender el flujo de ejecución automática y garantizar la integridad de los datos mediante el uso adecuado de COMMIT y ROLLBACK, lo cual requiere mayor atención a los detalles y control de errores




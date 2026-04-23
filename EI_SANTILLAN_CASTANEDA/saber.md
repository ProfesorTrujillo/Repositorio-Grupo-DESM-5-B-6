# Examen - Bases de Datos

## 1. Diferencias entre INNER JOIN, LEFT JOIN y RIGHT JOIN (incluye ejemplo)

En SQL los JOIN sirven para unir tablas según una relación.

- **INNER JOIN**: solo muestra los registros que coinciden en ambas tablas.
- **LEFT JOIN**: muestra todos los registros de la tabla izquierda, aunque no tengan coincidencia en la derecha.
- **RIGHT JOIN**: muestra todos los registros de la tabla derecha, aunque no tengan coincidencia en la izquierda.

### Ejemplo

Supongamos dos tablas:

**Clientes**
| id_cliente | nombre |
|------------|--------|
| 1          | Juan   |
| 2          | Ana    |
| 3          | Luis   |

**Pedidos**
| id_pedido | id_cliente | producto |
|-----------|------------|----------|
| 1         | 1          | Tacos    |
| 2         | 2          | Burrito  |

#### INNER JOIN
```sql
SELECT c.nombre, p.producto
FROM Clientes c
INNER JOIN Pedidos p ON c.id_cliente = p.id_cliente;

Resultado: solo aparecen Juan y Ana.

LEFT JOIN
SELECT c.nombre, p.producto
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente;

Resultado: aparecen Juan, Ana y Luis (Luis con NULL).

RIGHT JOIN
SELECT c.nombre, p.producto
FROM Clientes c
RIGHT JOIN Pedidos p ON c.id_cliente = p.id_cliente;

Resultado: aparecen todos los pedidos aunque no tengan cliente.

2. Casos de uso de subconsultas en SELECT, FROM y WHERE

Las subconsultas son consultas dentro de otras consultas y sirven para hacer operaciones más complejas.

Subconsulta en SELECT

Se usa para agregar información calculada por cada fila.

SELECT nombre,
       (SELECT COUNT(*) FROM Pedidos p WHERE p.id_cliente = c.id_cliente) AS total_pedidos
FROM Clientes c;
Subconsulta en FROM

Se usa como una tabla temporal.

SELECT *
FROM (SELECT id_cliente, COUNT(*) AS total 
      FROM Pedidos 
      GROUP BY id_cliente) AS resumen;
Subconsulta en WHERE

Se usa para filtrar resultados.

SELECT nombre
FROM Clientes
WHERE id_cliente IN (SELECT id_cliente FROM Pedidos);
3. Función y utilidad de las funciones de agregación

Las funciones de agregación sirven para resumir datos y obtener estadísticas.

Las principales son:

COUNT() → cuenta registros
SUM() → suma valores
AVG() → calcula promedio
MAX() → valor máximo
MIN() → valor mínimo
Ejemplo
SELECT COUNT(*) AS total_pedidos,
       SUM(precio) AS total_ventas,
       AVG(precio) AS promedio
FROM Pedidos;

En general, se usan para analizar datos de manera rápida.

4. Diferencia entre índice y vista
Índice: es una estructura que se crea para mejorar la velocidad de búsqueda en una tabla. Funciona como el índice de un libro.
Vista: es una consulta guardada que se puede usar como si fuera una tabla.
Ejemplo de índice
CREATE INDEX idx_cliente
ON Clientes(nombre);
Ejemplo de vista
CREATE VIEW vista_clientes_pedidos AS
SELECT c.nombre, p.producto
FROM Clientes c
JOIN Pedidos p ON c.id_cliente = p.id_cliente;

En resumen:

índice = mejora rendimiento
vista = facilita consultas
5. Impacto positivo y negativo de los índices en el rendimiento
Impacto positivo
Aceleran las consultas SELECT
Mejoran búsquedas y filtros
Optimizan joins
Impacto negativo
Hacen más lentos los INSERT, UPDATE y DELETE
Ocupan espacio en disco
Demasiados índices pueden afectar el rendimiento

Conclusión: los índices son muy útiles, pero hay que usarlos solo cuando realmente se necesiten.

# Examen - Bases de Datos (SQL Procedimental)

## 1. Diferencia entre función y procedimiento almacenado

En SQL tanto las funciones como los procedimientos almacenados sirven para guardar lógica dentro de la base de datos, pero no son lo mismo.

- **Función**: siempre regresa un valor (por ejemplo un número o texto) y se puede usar dentro de consultas como si fuera parte de un SELECT.
- **Procedimiento almacenado**: no necesariamente regresa un valor, más bien ejecuta acciones como insertar, actualizar o eliminar datos.

En pocas palabras:
- función = devuelve un valor
- procedimiento = ejecuta procesos

---

## 2. Uso de variables y estructuras de control en SQL procedimental

En SQL procedimental se pueden usar variables y estructuras de control para hacer lógica más compleja.

### Variables
Sirven para guardar datos temporales dentro de un procedimiento o función.

```sql
DECLARE total INT;
SET total = 10;
Estructuras de control
IF: para tomar decisiones
IF total > 5 THEN
   SELECT 'Mayor a 5';
END IF;
WHILE: para repetir procesos
WHILE total > 0 DO
   SET total = total - 1;
END WHILE;
CASE: para evaluar múltiples condiciones
SELECT CASE 
         WHEN total > 5 THEN 'Alto'
         ELSE 'Bajo'
       END;

Estas estructuras permiten hacer lógica similar a la programación tradicional dentro de la base de datos.

3. ¿Qué problema resuelve un disparador (trigger)?

Un trigger sirve para ejecutar acciones automáticamente cuando ocurre un evento en la base de datos (INSERT, UPDATE o DELETE).

El problema que resuelve es evitar hacer esas acciones manualmente cada vez.

Por ejemplo:

actualizar automáticamente un stock
guardar historial de cambios
validar datos antes de insertarlos

Ejemplo:

CREATE TRIGGER actualizar_stock
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
   UPDATE Productos
   SET stock = stock - 1
   WHERE id_producto = NEW.id_producto;
END;
4. Importancia de las transacciones y propiedades ACID

Las transacciones sirven para agrupar varias operaciones en una sola unidad de trabajo. Esto es importante para mantener la integridad de los datos.

Las propiedades ACID garantizan que todo funcione correctamente:

Atomicidad: todo se ejecuta o nada se ejecuta
Consistencia: los datos siempre quedan en un estado válido
Aislamiento: las transacciones no interfieren entre sí
Durabilidad: los cambios se guardan aunque falle el sistema

En resumen, las transacciones evitan errores y pérdida de información.

5. Diferencia entre COMMIT y ROLLBACK
COMMIT: guarda definitivamente los cambios realizados en una transacción.
ROLLBACK: deshace los cambios si ocurrió algún error.
Ejemplo
START TRANSACTION;

UPDATE Cuentas SET saldo = saldo - 100 WHERE id = 1;
UPDATE Cuentas SET saldo = saldo + 100 WHERE id = 2;

COMMIT;

En resumen:

COMMIT = guardar cambios
ROLLBACK = deshacer cambios

# Examen - Seguridad y Administración de Bases de Datos

## 1. Diferencia entre usuario y perfil

En una base de datos, un **usuario** es la persona o cuenta que tiene acceso al sistema. Cada usuario tiene credenciales propias (usuario y contraseña).

Un **perfil** es un conjunto de permisos o reglas que se le asignan a uno o varios usuarios.

En pocas palabras:
- usuario = quién accede
- perfil = qué puede hacer ese usuario

---

## 2. ¿Qué es la granularidad de permisos?

La granularidad de permisos se refiere al nivel de detalle con el que se pueden asignar permisos dentro de la base de datos.

Esto significa que se puede controlar el acceso de forma muy específica, por ejemplo:
- a nivel de base de datos
- a nivel de tabla
- a nivel de columna
- incluso a nivel de fila (en algunos sistemas)

Entre más granularidad, más control se tiene sobre quién puede ver o modificar la información.

---

## 3. Tipos de respaldo y escenarios de uso

Los respaldos sirven para proteger la información en caso de fallos.

### Tipos de respaldo

- **Respaldo completo**: copia toda la base de datos.
  - Se usa cuando se quiere tener una copia total del sistema.

- **Respaldo incremental**: solo guarda los cambios desde el último respaldo.
  - Se usa para ahorrar espacio y tiempo.

- **Respaldo diferencial**: guarda los cambios desde el último respaldo completo.
  - Es un punto medio entre completo e incremental.

### Escenarios de uso
- Fallos del sistema
- Pérdida de datos
- Recuperación ante errores humanos
- Migración de información

---

## 4. Diferencia entre replicación y fragmentación

- **Replicación**: consiste en copiar la misma base de datos en varios servidores.
  - Se usa para mejorar disponibilidad y respaldo.

- **Fragmentación**: consiste en dividir la base de datos en partes más pequeñas.
  - Puede ser horizontal (filas) o vertical (columnas).
  - Se usa para mejorar el rendimiento y manejo de grandes volúmenes de datos.

En resumen:
- replicación = copiar datos
- fragmentación = dividir datos

---

## 5. Importancia de la seguridad y disponibilidad de la información

La seguridad y disponibilidad son fundamentales en una base de datos.

- **Seguridad**: protege la información contra accesos no autorizados, robos o modificaciones indebidas.
- **Disponibilidad**: asegura que los datos estén accesibles cuando se necesiten.

Si no hay seguridad, la información puede ser robada o alterada.
Si no hay disponibilidad, el sistema no puede funcionar correctamente.

En conclusión, ambas son clave para garantizar que los datos sean confiables y útiles.

# Reflexión Final - Bases de Datos

## 1. ¿Qué unidad domino con mayor seguridad?

La unidad que considero que domino con mayor seguridad es la de consultas SQL, especialmente todo lo relacionado con SELECT, JOIN y subconsultas. Siento que ya entiendo bien cómo relacionar tablas y obtener información específica, además de que puedo interpretar mejor los resultados.

---

## 2. ¿En cuál necesito mayor esfuerzo?

La parte en la que considero que necesito más esfuerzo es en SQL procedimental, como el uso de funciones, procedimientos almacenados y triggers. Aunque entiendo la lógica, todavía me cuesta aplicarla de manera rápida y sin errores.

---

## 3. ¿Qué actividades me resultaron más complejas y por qué?

Las actividades que más se me complicaron fueron las relacionadas con transacciones, triggers y optimización con índices. Esto porque requieren pensar más en cómo funciona la base de datos internamente y no solo en consultas simples.

También me costó un poco entender cuándo usar cada cosa (por ejemplo, cuándo usar un trigger o un procedimiento), ya que no siempre es tan directo.

En general, lo complejo fue pasar de hacer consultas básicas a manejar lógica más avanzada dentro de la base de datos.
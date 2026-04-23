Evidencia de Conocimiento: Dimensiones Conceptuales (Saber)
Alumno: Gael Antonio Reyes De Santos
Carrera: TSU en Desarrollo de Software Multiplataforma - UTA
Materia: Bases de Datos Avanzadas

Unidad I. Extracción de Datos (DQL)
1. Diferencias entre INNER JOIN, LEFT JOIN y RIGHT JOIN
INNER JOIN: Devuelve únicamente los registros que tienen coincidencias en ambas tablas. Si un envío no tiene un cliente asignado, no aparecerá.
LEFT JOIN: Devuelve todos los registros de la tabla izquierda (ej. Clientes) y las coincidencias de la derecha. Si un cliente no tiene envíos, mostrará NULL en los campos de envío.
RIGHT JOIN: Devuelve todos los registros de la tabla derecha (ej. Envíos) y las coincidencias de la izquierda. Es el inverso del LEFT JOIN.
2. Casos de uso de subconsultas en SELECT, FROM y WHERE
En SELECT: Para crear columnas calculadas basadas en otros datos (ej. traer el nombre de un gerente para cada fila de una sucursal).
En FROM: Para tratar el resultado de una consulta como si fuera una tabla temporal (Inline View).
En WHERE: Para filtrar registros basados en una condición externa (ej. buscar envíos con costo mayor al promedio: WHERE costo > (SELECT AVG...)).
3. Función y utilidad de las funciones de agregación
Permiten realizar cálculos sobre un conjunto de valores para devolver un solo resultado. Las principales son:

COUNT(): Cuenta registros.
SUM(): Suma valores numéricos.
AVG(): Calcula el promedio.
MAX() / MIN(): Encuentra los valores extremos.
4. Diferencias entre Índice y Vista
Índice: Es una estructura física en el disco que acelera la búsqueda de datos en una tabla. Es invisible para el usuario pero crucial para el rendimiento.
Vista: Es una consulta almacenada que actúa como una "tabla virtual". No guarda datos propios, solo sirve para simplificar consultas complejas o por seguridad.
Unidad II. Programación Procedimental con SQL
1. Diferencia entre función y procedimiento almacenado
Función: Debe retornar obligatoriamente un valor. Se puede usar dentro de un SELECT. No puede realizar cambios permanentes en el estado de la BD (DML complejo).
Procedimiento: No requiere retornar un valor. Se invoca con CALL. Puede ejecutar lógica compleja de negocio, transacciones y múltiples sentencias DML.
2. Uso de variables y estructuras de control
En SQL procedimental, las variables (declaradas con DECLARE) permiten almacenar estados temporales. Las estructuras de control (IF, CASE, WHILE) permiten que la base de datos tome decisiones lógicas sin depender de la aplicación (Backend).

3. ¿Qué problema resuelve un disparador (Trigger)?
Resuelve la necesidad de automatizar acciones ante eventos específicos (INSERT, UPDATE, DELETE). Es ideal para:

Mantener bitácoras de auditoría automáticamente.
Validar datos antes de que se guarden.
Sincronizar tablas relacionadas sin intervención del usuario.
4. Importancia de las transacciones y propiedades ACID
Las transacciones aseguran que una serie de operaciones se ejecuten como una sola unidad.

Atomicidad: O se hace todo o no se hace nada.
Consistencia: La BD pasa de un estado válido a otro.
Aislamiento: Las transacciones no se interfieren entre sí.
Durabilidad: Una vez confirmado (COMMIT), el cambio es permanente.
Unidad III. Gestión de Bases de Datos
1. Diferencia entre usuario y perfil
Usuario: Es la identidad individual (credenciales) que se conecta al servidor.
Perfil (Rol): Es una colección de privilegios. En lugar de asignar permisos uno por uno a cada usuario, se asignan al perfil y luego el usuario "hereda" ese perfil.
2. Granularidad de permisos
Se refiere al nivel de detalle con el que podemos restringir el acceso. Puede ser a nivel global, de base de datos, de tabla o incluso a nivel de columna específica.

3. Tipos de respaldo y escenarios de uso
Respaldo Completo (Full): Copia total de la BD. Se usa como base periódica (ej. semanal).
Respaldo Diferencial/Incremental: Solo guarda lo que cambió desde el último respaldo. Ahorra espacio y tiempo.
4. Diferencia entre replicación y fragmentación
Replicación: Copiar los mismos datos en varios servidores para que, si uno falla, el otro responda (Alta disponibilidad).
Fragmentación: Dividir una tabla enorme en partes más pequeñas distribuidas en diferentes discos o servidores para mejorar la velocidad de procesamiento (Escalabilidad).
Cierre reflexivo
¿Qué unidad dominas con mayor seguridad? Dominio conceptual de DQL y consultas multitabla, ya que la lógica de JOINs es fundamental para cualquier desarrollo.

¿En cuál necesitas mayor refuerzo? En la administración avanzada de seguridad y esquemas de fragmentación, debido a su complejidad técnica en entornos de producción masivos.

¿Qué actividades te resultaron más complejas y por qué? La implementación de Triggers con lógica de validación, ya que requieren un cuidado extremo para no generar bucles infinitos o afectar el rendimiento del servidor.

1. Diferencia entre función y procedimiento almacenado:
Una función es un bloque de código que siempre devuelve un valor y se puede usar dentro de consultas SQL. 
Un procedimiento almacenado es un conjunto de instrucciones que realiza acciones en la base de datos, como insertar o actualizar datos, pero no necesariamente devuelve un valor.

2. Uso de variables y estructuras de control en SQL:
Las variables se utilizan para almacenar datos temporales dentro de una función o procedimiento. 
Las estructuras de control, como IF, WHILE o CASE, permiten tomar decisiones y repetir procesos, haciendo que el código tenga lógica y control de flujo.

3. ¿Qué problema resuelve un trigger (disparador)?
Un trigger automatiza acciones en la base de datos cuando ocurre un evento como INSERT, UPDATE o DELETE. 
Sirve para evitar errores humanos, mantener la integridad de los datos y registrar cambios automáticamente.

4. Importancia de las transacciones y las propiedades ACID:
Las transacciones permiten agrupar varias operaciones en una sola unidad de trabajo. 
Las propiedades ACID garantizan:
- Atomicidad: todo se ejecuta o nada.
- Consistencia: los datos siempre son válidos.
- Aislamiento: las operaciones no interfieren entre sí.
- Durabilidad: los cambios se guardan permanentemente.

5. Diferencia entre COMMIT y ROLLBACK:
COMMIT se utiliza para guardar los cambios realizados en una transacción. 
ROLLBACK se utiliza para deshacer los cambios en caso de error.
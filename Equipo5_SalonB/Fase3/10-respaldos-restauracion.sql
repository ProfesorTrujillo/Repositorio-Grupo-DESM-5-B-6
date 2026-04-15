-- RESPALDO
mysqldump -u admin -p inventario_salon > respaldo.sql;

-- RESTAURACION
mysql -u admin -p inventario_salon < respaldo.sql;
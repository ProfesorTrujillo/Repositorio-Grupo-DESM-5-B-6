-- RESPALDO COMPLETO
mysqldump -u root -p corazon_floral > respaldo.sql

-- RESTAURACIÓN
mysql -u root -p corazon_floral < respaldo.sql
-- Comandos para ejecución en consola de sistema (Bash/CMD)
-- Generar Respaldo: 
-- mysqldump -u root -p --routines --triggers servimedica > respaldo_final_servimedica.sql

-- Restaurar Respaldo:
-- mysql -u root -p servimedica < respaldo_final_servimedica.sql
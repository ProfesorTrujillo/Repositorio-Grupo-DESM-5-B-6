SET GLOBAL log_bin = 'mysql-bin';

CREATE USER 'replicador'@'%' IDENTIFIED BY 'Replica2024!';
GRANT REPLICATION SLAVE ON *.* TO 'replicador'@'%';
CREATE USER IF NOT EXISTS 'username'@'localhost' IDENTIFIED BY 'actividadPuppetPassword';
CREATE DATABASE wordpress;
GRANT ALL ON *.* to 'username'@'localhost';
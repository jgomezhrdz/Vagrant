CREATE USER IF NOT EXISTS 'username'@'localhost' IDENTIFIED BY 'actividadPuppetPassword';
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL ON *.* to 'username'@'localhost';
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS estudiantes_db;
USE estudiantes_db;

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    contrasenia VARCHAR(255) NOT NULL,
    rol VARCHAR(20) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Crear usuario de aplicación
CREATE USER IF NOT EXISTS 'appuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON estudiantes_db.* TO 'appuser'@'localhost';
FLUSH PRIVILEGES;

-- Insertar usuario administrador (contraseña: admin123)
-- Hash generado con: new BCryptPasswordEncoder(12).encode("admin123")
INSERT INTO usuarios (nombre, email, contrasenia, rol, activo) 
VALUES ('Administrador', 'admin@universidad.edu', '$2a$12$X10WMk9nk1.kYzGOScs0yuK1NXSjOIeiLqMXqBRJ6y5o2U10qss5a', 'ROLE_ADMIN', 1)
ON DUPLICATE KEY UPDATE rol='ROLE_ADMIN';

-- Ver tabla de usuarios
SELECT * FROM usuarios;

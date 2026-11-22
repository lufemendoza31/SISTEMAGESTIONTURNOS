-- =========================================================================
-- PROYECTO: Sistema de Gestión de Turnos - OPAL / OPIN (Opain S.A.)
-- AUTORES: Luisa Fernanda Mendoza Peña - Fabian Morales
-- DESCRIPCIÓN: Script DDL y DML para la administración de personal y turnos.
-- =========================================================================

-- 1. Crear la base de datos
DROP DATABASE IF EXISTS sistema_turnos_opain;
CREATE DATABASE sistema_turnos_opain CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sistema_turnos_opain;

-- 2. Creación de Tablas (con restricciones de integridad referencial)

-- Tabla de Cargos / Roles en Operaciones y Seguridad
CREATE TABLE cargos (
    id_cargo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cargo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150),
    salario_base DECIMAL(10,2) NOT NULL
);

-- Tabla de Empleados
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    id_cargo INT NOT NULL,
    fecha_contratacion DATE NOT NULL,
    CONSTRAINT fk_empleado_cargo FOREIGN KEY (id_cargo)
        REFERENCES cargos(id_cargo)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

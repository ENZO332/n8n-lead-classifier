-- Crear base de datos
CREATE DATABASE leads_db;

-- Conectarse a la base
\c leads_db

-- Crear tabla
CREATE TABLE lead (
    id SERIAL PRIMARY KEY,
    message TEXT,
    categoria VARCHAR(10),
    prioridad INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear usuario
CREATE USER enzo WITH PASSWORD 'admin';

-- Permisos
GRANT ALL PRIVILEGES ON DATABASE leads_db TO enzo;
GRANT ALL PRIVILEGES ON TABLE lead TO enzo;
GRANT USAGE, SELECT ON SEQUENCE leads_id_seq TO enzo;

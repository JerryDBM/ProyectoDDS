CREATE DATABASE IF NOT EXISTS BD_entregas;
USE BD_entregas;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('cliente', 'conductor', 'admin') NOT NULL
);


-- CONDUCTORES
CREATE TABLE conductor (
    id_conductor INT PRIMARY KEY,
    ultima_latitud DECIMAL(10,8) NOT NULL,
    ultima_longitud DECIMAL(11,8) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,

    FOREIGN KEY (id_conductor)
    REFERENCES users(id)
    ON DELETE CASCADE
);

-- PEDIDOS
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,

    numero_pedido INT NOT NULL UNIQUE,

    barrio VARCHAR(100) NOT NULL,

    direccion TEXT,

    latitud_destino DECIMAL(10,8) NOT NULL,
    longitud_destino DECIMAL(11,8) NOT NULL,

    estado ENUM(
        'pendiente',
        'en_camino',
        'entregado',
        'cancelado'
    ) NOT NULL,

    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    user_id INT NOT NULL,

    id_conductor INT,

    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE,

    FOREIGN KEY (id_conductor)
    REFERENCES conductor(id_conductor)
    ON DELETE SET NULL
);

CREATE INDEX idx_user_id ON pedido(user_id);
-- CONDUCTORES

USE BD_entregas;

-- 1. Crear la tabla de clientes con los datos solicitados
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Modificar la tabla 'pedido' para conectar con 'clientes'
-- Primero agregamos la columna de la llave foránea
ALTER TABLE pedido 
ADD COLUMN id_cliente INT NOT NULL AFTER numero_pedido;

-- 3. Crear la relación (Foreign Key)
ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
ON DELETE CASCADE;

-- 4. (Opcional) Limpiar columnas redundantes en 'pedido' si existían
-- Si antes tenías campos de texto para el cliente en pedido, se eliminarían para usar los de la tabla nueva.

-- PEDIDO

select * from users
select * from pedido


ALTER TABLE bd_entregas.pedido MODIFY COLUMN numero_pedido VARCHAR(50) NOT NULL;

create database BD_entregas;
USE BD_entregas;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

INSERT INTO user (email, password)
VALUES ('test@test.com', '123456');

SELECT * FROM user;

drop table users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);
DROP TABLE pedidos;

CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_pedido INT NOT NULL,
    barrio VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    user_id INT,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO pedido (numero_pedido, barrio, estado, user_id) VALUES
(101, 'Centro', 'pendiente', 1),
(102, 'Norte', 'pendiente', 1),
(201, 'Sur', 'pendiente', 2),
(103, 'Occidente', 'entregado', 1);

DESCRIBE PEDIDO
SELECT * FROM users;

SELECT * FROM pedido;
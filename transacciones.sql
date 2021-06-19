--SAVEPOINT transaccion1;
BEGIN TRANSACTION;
INSERT INTO compra (cliente_id, fecha)
VALUES (1, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (9, (SELECT MAX(id) FROM compra), 5);
UPDATE producto SET stock = stock - 5 WHERE id = 9;
--ROLLBACK TO transaccion1;
COMMIT;
SELECT * FROM producto;

BEGIN TRANSACTION;
INSERT INTO compra (cliente_id, fecha)
VALUES (2, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (1, (SELECT MAX(id) FROM compra), 3);
UPDATE producto SET stock = stock - 3 WHERE id = 1;

INSERT INTO compra (cliente_id, fecha)
VALUES (2, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (2, (SELECT MAX(id) FROM compra), 3);
UPDATE producto SET stock = stock - 3 WHERE id = 2;

INSERT INTO compra (cliente_id, fecha)
VALUES (8, now());
INSERT INTO detalle_compra (producto_id, compra_id, cantidad)
VALUES (8, (SELECT MAX(id) FROM compra), 3);
UPDATE producto SET stock = stock - 3 WHERE id = 8;

COMMIT;
SELECT * FROM producto;

\set AUTOCOMMIT off
INSERT INTO cliente (nombre, email) values ('usuario24', 'usuario24@gmail.com');
SELECT * FROM cliente;
ROLLBACK;
SELECT * FROM cliente;
\set AUTOCOMMIT on
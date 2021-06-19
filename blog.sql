\c postgres;
DROP DATABASE blog;
-- 1. Crear base de datos llamada blog.
CREATE DATABASE blog;
\c blog;

-- 2. Crear las tablas indicadas de acuerdo al modelo de datos.

CREATE TABLE usuario(
    id INT,
    email VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE post(
    id INT,
    usuario_id INT,
    titulo VARCHAR,
    fecha DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(usuario_id) REFERENCES usuario(id)
);

CREATE TABLE comentarios(
    id INT,
    usuario_id INT,
    post_id INT,
    texto VARCHAR,
    fecha DATE,
    PRIMARY KEY(id),
    FOREIGN KEY(post_id) REFERENCES post(id),
    FOREIGN KEY(usuario_id) REFERENCES usuario(id)
);

-- 3. Insertar los siguientes registros

--  Datos para usuarios

INSERT INTO usuario(id, email)
VALUES (1,'usuario01@hotmail.com');

INSERT INTO usuario(id, email)
VALUES (2,'usuario02@gmail.com');

INSERT INTO usuario(id, email)
VALUES (3,'usuario03@gmail.com');

INSERT INTO usuario(id, email)
VALUES (4,'usuario04@hotmail.com');

INSERT INTO usuario(id, email)
VALUES (5,'usuario05@yahoo.com');

INSERT INTO usuario(id, email)
VALUES (6,'usuario06@hotmail.com');

INSERT INTO usuario(id, email)
VALUES (7,'usuario07@yahoo.com');

INSERT INTO usuario(id, email)
VALUES (8,'usuario08@yahoo..com');

INSERT INTO usuario(id, email)
VALUES (9,'usuario09@yahoo..com');

--  Datos para post

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (1,1,'Post 1: Esto es malo','2020-06-29');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (2,5 ,'Post 2: Esto es malo ','2020-06-29');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (3,1 ,'Post 3: Esto es excelente ','2020-06-29');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (4,9 ,'Post 4: Esto es bueno ','2020-06-29');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (5,7 ,'Post 5: Esto es bueno','2020-07-10');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (6,5 ,'Post 6: Esto es excelente','2020-07-10');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (7,8 ,'Post 7: Esto es excelente','2020-07-07');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (8,5 ,'Post 8: Esto es excelente','2020-05-14');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (9,2  ,'Post 9: Esto es bueno','2020-05-08');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (10 ,6 ,'Post 10: Esto es bueno ','2020-06-02');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (11 ,4 ,'Post 11: Esto es bueno','2020-05-05');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (12  ,9  ,'Post 12: Esto es malo','2020-07-23');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (13 ,5 ,'Post 13: Esto es excelente','2020-07-23');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (14 ,8 ,'Post 14: Esto es excelente','2020-05-01');

INSERT INTO post(id, usuario_id, titulo, fecha)
VALUES (15 ,7 ,'Post 14: Esto es excelente','2020-06-17');


--  Datos para comentarios

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (1 ,3 ,6,'Este es el comentario 1','2020-07-08');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (2 ,4 ,2,'Este es el comentario 2','2020-06-07');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (3,6,4,'Este es el comentario 4','2020-06-16');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (4 ,2,13,'Este es el comentario 5','2020-06-15');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (5 ,6 ,6,'Este es el comentario 5','2020-05-14');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (6 ,3 ,3,'Este es el comentario 6','2020-07-08');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (7 ,6 ,1,'Este es el comentario 7','2020-05-22');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (8 ,6 ,7,'Este es el comentario 8','2020-07-09');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (9 ,8 ,13,'Este es el comentario 9','2020-06-30');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (10 ,8 ,6,'Este es el comentario 10','2020-06-19');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (11 ,5 ,1,'Este es el comentario 11','2020-05-09');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (12 ,8 ,15,'Este es el comentario 12','2020-06-17');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (13 ,1  ,9,'Este es el comentario 13','2020-05-01');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (14 ,2 ,5,'Este es el comentario 14','2020-05-31');

INSERT INTO comentarios(id, usuario_id, post_id, texto, fecha)
VALUES (15 ,4 ,3,'Este es el comentario 15','2020-06-28');

SELECT * FROM comentarios;

-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5

SELECT email, post.id, titulo FROM post INNER JOIN usuario ON usuario.id = post.usuario_id WHERE usuario_id = 5;


SELECT B.email, A.id, A.titulo FROM post AS A INNER JOIN usuario AS B ON B.id =A.usuario_id WHERE A.usuario_id = 5;

SELECT A.email, B.id, B.titulo FROM usuario AS A INNER JOIN post AS B ON A.id =B.usuario_id WHERE B.usuario_id = 5;

-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
-- por el usuario con email usuario06@hotmail.com.

SELECT B.email, A.id, A.texto FROM comentarios AS A INNER JOIN usuario AS B ON B.id = A.usuario_id WHERE B.email != 'usuario06@hotmail.com';

-- 6. Listar los usuarios que no han publicado ningún post.

SELECT A.id, A.email FROM usuario AS A LEFT JOIN post AS B ON A.id=B.usuario_id WHERE B IS NULL;

-- Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
-- comentarios).
SELECT * FROM post LEFT JOIN comentarios ON post.id = comentarios.post_id;


SELECT * FROM usuario JOIN post ON usuario.id = post.usuario_id WHERE post.fecha BETWEEN '2020-06-01' AND '2020-06-30';

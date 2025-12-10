/* EJERCICIO 1 — BIBLIOTECA */
CREATE DATABASE biblioteca; USE biblioteca;

CREATE TABLE autores(
 id_autor INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100),
 nacionalidad VARCHAR(50)
);

CREATE TABLE libros(
 id_libro INT AUTO_INCREMENT PRIMARY KEY,
 titulo VARCHAR(150),
 anio_publicacion INT,
 id_autor INT,
 FOREIGN KEY(id_autor) REFERENCES autores(id_autor)
);

INSERT INTO autores(nombre,nacionalidad) VALUES
('Gabriel García Márquez','Colombiana'),
('Mario Vargas Llosa','Peruana'),
('Isabel Allende','Chilena');

INSERT INTO libros(titulo,anio_publicacion,id_autor) VALUES
('Cien años de soledad',1967,1),
('La ciudad y los perros',1963,2),
('La casa de los espíritus',1982,3);

SELECT * FROM autores;
SELECT * FROM libros;

SELECT libros.titulo,autores.nombre
FROM libros
JOIN autores ON libros.id_autor=autores.id_autor;



/* EJERCICIO 2 — SISTEMA DE VENTAS */
CREATE DATABASE ventas; USE ventas;

CREATE TABLE clientes(
 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100),
 correo VARCHAR(100)
);

CREATE TABLE productos(
 id_producto INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100),
 precio DECIMAL(10,2)
);

CREATE TABLE facturas(
 id_factura INT AUTO_INCREMENT PRIMARY KEY,
 id_cliente INT,
 id_producto INT,
 cantidad INT,
 fecha DATE,
 FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
 FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes(nombre,correo) VALUES
('Juan Pérez','juan@gmail.com'),
('Ana López','ana@gmail.com');

INSERT INTO productos(nombre,precio) VALUES
('Laptop',850.00),
('Mouse',15.00);

INSERT INTO facturas(id_cliente,id_producto,cantidad,fecha) VALUES
(1,1,1,'2025-01-01'),
(1,2,2,'2025-01-01'),
(2,2,1,'2025-01-02');

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM facturas;

SELECT clientes.nombre,productos.nombre,facturas.cantidad
FROM facturas
JOIN clientes ON facturas.id_cliente=clientes.id_cliente
JOIN productos ON facturas.id_producto=productos.id_producto;



/* EJERCICIO 3 — COLEGIO */
CREATE DATABASE colegio; USE colegio;

CREATE TABLE estudiantes(
 id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100),
 edad INT
);

CREATE TABLE cursos(
 id_curso INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100),
 profesor VARCHAR(100)
);

CREATE TABLE matriculas(
 id_matricula INT AUTO_INCREMENT PRIMARY KEY,
 id_estudiante INT,
 id_curso INT,
 fecha DATE,
 FOREIGN KEY(id_estudiante) REFERENCES estudiantes(id_estudiante),
 FOREIGN KEY(id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO estudiantes(nombre,edad) VALUES
('Carlos Gómez',15),
('María Ruiz',16);

INSERT INTO cursos(nombre,profesor) VALUES
('Matemáticas','Prof. Sánchez'),
('Historia','Prof. Torres');

INSERT INTO matriculas(id_estudiante,id_curso,fecha) VALUES
(1,1,'2025-01-10'),
(2,2,'2025-01-10');

SELECT * FROM estudiantes;
SELECT * FROM cursos;
SELECT * FROM matriculas;

SELECT estudiantes.nombre,cursos.nombre,matriculas.fecha
FROM matriculas
JOIN estudiantes ON matriculas.id_estudiante=estudiantes.id_estudiante
JOIN cursos ON matriculas.id_curso=cursos.id_curso;

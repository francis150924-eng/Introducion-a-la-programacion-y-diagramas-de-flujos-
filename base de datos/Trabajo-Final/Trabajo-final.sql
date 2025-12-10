-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS sistema_academico;
USE sistema_academico;

-- Tabla Departamento
CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Estudiante
CREATE TABLE estudiante (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Tabla Profesor
CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Tabla Curso
CREATE TABLE curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor)
);

-- Tabla Clase
CREATE TABLE clase (
    id_clase INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    horario VARCHAR(50),
    aula VARCHAR(20),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

-- Tabla Inscripción
CREATE TABLE inscripcion (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT,
    id_clase INT,
    fecha DATE,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_clase) REFERENCES clase(id_clase)
);

-- Tabla Calificación
CREATE TABLE calificacion (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT,
    nota DECIMAL(5,2),
    FOREIGN KEY (id_inscripcion) REFERENCES inscripcion(id_inscripcion)
);

-- Insertar departamentos
INSERT INTO departamento (nombre) VALUES
('Ciencias'),
('Ingeniería'),
('Humanidades');

-- Insertar estudiantes
INSERT INTO estudiante (nombre, apellido, id_departamento) VALUES
('Ana', 'López', 1),
('Carlos', 'Martínez', 2),
('Lucía', 'Gómez', 3);

-- Insertar profesores
INSERT INTO profesor (nombre, apellido, id_departamento) VALUES
('Mario', 'Pérez', 1),
('Laura', 'Torres', 2);

-- Insertar cursos
INSERT INTO curso (nombre, id_profesor) VALUES
('Biología I', 1),
('Programación I', 2);

-- Insertar clases
INSERT INTO clase (id_curso, horario, aula) VALUES
(1, 'Lunes 8 AM', 'A1'),
(2, 'Martes 10 AM', 'B2');

-- Insertar inscripciones
INSERT INTO inscripcion (id_estudiante, id_clase, fecha) VALUES
(1, 1, '2025-01-15'),
(2, 2, '2025-01-16');

-- Insertar calificaciones
INSERT INTO calificacion (id_inscripcion, nota) VALUES
(1, 95.5),
(2, 87.0);

-- Consulta: estudiantes con su departamento
SELECT e.nombre, e.apellido, d.nombre AS departamento
FROM estudiante e
JOIN departamento d ON e.id_departamento = d.id_departamento;

-- Consulta: cursos con su profesor
SELECT c.nombre AS curso, p.nombre AS profesor
FROM curso c
JOIN profesor p ON c.id_profesor = p.id_profesor;

-- Consulta: promedio de calificaciones por estudiante
SELECT e.nombre, AVG(ca.nota) AS promedio
FROM calificacion ca
JOIN inscripcion i ON ca.id_inscripcion = i.id_inscripcion
JOIN estudiante e ON i.id_estudiante = e.id_estudiante
GROUP BY e.id_estudiante;

-- Consulta: cantidad de estudiantes por departamento
SELECT d.nombre AS departamento, COUNT(e.id_estudiante) AS cantidad
FROM departamento d
LEFT JOIN estudiante e ON d.id_departamento = e.id_departamento
GROUP BY d.id_departamento;

-- Consulta: top 5 mejores promedios
SELECT e.nombre, AVG(ca.nota) AS promedio
FROM estudiante e
JOIN inscripcion i ON e.id_estudiante = i.id_estudiante
JOIN calificacion ca ON ca.id_inscripcion = i.id_inscripcion
GROUP BY e.id_estudiante
ORDER BY promedio DESC
LIMIT 5;

-- Actualizar un estudiante
UPDATE estudiante
SET apellido = 'Ramírez'
WHERE id_estudiante = 1;

-- Eliminar una calificación
DELETE FROM calificacion
WHERE id_calificacion = 1;




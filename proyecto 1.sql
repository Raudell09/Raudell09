CREATE DATABASE PARQUE_RECREATIVO;

USE PARQUE_RECREATIVO;

CREATE TABLE Atracciones (
    id_atraccion INT PRIMARY KEY, 
    nombre VARCHAR(100),
    capacidad INT
);

CREATE TABLE Visitantes (
    id_visitante INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad VARCHAR(5)
);

CREATE TABLE Entradas ( 
    id_entrada INT PRIMARY KEY,
    fecha DATE,
    id_visitante1 INT,
    FOREIGN KEY (id_visitante1) REFERENCES Visitantes(id_visitante)
);

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    puesto VARCHAR(50),
    id_atraccion1 INT,
    FOREIGN KEY (id_atraccion1) REFERENCES Atracciones(id_atraccion)
);

CREATE TABLE Eventos (
    id_evento INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha DATE
);

insertando 10 registró en cada tabla 

INSERT INTO Atracciones (id_atraccion, nombre, capacidad) VALUES 
(1, 'Montaña Rusa', 20),
(2, 'Carrusel', 30),
(3, 'Casa del Terror', 15),
(4, 'Rueda de la Fortuna', 25),
(5, 'Tirolesa', 10),
(6, 'Splash', 20),
(7, 'Bumper Cars', 25),
(8, 'Torre de Caída', 15),
(9, 'Simulador', 10),
(10, 'Labertinto', 50);

INSERT INTO Visitantes (id_visitante, nombre, edad) VALUES 
(1, 'Juan Perez', '25'),
(2, 'Maria Lopez', '30'),
(3, 'Luis Gomez', '22'),
(4, 'Ana Torres', '27'),
(5, 'Anyelina Mateo ', '28'),
(6, 'Laura Ramos', '24'),
(7, 'Miguel Diaz', '21'),
(8, 'Sofia Morales', '29'),
(9, 'Diego Ruiz', '26'),
(10, 'Xaviel Mercedes ', '23');


INSERT INTO Entradas (id_entrada, fecha, id_visitante1) VALUES 
(1, '2024-05-04', 1),
(2, '2024-07-01', 2),
(3, '2022-03-01', 3),
(4, '2024-09-02', 4),
(5, '2024-08-13', 5),
(6, '2024-07-03', 6),
(7, '2024-08-03', 7),
(8, '2024-02-03', 8),
(9, '2024-01-04', 9),
(10, '2024-10-04', 10);

INSERT INTO Empleados (id_empleado, nombre, puesto, id_atraccion1) VALUES 
(1, 'Pedro Martinez', 'Operador', 1),
(2,'Lucia Hernandez','Mantenimiento',2),
(3, 'Javier Suarez', 'Supervisor', 3),
(4, 'Elena Castro', 'Vigilancia', 4),
(5, 'Roberto Fernandez', 'Operador', 5),
(6, 'Natalia Ramirez', 'Mantenimiento', 6),
(7, 'Fernando Torres', 'Supervisor', 7),
(8, 'Claudia Vega', 'Vigilancia', 8),
(9, 'Pablo Jimenez', 'Operador', 9),
(10, 'Andrea Salinas', 'Mantenimiento', 10);

INSERT INTO Eventos (id_evento, nombre, fecha) VALUES 
(1, 'Festival de Verano', '2024-07-15'),
(2, 'Noche de Terror', '2024-10-31'),
(3, 'Carrera de Carros', '2024-08-20'),
(4, 'Concierto en Vivo', '2024-09-10'),
(5, 'Día de los Niños', '2024-04-30'),
(6, 'Competencia de niños', '2024-06-05'),
(7, 'Show de Magia', '2024-11-25'),
(8, 'Feria de Navidad', '2024-12-24'),
(9, 'Fuegos Artificiales', '2024-07-04'),
(10, 'Maratón', '2024-05-22');




Tablas en general
SELECT * FROM Atracciones;
SELECT * FROM Visitantes;
SELECT * FROM Entradas;
SELECT * FROM Empleados;
SELECT * FROM Eventos;

Obtener los visitantes y las entradas que compraron

SELECT 
    v.id_visitante, 
    v.nombre, 
    e.id_entrada, 
    e.fecha
FROM 
    Visitantes v
JOIN 
    Entradas e ON v.id_visitante = e.id_visitante1;

Obtener los empleados y las atracciones en las que trabajan

SELECT 
    e.id_empleado, 
    e.nombre, 
    e.puesto, 
    a.id_atraccion, 
    a.nombre AS atraccion_nombre
FROM 
    Empleados e
JOIN 
    Atracciones a ON e.id_atraccion1 = a.id_atraccion;


Obtener todas las entradas vendidas en un rango de fechas específico

SELECT 
    * 
FROM 
    Entradas
WHERE 
    fecha BETWEEN '2024-01-01' AND '2024-12-31';

Obtener el número de entradas vendidas por cada visitante

SELECT 
    v.id_visitante, 
    v.nombre, 
    COUNT(e.id_entrada) AS total_entradas
FROM 
    Visitantes v
LEFT JOIN 
    Entradas e ON v.id_visitante = e.id_visitante1
GROUP BY 
    v.id_visitante, 
    v.nombre;

Obtener el listado de empleados por puesto

SELECT 
    puesto, 
    nombre 
FROM 
    Empleados
ORDER BY 
    puesto;

Obtener el listado de eventos en una fecha específica

SELECT 
    * 
FROM 
    Eventos
WHERE 
    fecha = '2024-07-15';
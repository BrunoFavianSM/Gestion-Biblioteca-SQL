-- SCRIPTS SQL

-- Crear tabla AUTORES
CREATE TABLE autores (
autor_id NUMBER PRIMARY KEY,
nombre VARCHAR2(100) NOT NULL,
apellido VARCHAR2(100) NOT NULL,
fecha_nacimiento DATE
);

-- Crear tabla CATEGORIAS

CREATE TABLE categorias (
categoria_id NUMBER PRIMARY KEY,
nombre VARCHAR2(50) NOT NULL
);

-- Crear tabla LIBROS
CREATE TABLE libros (
libro_id NUMBER PRIMARY KEY,
titulo VARCHAR2(200) NOT NULL,
autor_id NUMBER,
anio_publicacion NUMBER(4),
precio NUMBER(10,2),
CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

-- Crear tabla intermedia LIBROS_CATEGORIAS
CREATE TABLE libros_categorias (
libro_id NUMBER,
categoria_id NUMBER,
CONSTRAINT pk_libros_categorias PRIMARY KEY (libro_id, categoria_id),
CONSTRAINT fk_libro FOREIGN KEY (libro_id) REFERENCES libros(libro_id),
CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES
categorias(categoria_id)
);

-- Crear tabla CLIENTES
CREATE TABLE clientes (
cliente_id NUMBER PRIMARY KEY,

nombre VARCHAR2(100) NOT NULL,
apellido VARCHAR2(100) NOT NULL,
email VARCHAR2(100) UNIQUE,
fecha_registro DATE DEFAULT SYSDATE
);

-- Crear tabla VENTAS
CREATE TABLE ventas (
venta_id NUMBER PRIMARY KEY,
cliente_id NUMBER,
libro_id NUMBER,
fecha_venta DATE DEFAULT SYSDATE,
cantidad NUMBER(3) DEFAULT 1,
CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES
clientes(cliente_id),
CONSTRAINT fk_libro_venta FOREIGN KEY (libro_id) REFERENCES
libros(libro_id)
);

-- Secuencias para los IDs
CREATE SEQUENCE seq_autor_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_categoria_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_libro_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_cliente_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_venta_id START WITH 1 INCREMENT BY 1;

-- REGISTROS

-- Insertar datos en AUTORES

INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Gabriel', 'García Márquez',TO_DATE('1927-03-06', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Jane', 'Austen', TO_DATE('1775-12-16', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'George', 'Orwell', TO_DATE('1903-06-25', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Virginia', 'Woolf', TO_DATE('1882-01-25', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Haruki', 'Murakami',TO_DATE('1949-01-12', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Isabel', 'Allende', TO_DATE('1942-08-02', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Stephen', 'King', TO_DATE('1947-09-21', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Agatha', 'Christie',TO_DATE('1890-09-15', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Jorge Luis', 'Borges',TO_DATE('1899-08-24', 'YYYY-MM-DD'));
INSERT INTO autores VALUES (seq_autor_id.NEXTVAL, 'Julio', 'Cortázar', TO_DATE('1914-08-26', 'YYYY-MM-DD'));

-- Insertar datos en CATEGORIAS
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Ficción');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'No ficción');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Misterio');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Ciencia ficción');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Romance');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Fantasía');

INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Biografía');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Historia');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Poesía');
INSERT INTO categorias VALUES (seq_categoria_id.NEXTVAL, 'Ensayo');

-- Insertar datos en LIBROS
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'Cien años de soledad', 1, 1967,25.99);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'Orgullo y prejuicio', 2, 1813, 15.50);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, '1984', 3, 1949, 18.75);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'Al faro', 4, 1927, 20.25);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'Tokio blues', 5, 1987, 22.00);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'La casa de los espíritus', 6, 1982,23.50);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'It', 7, 1986, 28.99);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'Asesinato en el Orient Express', 8,1934, 16.80);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'El Aleph', 9, 1949, 19.99);
INSERT INTO libros VALUES (seq_libro_id.NEXTVAL, 'Rayuela', 10, 1963, 21.50);

-- Insertar datos en LIBROS_CATEGORIAS
INSERT INTO libros_categorias VALUES (1, 1);
INSERT INTO libros_categorias VALUES (2, 5);
INSERT INTO libros_categorias VALUES (3, 4);
INSERT INTO libros_categorias VALUES (4, 1);

INSERT INTO libros_categorias VALUES (5, 1);
INSERT INTO libros_categorias VALUES (6, 1);
INSERT INTO libros_categorias VALUES (7, 6);
INSERT INTO libros_categorias VALUES (8, 3);
INSERT INTO libros_categorias VALUES (9, 1);
INSERT INTO libros_categorias VALUES (10, 1);

-- Insertar datos en CLIENTES
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Ana', 'García','ana.garcia@email.com', TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Carlos', 'Rodríguez','carlos.rodriguez@email.com', TO_DATE('2023-02-20', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'María', 'López','maria.lopez@email.com', TO_DATE('2023-03-10', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Juan', 'Martínez','juan.martinez@email.com', TO_DATE('2023-04-05', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Laura', 'Sánchez','laura.sanchez@email.com', TO_DATE('2023-05-12', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Pedro', 'Gómez','pedro.gomez@email.com', TO_DATE('2023-06-18', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Sofía', 'Fernández','sofia.fernandez@email.com', TO_DATE('2023-07-22', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Diego', 'Torres','diego.torres@email.com', TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Elena', 'Ruiz','elena.ruiz@email.com', TO_DATE('2023-09-14', 'YYYY-MM-DD'));
INSERT INTO clientes VALUES (seq_cliente_id.NEXTVAL, 'Javier', 'Hernández','javier.hernandez@email.com', TO_DATE('2023-10-25', 'YYYY-MM-DD'));

-- Insertar datos en VENTAS
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 1, 1, TO_DATE('2024-01-05', 'YYYY-MM-DD'), 1);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 2, 3, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 2);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 3, 5, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 4, 2, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 1);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 5, 7, TO_DATE('2024-01-25', 'YYYY-MM-DD'), 3);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 6, 4, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 1);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 7, 9, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 2);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 8, 6, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 1);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 9, 8, TO_DATE('2024-02-15', 'YYYY-MM-DD'), 1);
INSERT INTO ventas VALUES (seq_venta_id.NEXTVAL, 10, 10, TO_DATE('2024-02-20','YYYY-MM-DD'), 2);

-- Da permisos para solicitar datos en Netbeans
GRANT SELECT, INSERT, UPDATE, DELETE ON VENTAS TO biblioteca;

--CONSULTAS

-- COUNT - CONTAR
-- GROUP BY - AGRUPAR POR
-- HAVING - trabaja con WHERE (condicional)
-- NULL - Vacio o Nul (no tienen nada)
-- FETCH FISRT 1 = Filtrar por indicador

-- Da permisos para solicitar datos en Netbeans
GRANT SELECT, INSERT, UPDATE, DELETE ON REPORTE_VENTAS TO biblioteca;


-- 1 Listar todos los libros publicados en los últimos 5 años.
SELECT titulo, anio_publicacion
FROM libros
WHERE anio_publicacion >= EXTRACT(YEAR FROM SYSDATE) - 5
ORDER BY anio_publicacion DESC;

-- 2 Mostrar los autores que tienen más de 3 libros en la base de datos.

SELECT a.nombre , a.apellido, COUNT(*) as num_libros
FROM autores a
JOIN libros l ON a.autor_id = l.autor_id
GROUP BY a.autor_id, a.nombre , a.apellido
HAVING COUNT (*) > 3;


-- 3 Encontrar los clientes que han comprado libros de más de una categoría.
SELECT l.titulo
FORM libros l
LEFT JOIN ventas v ON l.libro_id = v.libro_id
WHERE v.libro_id IS NULL;

-- 4 Listar los libros que nunca se han vendido.
SELECT l.libro_id, l.titulo, a.nombre
FROM libros l
LEFT JOIN ventas v ON l.libro_id = v.libro_id
LEFT JOIN autores a ON l.autor_id = a.autor_id
WHERE v.venta_id IS NULL;

-- 6 Encontrar el cliente que ha gastado más dinero en libros.
SELECT *
FROM (
SELECT c.nombre, c.apellido, SUM(l.precio * v.cantidad) AS total_gastado
FORM clientes c
JOIN ventas v ON c.cliente_id = v.cliente_id
JOIN libros l ON v.libro_id = l.libro_id
GROUP BY c.cliente, c.nombre, c.apellido
ORDER BY total_gastado DESC
)

DROP TABLE CATEGORIAS













-- Mostrar todos los libros en orden descendente
SELECT *
FROM libros
ORDER BY titulo DESC;

-- Mostrar libro, precio, el nombre del autor y la fecha de nacimiento del autor
SELECT libros.titulo, libros.precio autores.nombre, autores.fecha_nacimiento
FROM libros l
JOIN autores ON libros.autor_id = autores.autor_id

SELECT l.titulo, 
       l.precio, 
       a.nombre, 
       a.apellido, 
       a.fecha_nacimiento
FROM libros l
JOIN autores a ON l.autor_id = a.autor_id;

-- Mostar el id venta, nombre del cliene, nombre del libro que compro el cliente y la fecha que se realizo la venta
SELECT ventas.venta_id, clientes.nombre, clientes.apellido, libros.titulo, ventas.fecha_venta
FROM ventas
JOIN clientes ON ventas.cliente_id = clientes.cliente_id
JOIN libros ON ventas.libro_id = libros.libro_id
WHERE ventas.cliente_id = clientes.cliente_id;

DELETE FROM LIBROS

-- FUNCIONES

CREATE OR REPLACE FUNCTION welcome_msg_func (p_name IN VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
RETURN ('Welcome '|| p_name);
END;
/

CREATE OR REPLACE FUNCTION CALCULAR_PROMEDIO (NOTA1 NUMBER , NOTA2 NUMBER ) 
RETURN NUMBER 
IS
  promedio NUMBER;
BEGIN
  promedio := (nota1 + nota2) / 2;
  RETURN promedio;
END CALCULAR_PROMEDIO;

SELECT calcular_promedio(18, 13) AS resultado FROM dual;

SELECT UPPER (NOMBRE) FROM AUTORES;
SELECT LOWER (NOMBRE) FROM AUTORES;

SELECT NOMBRE, LENGTH (NOMBRE) FROM AUTORES;
SELECT SUM (PRECIO) FROM LIBROS;
SELECT AVG (CANTIDAD) FROM VENTAS;
SELECT SYSDATE FROM DUAL;
SELECT TO_DATE ('2024-09-18', 'YYYY-MM-DD') FROM DUAL;

SELECT PRECIO,
      CASE
          WHEN PRECIO > 18 THEN 'Muy Alto'
          WHEN PRECIO > 17 THEN 'Regular'
          ELSE 'Bajo'
    END AS nivel_libro
FROM LIBROS;

SELECT AUTORES, 
  DECODE(AÑOS_DE_PUBLICACION, '1967') 
  AS equipo
FROM LIBROS;









CREATE TABLE reporte_ventas (
  venta_id NUMBER PRIMARY KEY,
  fecha_venta DATE,
  titulo_libro VARCHAR2(200),
  nombre_cliente VARCHAR2(100),
  cantidad NUMBER(3)
);

INSERT INTO reporte_ventas (venta_id, fecha_venta, titulo_libro, nombre_cliente, cantidad)
SELECT 
  v.venta_id,
  v.fecha_venta,
  l.titulo,
  c.nombre || ' ' || c.apellido AS nombre_cliente,
  v.cantidad
FROM 
  ventas v
JOIN 
  libros l ON v.libro_id = l.libro_id
JOIN 
  clientes c ON v.cliente_id = c.cliente_id;
  

SELECT v.fecha_venta, v.venta_id, l.titulo, c.nombre AS nombre_cliente, v.cantidad
FROM ventas v
JOIN libros l ON v.libro_id = l.titulo
JOIN clientes c ON v.cliente_id = c.cliente_id;



SELECT v.fecha_venta, l.titulo, c.nombre, v.cantidad
FROM ventas v
JOIN libros l ON v.libro_id = l.libro_id
JOIN clientes c ON v.cliente_id = c.cliente_id;


SELECT a.nombre || ' ' || a.apellido AS nombre_autor, c.nombre AS categoria,l.precio
FROM libros l
JOIN autores a ON l.autor_id = a.autor_id
JOIN libros_categorias lc ON l.libro_id = lc.libro_id
JOIN categorias c ON lc.categoria_id = c.categoria_id;

--ENTREGABLE 2

SELECT a.nombre, c.nombre, l.precio
FROM libros l
JOIN autores a ON l.autor_id = a.autor_id
JOIN libros_categorias lc ON l.libro_id = lc.libro_id
JOIN categorias c ON lc.categoria_id = c.categoria_id;

SELECT v.fecha_venta, l.titulo, c.nombre , a.nombre , cl.nombre, cl.apellido
FROM ventas v
JOIN libros l ON v.libro_id = l.libro_id
JOIN autores a ON l.autor_id = a.autor_id
JOIN libros_categorias lc ON l.libro_id = lc.libro_id
JOIN categorias c ON lc.categoria_id = c.categoria_id
JOIN clientes cl ON v.cliente_id = cl.cliente_id;


--FIXED

SELECT a.nombre AS nombre_autor, c.nombre AS nombre_categoria, l.precio 
FROM libros l
JOIN autores a ON l.autor_id = a.autor_id
JOIN libros_categorias lc ON l.libro_id = lc.libro_id
JOIN categorias c ON lc.categoria_id = c.categoria_id;


SELECT v.fecha_venta, l.titulo, c.nombre AS nombre_categoria, 
a.nombre AS nombre_autor, cl.nombre AS nombre_cliente, cl.apellido 
FROM ventas v 
JOIN libros l ON v.libro_id = l.libro_id 
JOIN autores a ON l.autor_id = a.autor_id 
JOIN libros_categorias lc ON l.libro_id = lc.libro_id 
JOIN categorias c ON lc.categoria_id = c.categoria_id 
JOIN clientes cl ON v.cliente_id = cl.cliente_id;


SELECT 
    v.fecha_venta,
    l.titulo AS libro_vendido,
    c.nombre AS categoria,
    a.nombre AS autor,
    a.apellido AS apellido_autor,
    cl.nombre AS nombre_cliente,
    cl.apellido AS apellido_cliente
FROM 
    ventas v
JOIN 
    libros l ON v.libro_id = l.libro_id
JOIN 
    autores a ON l.autor_id = a.autor_id
JOIN 
    libros_categorias lc ON l.libro_id = lc.libro_id
JOIN 
    categorias c ON lc.categoria_id = c.categoria_id
JOIN 
    clientes cl ON v.cliente_id = cl.cliente_id;

SELECT 
    v.fecha_venta,
    l.titulo AS libro_vendido,
    c.nombre AS categoria,
    a.nombre || ' ' || a.apellido AS autor,
    cl.nombre || ' ' || cl.apellido AS cliente
FROM 
    ventas v
JOIN 
    libros l ON v.libro_id = l.libro_id
JOIN 
    autores a ON l.autor_id = a.autor_id
JOIN 
    libros_categorias lc ON l.libro_id = lc.libro_id
JOIN 
    categorias c ON lc.categoria_id = c.categoria_id
JOIN 
    clientes cl ON v.cliente_id = cl.cliente_id;








# TIENDA

USE tienda;
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.09 FROM producto;
SELECT nombre AS 'nom de "producto"', precio AS euros, precio * 1.09 AS "dòlars nord-americans" FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) FROM fabricante;               #LEFT o SUBSTRING
SELECT nombre, ROUND(precio) FROM producto;              #FLOOR per arrodonir a la baixa (truncar) i CEIL a l'alça.
SELECT nombre, FLOOR(precio) FROM producto; 
SELECT f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;              #la f és de fabricante i la p de producto
SELECT DISTINCT f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;               #no he necessitat GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.codigo = 2;
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre;
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio LIMIT 1;
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT * FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'crucial' AND p.precio > 200;
SELECT * FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'seagate';
SELECT * FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('asus', 'Hewlett-Packard', 'seagate');
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE RIGHT(f.nombre, 1) = 'e';                # CONSULTA 30
SELECT p.nombre, p.precio, f.nombre FROM producto p WHERE p.codigo_fabricante IN ( SELECT codigo FROM fabricante WHERE RIGHT(nombre, 1) = 'e');              # CONSULTA 30
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.*, p.nombre FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo;
SELECT f.* FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante IS NULL;
SELECT p.* FROM producto p WHERE p.codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'lenovo');
SELECT p.* FROM producto p WHERE p.precio = (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'lenovo'));
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;
SELECT p.* FROM producto p WHERE p.precio >= (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'lenovo'));
SELECT p.*, f.nombre as nombre_fabricante, (SELECT AVG(precio) FROM producto) as precio_medio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE LOWER(f.nombre) = 'asus';              #Mostra tots els productes del fabricant asus amb els seus corresponents preus
SELECT AVG(precio) as precio_medio FROM producto;               #Mostra el preu mitjà de tots els productes
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE LOWER(f.nombre) = 'asus' AND p.precio > (SELECT AVG(precio) FROM producto);              #No hi  ha cap producte d'asus amb un preu superior al de la mitja de tots els productes.

# UNIVERSIDAD

USE universidad;
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom alumne' FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT p.nombre AS 'nom alumne' , p.apellido1 AS 'primer cognom', p.apellido2  AS 'segon cognom' FROM persona p WHERE  p.tipo = 'alumno' AND p.telefono IS NULL;
SELECT p.* FROM persona p WHERE YEAR(p.fecha_nacimiento) = 1999;
SELECT pr.id_profesor AS 'id professor', p.nombre AS 'nom professor', p.apellido1 AS 'primer cognom', p.nif AS 'NIF professor' FROM profesor pr JOIN persona p ON pr.id_profesor = p.id WHERE p.telefono IS NULL AND RIGHT(p.nif, 1) = 'K'; 
SELECT a.* FROM asignatura a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;
SELECT p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', p.nombre AS 'nom professor', d.nombre AS 'nom departament' FROM persona p JOIN profesor pr ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre AS 'nom assignatura', ce.anyo_inicio AS 'any inici curs escolar', ce.anyo_fin AS 'any finalització curs escolar', p.nombre AS 'nom alumne', p.nif AS 'NIF alumne' FROM alumno_se_matricula_asignatura asma JOIN persona p ON p.id = asma.id_alumno JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar JOIN asignatura a ON a.id = asma.id_asignatura WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre AS 'nom departament' FROM departamento d JOIN profesor pr ON pr.id_departamento = d.id JOIN grado g ON g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.nombre AS 'nom alumne' FROM persona p JOIN alumno_se_matricula_asignatura asma ON asma.id_alumno = p.id JOIN asignatura a ON a.id = asma.id_asignatura JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin = '2019';

#LEFT JOIN & RIGHT JOIN

SELECT d.nombre AS 'nom dept.', p.apellido1, p.apellido2, p.nombre AS 'nom professor/a' FROM persona p LEFT JOIN profesor pr ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.nombre AS 'nom professor' FROM profesor pr LEFT JOIN departamento d ON d.id = pr.id_departamento JOIN persona p ON p.id = pr.id_profesor WHERE pr.id_departamento IS NULL;
SELECT d.nombre AS 'nom dept' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_departamento IS NULL;
SELECT p.nombre AS 'nom professor' FROM profesor pr LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor JOIN persona p ON p.id = pr.id_profesor WHERE a.id_profesor IS NULL;
SELECT a.nombre AS 'nom assignatura' FROM asignatura a LEFT JOIN profesor pr ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

# CONSULTES RESUM

SELECT COUNT(*) AS 'nombre total alumnes' FROM persona p WHERE p.tipo = 'alumno';
SELECT COUNT(p.tipo = 'alumno') AS 'nombre total alumnes nascuts al 1999' FROM persona p WHERE YEAR(p.fecha_nacimiento) = 1999; 
SELECT d.nombre AS 'nom departament', COUNT(pr.id_profesor) AS 'total professors' FROM departamento d RIGHT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.id, d.nombre ORDER BY 'total professors' DESC;
SELECT d.nombre AS 'nom departament', COUNT(pr.id_profesor) AS 'total professors' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.id, d.nombre ORDER BY 'total professors' DESC;
SELECT g.id, g.nombre AS 'nom graus', COUNT(a.id) AS 'total assignatures' FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, g.id ORDER BY 'total assignatures' DESC;
SELECT g.id, g.nombre AS 'nom graus', COUNT(a.id) AS 'total assignatures' FROM grado g RIGHT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, g.id HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) > 40 DESC;
SELECT g.nombre AS 'nom grau', a.tipo AS "tipus d'assignatura", SUM(a.creditos) AS "nombre total de crèdits segons tipus d'assignatura i grau" FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo;
SELECT ce.anyo_inicio AS 'any inici curs escolar', COUNT(DISTINCT asma.id_alumno) AS 'nombre alumnes matriculats aquest any' FROM alumno_se_matricula_asignatura asma JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT pr.id_profesor AS 'id professor', p.nombre AS 'nom professor', p.apellido1 AS 'primer cognom', p.apellido2 AS 'segon cognom', COUNT(a.id_profesor) AS 'nombre assignatures de cada professor' FROM persona p RIGHT JOIN profesor pr ON pr.id_profesor = p.id JOIN asignatura a ON a.id_profesor = pr.id_profesor GROUP BY pr.id_profesor;
SELECT * FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento DESC LIMIT 1;
SELECT p.nombre AS 'nom professor amb dept però no assignatura' FROM persona p JOIN profesor pr ON pr.id_profesor = p.id JOIN departamento d ON d.id = pr.id_departamento LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id IS NULL AND d.id IS NOT NULL;

-- SELECT * FROM alumno_se_matricula_asignatura;
-- SELECT * FROM asignatura;
-- SELECT * FROM curso_escolar;
-- SELECT * FROM departamento;
-- SELECT * FROM grado;
-- SELECT * FROM persona;
-- SELECT * FROM profesor;
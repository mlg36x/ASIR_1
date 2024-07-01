SELECT dep.NOMDE as 'Nombre departamento'
FROM tdepto as dep
WHERE TIDIR = 'F'
ORDER BY dep.NOMDE ASC;


SELECT emp.NOMEM as 'Nombre Empleado',
    emp.NUMEM AS 'Número Empleado',
    emp.EXTEL AS 'Extensión Telefónica'
FROM temple as emp
WHERE NUMDE = 121
ORDER BY emp.NOMEM ASC;


SELECT DISTINCT emp.EXTEL as 'Extensión',
 emp.NOMEM as 'Nombre Empleado'
FROM temple as emp
ORDER BY emp.EXTEL DESC;


SELECT concat('Departamento de ',dep.NOMDE) as 'Nombre Departamento', concat(dep.PRESU*1000000,'€') as Presupuesto
FROM tdepto as dep
WHERE dep.PRESU < 5;



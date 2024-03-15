/*01. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
select apellido1, apellido2, nombre from persona where tipo = "alumno" order by apellido1 asc, apellido2 asc, nombre asc;
/*02. Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/
select nombre, apellido1 from persona where tipo = "alumno" and telefono is null;
/*03. Retorna el llistat dels/les alumnes que van néixer en 1999.*/
select * from persona where tipo = "alumno" and year(fecha_nacimiento) = 1999;
/*04. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.*/
select * from persona where telefono is null and tipo = "profesor" and right(nif, 1) = "k";
/*05. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.*/
select * from asignatura where curso = 3 and cuatrimestre = 1 and id_grado = 7;
/*06. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
select apellido1, apellido2, nombre, id_departamento from persona inner join profesor on persona.id = profesor.id_profesor order by apellido1 and nombre asc;
/*07. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from asignatura inner join alumno_se_matricula_asignatura on asignatura.id = alumno_se_matricula_asignatura.id_asignatura inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id inner join persona on alumno_se_matricula_asignatura.id_alumno = persona.id where persona.nif = "26902806M";
/*08. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
select distinct departamento.nombre from departamento inner join profesor on departamento.id = profesor.id_departamento inner join asignatura on profesor.id_profesor = asignatura.id_profesor inner join grado on asignatura.id_grado = grado.id where grado.id = 4;
/*09. Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/
select distinct persona.* from persona inner join alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno inner join curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id where curso_escolar.id = 5;

/*			Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

01. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
select departamento.nombre as nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre from persona left join profesor on persona.id = profesor.id_profesor left join departamento on profesor.id_departamento = departamento.id order by departamento.nombre asc, persona.apellido1 asc, persona.apellido2 asc, persona.nombre asc;
/*02. Retorna un llistat amb els professors/es que no estan associats a un departament.*/
select persona.* from persona left join profesor on persona.id = profesor.id_profesor where profesor.id_departamento is null;
/*03. Retorna un llistat amb els departaments que no tenen professors/es associats.*/
select departamento.* from departamento left join profesor on departamento.id = profesor.id_departamento where profesor.id_departamento is null;
/*******04. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/
select persona.* from persona left join profesor on persona.id = profesor.id_profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor where asignatura.id_profesor is null;
/*05. Retorna un llistat amb les assignatures que no tenen un professor/a assignat*/
select asignatura.nombre from asignatura Where asignatura.id_profesor is null; /*sin join?*/
/*06. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/
select departamento.id, departamento.nombre from departamento left join profesor on departamento.id = profesor.id_departamento
left join asignatura on profesor.id_profesor = asignatura.id_profesor where asignatura.id is null;

				/*Consultes resum:

01. Retorna el nombre total d'alumnes que hi ha.*/
select count(*) from persona where persona.tipo = "alumno";
/*02. Calcula quants/es alumnes van néixer en 1999.*/
select count(*) from persona where persona.tipo = "alumno" and year(persona.fecha_nacimiento) = 1999;
/*03. Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
select departamento.nombre, count(profesor.id_profesor) as num_profesores from profesor left join departamento on profesor.id_departamento = departamento.id group by departamento.nombre order by num_profesores desc;
/*04. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.*/
select departamento.nombre, count(profesor.id_profesor) AS num_profesores from departamento inner join profesor on departamento.id = profesor.id_departamento group by departamento.nombre;
/*05. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/
select grado.nombre, count(asignatura.id) as num_asignaturas from grado left join asignatura on grado.id = asignatura.id_grado group by grado.nombre order by num_asignaturas desc;
/*06. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.*/
select grado.nombre, count(asignatura.id) as num_asignaturas from grado left join asignatura on grado.id = asignatura.id_grado group by grado.nombre having num_asignaturas > 40;
/*07. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.*/
select grado.nombre, asignatura.tipo, sum(asignatura.creditos) from grado inner join asignatura on grado.id = asignatura.id_grado group by grado.nombre, asignatura.tipo;
/*08. Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.*/
select curso_escolar.anyo_inicio, count(distinct alumno_se_matricula_asignatura.id_alumno) as num_alum_matriculados from curso_escolar left join alumno_se_matricula_asignatura on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar group by curso_escolar.anyo_inicio;
/*09. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.*/
select persona.id,persona.nombre, persona.apellido1, persona.apellido2, count(asignatura.id) as num_asignaturas from  persona left join profesor on persona.id = profesor.id_profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor group by persona.id order by num_asignaturas desc;
/*10. Retorna totes les dades de l'alumne més jove.*/
select * from persona where tipo = 'alumno' order by fecha_nacimiento asc limit 1;
/*11. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.*/
select * from persona left join profesor on persona.id = profesor.id_profesor left join asignatura on profesor.id_profesor = asignatura.id_profesor where profesor.id_departamento is not null and asignatura.id_profesor is null;
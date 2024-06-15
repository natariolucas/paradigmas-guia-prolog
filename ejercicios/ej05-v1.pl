% V1
% Se desea obtener: 
% 1. 
% 	a. El listado de los alumnos que promocionan la materia 
% 	b. El mismo listado pero esta vez incluyendo la nota final 
% 	(promedio de los dos parciales) para cada uno ç
% 2. El listado de los alumnos que recursan la materia. 
% 3. El listado de los alumnos que obtendrán la cursada. 
% 4. A fin de entregar la medalla al mérito, encontrar de aquellos que 
% promocionan (1b), el o los alumnos con mayor nota final (nombre y nota) 
% 5. Ahora se desea obtener cuales fueron las dos notas más altas, 
% considerando simplemente a la nota como el promedio de la nota de parcial1 
% y parcial2. Solo interesan los números. Un tip es pensar la resolución en 
% dos etapas, la más alta, y después la más alta de lo restante

parcial1(ana,7).
parcial1(juan,10).
parcial1(julio, 8).
parcial1(maria, 10).

parcial2(ana,10).
parcial2(juan,7).
parcial2(julio, 8).
parcial2(maria, 2).

% 1a,b
notas(X,N1,N2):-
    parcial1(X,N1),parcial2(X,N2).
promociona(X):-
    promociona(X,_,_).
promociona(X,N1,N2):-
    notas(X,N1,N2), N1 >= 7, N2 >=7.
promociona(X,Promedio):-
    promociona(X,N1,N2), Promedio is (N1+N2)/2.

% 2 El listado de los alumnos que recursan la materia 
% TODO: Ver como hacer para que no repita nombres
recursa(X):-
    notas(X,N1,N2), (N1 < 4 ; N2 < 4 ).

% 3. El listado de los alumnos que obtendrán la cursada. 
cursada(X):-
    notas(X,N1,N2), N1 >= 4, N2 >= 4, \+promociona(X).

% 4. A fin de entregar la medalla al mérito, encontrar de aquellos que 
% promocionan (1b), el o los alumnos con mayor nota final (nombre y nota) 
producto_cartesiano_promocionados(PX,PY):-
	promociona(_,PX), promociona(_,PY).

seleccion(X,Y):- 
    producto_cartesiano_promocionados(X,Y), 
    X < Y.

todos_menos_la_mas_alta(X):-
    seleccion(X,_).

merito(X,Promedio):-
	promociona(X,Promedio), \+todos_menos_la_mas_alta(Promedio).%

% 5. Ahora se desea obtener cuales fueron las dos notas más altas, 
% considerando simplemente a la nota como el promedio de la nota de parcial1 
% y parcial2. Solo interesan los números. Un tip es pensar la resolución en 
% dos etapas, la más alta, y después la más alta de lo restante
promedios(X,Promedio):-
    parcial1(X,N1),parcial2(X,N2), Promedio is (N1+N2)/2.

producto_cartesiano_promedios(PX,PY):-
    promedios(_,PX), promedios(_, PY), PX < PY.
todos_promedios_menos_el_mas_alto(PX):-
    producto_cartesiano_promedios(PX, _).
todos_promedios_menos_el_mas_bajo(PY):-
    producto_cartesiano_promedios(_, PY).

promedio_maximo(X):-
    promedios(_,X), \+todos_promedios_menos_el_mas_alto(X).

producto_cartesiano_promedios2(PX,PY):-
    todos_promedios_menos_el_mas_alto(PX), todos_promedios_menos_el_mas_alto(PY), PX < PY.
todos_promedios_menos_el_mas_alto2(PX):-
    producto_cartesiano_promedios2(PX, _).
promedio_maximo2(X2):-
    todos_promedios_menos_el_mas_alto(X2), \+todos_promedios_menos_el_mas_alto2(X2).

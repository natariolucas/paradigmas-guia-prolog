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

% V2 
% El listado se compone de al menos una nota para cada alumno. En caso de que 
% algún alumno adeude uno de los parciales (es decir no tenga un hecho relacionado a su parcial),
% su condición es ausente. No se toman en cuenta quienes no dieron ninguno de los parciales.



%parcial1(pepe,8).
parcial1(ana,7).
parcial1(juan,10).
parcial1(julio, 8).
parcial1(maria, 10).

parcial2(pepe,5).
%parcial2(ana,10).
parcial2(juan,7).
parcial2(julio, 8).
parcial2(maria, 2).

% 
notas(X,N1,N2):- 
    notas_ambos_parciales(X,N1,N2);
    notas_solo_rindieron_p1(X,N1), N2 is 0;
    notas_solo_rindieron_p2(X,N2), N1 is 0.

notas_ambos_parciales(X,N1,N2):-
    parcial1(X,N1), parcial2(X,N2).

notas_solo_rindieron_p1(X,N1):-
    alumnos_solo_p1(X), parcial1(X,N1).
alumnos_solo_p1(X):-
    parcial1(X,_), \+ parcial2(X,_).

notas_solo_rindieron_p2(X,N1):-
    alumnos_solo_p2(X), parcial2(X,N1).
alumnos_solo_p2(X):-
    parcial2(X,_), \+ parcial1(X,_).

% el resto debería ser igual a la V1...
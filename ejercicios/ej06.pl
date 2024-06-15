% Ej 06

% N es el nombre de un hombre o una mujer
% A su altura (alta, media, baja)
% C el color de su cabello (rubio, castaño, pelirrojo, negro)
% E su edad (joven,adulta,vieja).
% 
% 
% hombre(Nombre,Altura,ColorCabello,Edad).
% mujer(Nombre,Altura,ColorCabello,Edad).

% Que indica que a la persona N le gusta el género de música M (clásica, pop, jazz),
% el género de literatura L (aventura, ciencia-ficción, policíaca)
% practica el deporte D (tenis, natación, jogging).
% 
% 
% gusta(Nombre,Musica,Literatura,Deporte).


% Que expresa que la persona N busca una pareja de altura A, con cabello color C y edad E.
%
%
% busca(Nombre,Altura,ColorCabello,Edad).

% Se considera que dos personas X e Y de sexos diferentes son adecuadas 
% si X conviene a Y e Y conviene a X. 
% Se dice que X conviene a Y si X conviene físicamente a Y
%  (la altura, edad y color de cabello de y son los que busca x) y si, además, 
%  los gustos de X e Y en música, literatura y deporte coinciden.


hombre(pedro, alta, rubio, joven).
hombre(carlos, alta, rubio, joven).
hombre(juan, baja, negro, joven).
hombre(gonzalo, baja, pelirrojo, vieja).

mujer(carla, baja, pelirrojo, adulta).
mujer(marta, baja, pelirrojo, adulta).
mujer(ana, media, castaño, joven).

gusta(pedro,pop,aventura,tenis).
gusta(carla,pop,aventura,tenis).
gusta(marta,pop,aventura,tenis).


busca(pedro,baja, pelirrojo, adulta).
busca(carla,alta, rubio, joven).
busca(marta,alta, rubio, joven).

adecuadas(X,Y):-
    (
    	( hombre(X,_,_,_) , mujer(Y,_,_,_) ) ;
    	( mujer(X,_,_,_) , hombre(Y,_,_,_) )
    ),
    conviene_fisicamente(X,Y), conviene_fisicamente(Y,X), conviene_gustos(X,Y),
    X @< Y.

conviene_fisicamente(X,Y):- 
    ( hombre(Y,Altura,ColorCabello,Edad) ; mujer(Y,Altura,ColorCabello,Edad) ) ,
    busca(X,Altura,ColorCabello,Edad).

conviene_gustos(X,Y):-
    gusta(X,Musica,Literatura,Deporte),gusta(Y,Musica,Literatura,Deporte).


hombre(pedro) .
hombre(manuel) .
hombre(arturo) .
mujer(maría).
padre(pedro, manuel).
padre(pedro, arturo).
padre(pedro, maría) .

% Formular las siguientes afirmaciones 
% niño(X,Y) % expresa que X es hijo o hija de Y.
% hijo(X,Y) % expresa que X es un hijo varón de Y.
% hija(x,y) % expresa que X es una hija de Y.
% hermano-o-hermana(X,Y) % expresa que X es hermano o hermana de Y.
% hermano(X,Y) % expresa que X es un hermano de Y.
% hermana(X,Y) % expresa que X es una hermana de Y.

% Expresa que X es hijo o hija de Y.
niño(X,Y):-
    padre(Y,X).

% Expresa que X es un hijo varón de Y.
hijo(X,Y):-
	padre(Y,X), hombre(X).

% Expresa que X es una hija de Y.
hija(X,Y):-
    padre(Y,X),mujer(X).

% Expresa que X es hermano o hermana de Y.
% TODO: Con dos varianbles libres habria que ver como hacer para que no se repitan pares
hermano-o-hermana(X,Y):-
	padre(Z,X),padre(Z,Y), X \== Y.

% Expresa que X es un hermano de Y.
hermano(X,Y):-
    padre(Z,X), padre(Z,Y), hombre(X).

% Expresa que X es una hermana de Y.
hermana(X,Y):-
    padre(Z,X), padre(Z,Y), mujer(X).



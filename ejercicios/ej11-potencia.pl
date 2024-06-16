% Ej 11 - Codifique en prolog las reglas necesarias para obtener la
%  potencia N de un numero X aplicando multiplicaciones sucesivas.

% ---- "X elevado a la Y"

potencia(0,X,R):-
    X > 0, R is 0.
potencia(_,0,R):-
    R is 1.

potencia(X,Y,R):-
    X > 0, Y > 0,
    YA is Y-1,
    potencia(X,YA,RA),
    R is X * RA.

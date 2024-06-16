% Ej 11 -Codifique en prolog las reglas necesarias para obtener el producto 
% de dos numeros X e Y, aplicando sumas sucesivas.

producto(0,_,R):-
    R is 0.

producto(_,0,R):-
    R is 0.

producto(X,1,R):-
    R is X.

producto(1,Y,R):-
    R is Y.

producto(X,Y,Resultado):-
    X > 0, Y > 1,
    YA is Y-1,
    producto(X,YA,ResultadoA),
    Resultado is X + ResultadoA.


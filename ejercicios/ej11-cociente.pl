% Ej 11 - Codifique en prolog las reglas necesarias para obtener la el
%  cociente entre dos números a partir de restas sucesivas.

% ---- "X div Y"

cociente(0,Y,C):-
    Y > 0, C is 0.

cociente(X,Y,C):-
    cociente_aux(X,Y,0,C).

cociente_aux(X,Y,Acc,C):-
    X > 0,
    X >= Y,
    XAux is X-Y,
    AccAux is Acc+1,
    cociente_aux(XAux,Y,AccAux,C).

cociente_aux(X,Y,Acc,C):-
    X >= 0,
    X < Y,
    C is Acc.
    

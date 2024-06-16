% Ej 11 - Recursividad
% 2. Codifique en prolog las reglas necesarias para obtener el término N en la serie de Fibonacci (con y sin mejora)

fibonacci(0,0).
fibonacci(1,1).

fibonacci(X, Resultado):-
    X > 1, % Por que hace falta este corte?
    X1 is X-1, X2 is X-2,
    fibonacci(X1, R1), 
    fibonacci(X2,R2), 
    Resultado is R1+R2.

fibonacci_m_aux(0,0,0).
fibonacci_m_aux(1,1,0).
fibonacci_m_aux(X, R, RA):-
    X > 1,
    XA is X-1,
    fibonacci_m_aux(XA,RA,RAA),
    R is RA + RAA.

fibonacci_m(0,0).
fibonacci_m(1,0).
fibonacci_m(X, R) :-
    X > 1,
    fibonacci_m_aux(X, R, _).
    
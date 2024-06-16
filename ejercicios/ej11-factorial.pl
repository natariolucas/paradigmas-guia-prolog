% Ej 11 - factorial

factorial(0,1).
factorial(1,1).

factorial(N, Resultado):-
    N > 1,
    NA is N-1,
    factorial(NA, ResultadoA),
    Resultado is N * ResultadoA.

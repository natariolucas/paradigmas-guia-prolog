entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne(filete_de_cerdo).
carne(pollo_asado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).

bebida(vino).
bebida(cerveza).
bebida(agua_mineral).

plato_principal(PP):-
	carne(PP).
plato_principal(PP):-
    pescado(PP).

menu(Entrada, PP, Postre) :-
    entrada(Entrada),  plato_principal(PP) , postre(Postre).

menu(Entrada, PP, Postre, Bebida) :-
    menu(Entrada,PP,Postre), bebida(Bebida).

% ?- menu(Entrada,PlatoPrincipal,Postre)

menues_consome_entradas(PP, Postre) :-
    var(PP),var(Postre),menu(consomé,PP,Postre).
% ?- menues_consome_entradas(PlatoPrincipal,Postre)

menues_consome_entradas_2(Entrada, PP, Postre) :-
    Entrada = consomé,menu(Entrada,PP,Postre).

menues_consome_entradas_3(Entrada, PP, Postre) :-
    menu(Entrada,PP,Postre), Entrada == consomé.

menues_sin_flan(Entrada,PP) :-
    var(Entrada),var(PP),menu(Entrada,PP,Postre),Postre \== flan.

menues_sin_flan_2(Entrada,PP, Postre) :-
    menu(Entrada,PP,Postre), Postre \== flan.
% ?- menues_sin_flan(Entrada,PlatoPrincipal)
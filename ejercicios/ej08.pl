entrada(paella, 80).
entrada(gazpacho, 70).
entrada(consomé, 90).

carne(filete_de_cerdo, 120).
carne(pollo_asado, 150).

pescado(trucha, 40).
pescado(bacalao, 30).

postre(flan, 1000).
postre(helado, 350).
postre(pastel, 500).

bebida(vino, 50).
bebida(cerveza, 120).
bebida(agua_mineral, 0).

plato_principal(PP, CPP):-
	carne(PP, CPP).
plato_principal(PP, CPP):-
    pescado(PP, CPP).

menu(Entrada, PP, Postre, Calorias) :-
    entrada(Entrada, CE),  plato_principal(PP, CPP) , postre(Postre, CP),
	Calorias is CE+CPP+CP.

menu_calorias_producto_cartesiano(X,Y) :-
    menu(_,_,_,X), menu(_,_,_,Y), X < Y.

todos_menos_el_mas_bajo(Y):-
    menu_calorias_producto_cartesiano(_,Y).

menor_calorias(Y):-
    menu(_,_,_,Y), \+ todos_menos_el_mas_bajo(Y).

menu_menor_calorias(Entrada,PP,Postre,Calorias):-
    var(Calorias),
    menor_calorias(Calorias),
    menu(Entrada,PP,Postre,Calorias).
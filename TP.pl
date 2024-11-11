persona(samuel, lentes(negros)).
persona(samuel, pelo(blanco,lacio)).
persona(samuel, calvo).
persona(samuel, boca(chica)).
persona(samuel, cara(puntuda)).
persona(samuel,ojos(marrones)).
persona(samuel, nariz(chica)).
persona(pepe, lentes(rojos)).
persona(pepe, pelo(rubio,rulos)).
persona(pepe, boca(chica)).
persona(pepe, cara(puntuda)).
persona(pepe, ojos(marrones)).
persona(pepe, nariz(chica)).

personaje(pepe).
personaje(samuel).

%punto2
persona(Persona, lentes(marrones)) :- persona(Persona, nariz(chica)), persona(Persona, boca(grande)).
persona(Persona, ojos(marrones)) :- persona(Persona, pelo(morocho)).
persona(Persona, ojos(marrones)) :- persona(Persona, pelo(castanio)).
persona(Persona, cara(redonda)) :- personaje(Persona), not(persona(Persona, cara(puntuda))).

carta(rojo, samuel).
carta(azul, pepe).
contrincante(rojo, azul).
contrincante(azul, rojo).

%punto1
esCalvo(Jugador) :-carta(Jugador, Persona), persona(Persona, calvo).
esRubio(Jugador) :-carta(Jugador, Persona), persona(Persona, pelo(rubio,_)).
tieneLentes(Jugador) :-carta(Jugador, Persona), persona(Persona, lentes(_)).

%punto3
esRubioYBocaChica(Persona) :- persona(Persona, pelo(rubio,_)),
    persona(Persona, boca(chica)).

%punto4
pista(rojo, pelo(rubio,_)).
pista(rojo, boca(chica)).
pista(azul, lentes(rosas)).

cumplePista(Persona, Caracteristica) :-
    carta(_, Persona),
    persona(Persona, Caracteristica).

cumpleTodasPistas(Persona, Color) :-
    pista(Color, Caracteristica),
    cumplePista(Persona, Caracteristica),
    not((pista(Color, OtraCaracteristica), not(persona(Persona, OtraCaracteristica)))).

%punto5
contarPersonasCumplenPistas(Color, CantidadPersonasCumplenPistas) :-
    findall(Persona, cumpleTodasPistas(Persona, Color), PersonasPorPista),
    findall(Pista, pista(Color, Pista), Pistas),
    length(Pistas, CantidadPistas),
    length(PersonasPorPista, CantidadPersonasPorPista),
    CantidadPersonasCumplenPistas is CantidadPersonasPorPista / CantidadPistas.

vaGanando(Color) :-
    contrincante(Color, Contrincante),
    contarPersonasCumplenPistas(Color, Cantidad1),
    contarPersonasCumplenPistas(Contrincante, Cantidad2),
    Cantidad1 < Cantidad2.
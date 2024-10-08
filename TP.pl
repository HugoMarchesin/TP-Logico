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

%punto2
persona(Persona, lentes(marrones)) :- persona(Persona, nariz(chica)), persona(Persona, boca(grande)).
persona(Persona, ojos(marrones)) :- persona(Persona, pelo(morocho)).
persona(Persona, ojos(marrones)) :- persona(Persona, pelo(castanio)).
persona(Persona, cara(redonda)) :- persona(Persona,_), not(persona(Persona, cara(puntuda))).

carta(rojo, samuel).
carta(azul, pepe).
contrincante(rojo, azul).
contrincante(azul, rojo).

%punto1
esCalvo(Jugador) :-carta(Jugador, Persona), persona(Persona, calvo).
esRubio(Jugador) :-carta(Jugador, Persona), persona(Persona, pelo(rubio,_)).
tieneLentes(Jugador) :-carta(Jugador, Persona), persona(Persona, lentes(_)).

%punto3
esRubioYBocaChica(Persona) :- 
    esRubio(Persona),
    persona(Persona, boca(chica)).

%punto4
pista(rojo,pelo(rubio,_)).
pista(rojo,boca(chica)).

cumplePista(Persona, pista(Color, Caracteristica)) :-
    pista(Color, Caracteristica),
    carta(Color, Persona),
    persona(Persona, Caracteristica).
cumpleTodasPistas(Persona, Color) :-
    pista(Color, _),
    forall(pista(Color, Caracteristica), cumplePista(Persona, pista(Color, Caracteristica))).

%punto5
contarPersonasCumplenPistas(Color, Cantidad) :-
    findall(Persona, cumpleTodasPistas(Persona, Color), Personas),
    length(Personas, Cantidad).

vaGanando(Color) :-
    contrincante(Color, Contrincante),
    contarPersonasCumplenPistas(Color, Cantidad1),
    contarPersonasCumplenPistas(Contrincante, Cantidad2),
    Cantidad1 < Cantidad2.

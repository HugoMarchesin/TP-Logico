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
persona(Persona, cara(redonda)) :- not(persona(Persona, cara(puntuda))).

carta(rojo, samuel).
carta(azul, pepe).
contrincante(rojo, azul).
contrincante(azul, rojo).

%punto1
esCalvo(Persona) :- persona(Persona, calvo).
esRubio(Persona) :- persona(Persona, pelo(rubio,_)).
tieneLentes(Persona) :- persona(Persona, lentes(_)).

%punto3
esRubioYBocaChica(Persona) :- esRubio(Persona), persona(Persona, boca(chica)).

%punto4
pista(rojo,pelo(rubio,_)).
pista(rojo,boca(chica)).
coincide(Persona) :- persona(Persona, Caracteristica), pista(_, Caracteristica), not((persona(Persona, Caracteristica2), not(pista(_, Caracteristica2)))).

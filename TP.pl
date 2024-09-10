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

%tests
:-begin_tests(punto1).
    test(son_calvos, set(Persona == [samuel])):-
        esCalvo(Persona).
    test(no_son_calvos, fail) :-
        esCalvo(pepe).
    test(no_son_rubios, fail) :-
        esRubio(samuel).
    test(son_rubios, set(Persona == [pepe])) :-
        esRubio(Persona).
    test(tienen_lentes, set(Persona == [samuel, pepe])) :-
        tieneLentes(Persona).
:-end_tests(punto1).

:-begin_tests(punto2).
    test(tienen_lentes_marrones, set(Persona == [])) :-
        persona(Persona, lentes(marrones)).
    test(no_tienen_lentes_marrones, fail) :-
        persona(samuel, lentes(marrones));
        persona(pepe, lentes(marrones)).
    test(tienen_ojos_marrones, set(Persona == [])) :-
        persona(Persona, lentes(marrones)).
:-end_tests(punto2).

:-begin_tests(punto3).
    test(es_rubio_y_boca_chica, set(Persona == [pepe])) :-
        esRubioYBocaChica(Persona).
    test(no_es_rubio_y_boca_chica, fail) :-
        esRubioYBocaChica(samuel).
:-end_tests(punto3).

:-begin_tests(punto4).
    test(cumplen_alguna_pista, set(Persona == [samuel])) :-
        cumplePista(Persona, _).
    test(no_cumplen_alguna_pista, fail) :-
        cumplePista(pepe, _).
    test(cumplen_las_pistas, set(Persona == [])) :-
        cumpleTodasPistas(Persona, _).
    test(no_cumplen_las_pistas, fail) :-
        cumpleTodasPistas(samuel, _);
        cumpleTodasPistas(pepe, _).
:-end_tests(punto4).

:-begin_tests(punto5).
    test(van_ganando, set(Contrincante == [])) :-
        vaGanando(Contrincante).
:-end_tests(punto5).
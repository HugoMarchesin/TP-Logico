:-include("TP").

%tests
:-begin_tests(punto1).
    test(son_calvos, set(Persona == [rojo])):-
        esCalvo(Persona).
    test(no_son_calvos, fail) :-
        esCalvo(azul).
    test(no_son_rubios, fail) :-
        esRubio(rojo).
    test(son_rubios, set(Persona == [azul])) :-
        esRubio(Persona).
    test(tienen_lentes, set(Persona == [rojo, azul])) :-
        tieneLentes(Persona).
:-end_tests(punto1).

:-begin_tests(punto2).
    test(tienen_lentes_marrones, set(Persona == [])) :-
        persona(Persona, lentes(marrones)).
    test(samuel_no_tienen_lentes_marrones, fail) :-
        persona(samuel, lentes(marrones)).
    test(pepe_no_tienen_lentes_marrones, fail) :-
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
    test(cumplen_alguna_pista, set(Persona == [pepe, samuel])) :-
        cumplePista(Persona, _).
    test(cumplen_las_pistas, set(Persona == [])) :-
        cumpleTodasPistas(Persona, _).
    test(samuel_no_cumple_las_pistas, fail) :-
        cumpleTodasPistas(samuel, _).
    test(pepe_no_cumple_las_pistas, fail) :-
        cumpleTodasPistas(pepe, _).
    
    test(alguien_cumple_pista_rubio) :-
        cumplePista(_, pista(_, pelo(rubio,_))).
    test(alguien_cumple_pista_boca_chica) :-
        cumplePista(_, pista(_, boca(chica))).
    
:-end_tests(punto4).

:-begin_tests(punto5).
    test(van_ganando, set(Contrincante == [])) :-
        vaGanando(Contrincante).
:-end_tests(punto5).
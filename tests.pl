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
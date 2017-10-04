loves(marsellus, mia).
loves(vincent, mia).

jealous(X, Y) :-
    loves(X, Z),
    loves(Y, Z).

word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun, 'big kahuna burger').
word(verb,eats).
word(verb,likes).

sentence(Word1,Word2,Word3,Word4,Word5):-
    word(determiner,Word1),
    word(noun,Word2),
    word(verb,Word3),
    word(determiner,Word4),
    word(noun,Word5).

word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

crossword(V1, V2, V3, H1, H2, H3) :-
    word(V1, A, B, C, D, E, F, G),
    word(V2, A1, B1, C1, D1, E1, F1, G1),
    word(V3, A2, B2, C2, D2, E2, F2, G2),
    word(H1, A3, B, C3, B1, E3, B2, G3),
    word(H2, A4, D, C4, D1, E4, D2, G4),
    word(H3, A5, F, C5, F1, E5, F2, G5),
    V1 \= H1.

f(a).
f(b).

g(a).
g(b).

h(b).

k(X) :-
    f(X), g(X), h(X).

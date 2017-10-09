my_max(X, Y, Z) :-
    X >= Y, !, X = Z.
my_max(_, Y, Y).

%Programming Tech:
%Goal :- Exception, !, fail.
%Goal :- Facts.
enjoys(vincent,X)  :-  big_kahuna_burger(X),!,fail.
enjoys(vincent,X)  :-  burger(X).

burger(X)  :-  big_mac(X).
burger(X)  :-  big_kahuna_burger(X).
burger(X)  :-  whopper(X).

big_mac(a).
big_mac(c).
big_kahuna_burger(b).
whopper(d).

%Exercises
%10.1
p(1).
p(2) :- !.
p(3).
% p(X). X = 1; X = 2
% p(X), p(Y).   X = 1, Y = 1; X = 1, Y = 2; X = 2, Y = 1; X = 2, Y = 2.
% p(X), !, p(Y). X = 1, Y =1; X = 1, Y = 2

%10.2
%Check whether the number is positive, negative or zero.
class(0, zero) :- !.
class(N, positive) :- N > 0, !.
class(N, negative) :- N < 0.

%10.3
%split(+List, ?Positive, ?Negative).
split([], [], []).
split([H|T], [H|PosT], Neg) :-
    H >= 0, !,
    split(T, PosT, Neg).
split([H|T], Pos, [H|NegT]) :-
    H < 0,
    split(T, Pos, NegT).

%10.4
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

route(A, B, [A|[B]], _) :-
    directTrain(A, B), !.
route(A, B, [A|[B]], _) :-
    directTrain(B, A), !.
route(A, B, [A|T], C) :-
    directTrain(A, Z),
    Z \= C,
    route(Z, B, T, A).
route(A, B, [A|T], C) :-
    directTrain(Z, A),
    Z \= C,
    route(Z, B, T, A).
route(A, B, Route) :-
    route(A, B, Route, A).

%10.5
loves(james, mia).
loves(vincent, mia).

jealous(X, Y) :-
    loves(X, Z),
    loves(Y, Z),
    X \= Y.

%Practical Session
%1.
nu1(X, Y) :-
    \+ X = Y.

nu2(X, Y) :-
    X = Y,
    !,
    fail.
nu2(_, _).

nu3(X, X) :-
    !, fail.
nu3(_, _).

%2.
%unifiable(+List1, +Term, ?List2)
unifiable([], _, []) :- !.
unifiable([], _, _) :- !.
unifiable([H|T], Term, L2) :-
    \+ H = Term,
    !,
    unifiable(T, Term, L2).
unifiable([H|T], Term, [H|T2]) :-
    unifiable(T, Term, T2).

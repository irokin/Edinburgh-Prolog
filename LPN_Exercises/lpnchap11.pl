:- assert(happy(mia)).  %register a fact into the knowledge base
:- assert(happy(marcellus)).
:- assert(happy(butch)).
:- assert(happy(vincent)).

% :- assert( (naive(X) :-
%     happy(X)) ).

:- findall(_, retract(happy(_)), _).
% :- retract(naive(_)).

%Declaration of a dynamic predicate
:- dynamic lookup/3.

add_and_square(X, Y, R) :-
    lookup(X, Y, R), !.
add_and_square(X, Y, Res) :-
    Res is (X + Y) * (X + Y),
    assert(lookup(X, Y, Res)).

child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).

descend(X,Y)  :-  child(X,Y).
descend(X,Y)  :-  child(X,Z),
    descend(Z,Y).

age(harry,13).
age(draco,14).
age(ron,13).
age(hermione,13).
age(dumbledore,60).
age(hagrid,30).

loves(james, mia).
loves(frank, mia).
loves(corbyn, mia).
loves(mia, francis).
loves(julies, james).

%People loved by others
:- dynamic lovedones/1.
:- dynamic loveset/2.

:- findall(X, loves(_, X), L), assert(lovedones(L)). %will contain duplicate
:- setof(X, Y^loves(Y, X), L), assert(lovedones(L)). %ordered in alphabet and no duplicate
:- findall(_, (bagof(X, loves(X, Y), L), assert(loveset(Y, L))), _).

:- listing(lovedones).
:- findall(_, retract(lovedones(_)), _).
:- listing(lovedones).

:- listing(loveset).
:- findall(_, retract(loveset(_, _)), _).
:- listing(loveset).

%Exercises
%11.1
% :- dynamic q/2.
% :- assert(q(a,b)), assertz(q(1,2)), asserta(q(foo,blug)).
% :- retractall(q(_, _)).

%11.2
q(blob,blug).
q(blob,blag).
q(blob,blig).
q(blaf,blag).
q(dang,dong).
q(dang,blug).
q(flab,blob).

:- findall(X, q(blob,X), _).
%List = []
:- findall(X,q(X,blug),_).
:- findall(X, q(X,_), _).
:- bagof(X, q(X,_), _).
:- setof(X, Y^q(X,Y), _).

%11.3
%helper function - nearest(+List, +Num, ?Nearest), set the element nearest to the left of Num in List to Nearest
nearest([H|T], Num, Res) :-
    nearest(T, Num, H, Res).
nearest([], Num, Near, _) :-
    Near >= Num, !, fail.

nearest([], _, Res, Res) :- !.
nearest([H|T], Num, Near, Res) :-
    H >= Num, !,
    nearest(T, Num, Near, Res).
nearest([H|T], Num, Near, Res) :-
    H < Num, H >= Near, !,
    nearest(T, Num, H, Res).
nearest([H|T], Num, Near, Res) :-
    H < Num, H < Near,
    nearest(T, Num, Near, Res).

:- dynamic sigmare/2.

sigma(Num, Res) :-
    sigmare(Num, Res), !.
sigma(Num, Res) :-
    findall(X, sigmare(X, _), L),
    \+ nearest(L, Num, _), !,   %There is no sigmare record
    Acc = 1, Temp = 1,
    sigma(Num, Acc, Temp, Res).
sigma(Num, Res) :-
    findall(X, sigmare(X, _), L),
    nearest(L, Num, N),
    sigmare(N, R),
    sigma(Num, N, R, Res).

sigma(Num, Num, Temp, Temp) :-
    assert(sigmare(Num, Temp)), !.
sigma(Num, N, R, Res) :-
    Acc is N + 1,
    R2 is R + Acc,
    sigma(Num, Acc, R2, Res).

:- retractall(sigmare(_, _)).

%Practical Session,
%1. With helper function: order_list/2, sublist/2, rec_sub_list/1, could be rewritten using other principles
:- dynamic list_lookup/2.
:- retractall(list_lookup(_, _)).

order_list(List, R) :-
    setof(X, member(X, List), R).

suffix(Part, Whole) :-
    append(_, Part, Whole).
sublist(List, Sub) :-
    suffix(S, List),
    prefix(Sub, S).

rec_sub_list(List) :-
    rec_sub_list(List, List, []).
rec_sub_list(_, [], _) :- !.
rec_sub_list(List, [H|T], Acc) :-
    append(Acc, T, Acc1),
    append(Acc, [H], Acc2),
    length(Acc1, Leng), Leng > 2, !,
    assert(list_lookup(List, Acc1)),
    rec_sub_list(Acc1, Acc1, []),
    rec_sub_list(List, T, Acc2).
rec_sub_list(List, [H|T], Acc) :-
    append(Acc, T, Acc1),
    append(Acc, [H], Acc2),
    assert(list_lookup(List, Acc1)),
    rec_sub_list(List, T, Acc2).

subset(List, Sub) :-
    assert(list_lookup(List, List)),
    rec_sub_list(List),
    findall(S, (list_lookup(List, Sample),
    sublist(Sample, S)), S1),
    order_list(S1, Sub),
    retractall(list_lookup(_, _)).

%2.
powerset(Set, P) :-
    subset(Set, P).

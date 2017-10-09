%Analysis of a complex term
complexterm(X) :-
    nonvar(X),
    functor(X, _, A),
    A > 0.

%9.3
termtype(Term, Type) :-
    termtest(Term, Type).
termtest(Term, atomic) :-
    atomic(Term).
termtest(Term, atom) :-
    atom(Term).
termtest(Term, number) :-
    number(Term).
termtest(Term, integer) :-
    integer(Term).
termtest(Term, float) :-
    float(Term).
termtest(Term, variable) :-
    var(Term).
termtest(Term, complex_term) :-
    functor(Term, _, Arity),
    Arity > 0.
termtest(Term, simple_term) :-
    functor(Term, _, Arity),
    Arity = 0.
termtest(_, term).

%9.4
groundterm_test([]).
groundterm_test([H|T]) :-
    nonvar(H),
    groundterm_test(T).
groundterm(Term) :-
    nonvar(Term),
    =..(Term, L),
    groundterm_test(L).

order_list(List, R) :-
    setof(X, member(X, List), R).

suffix(Part, Whole) :-
    append(_, Part, Whole).
sublist(List, Sub) :-
    suffix(S, List),
    prefix(Sub, S).

%Reverse
%Bottom up Tech
reverse([], []).
reverse([H|T], Rev) :-
    reverse(T, R),
    append(R, [H], Rev).

rev(List, Rev) :-
    rev(List, [], Rev).
rev([], Acc, Acc).
rev([H|T], Acc, Rev) :-
    rev(T, [H|Acc], Rev).

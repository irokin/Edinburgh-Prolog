%Bulit-in Type predicate
% atomic, atom, number, integer, float
% var, nonvar

%Analysis of a complex term
complexterm(X) :-
    nonvar(X),
    functor(X, _, A),
    A > 0.

%Exercises
%9.1
/*
1. 12 is 2 * 6  S
2. 14 =\= 2 * 6 S
3. 14 = 2 * 7   F, No forced evaluations
4. 14 == 2 * 7  F, same as above
5. 14 \== 2*7   S, not the same term
6. 14 =:= 2 * 7 S
7. [1,2,3|[d,e]] == [1,2,3,d,e] S, both will be translated into the .() or [|] format depending on interpreter
8. 2 + 3 == 3 + 2   F, +(2,3) \== +(3,2)
9. 7 - 2 =\= 9 - 2  S, 5 \= 7
10. p == 'p'    S
11. p =\= 'p'   S
12. vincent == VAR  F
13. vincent = VAR, VAR == vincent   S, instantiated variable unified with same constant
*/

%9.2
/*
.(a, .(b, .(c, []))) = [a,b,c]  F, for SWI Prolog, List is converted back with [|]/2
*/

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

%9.5
% X is_a witch  is_a(X, witch).
% harry and ron and hermione are friends     are(and(harry, and(ron, hermione)),friends).
% harry is_a wizard and likes quidditch      This will cause priority clash because operators with same precedence are among the operators which casue confusion to Prolog
% dumbledore is_a famous wizard      is_a(dumbledore, famous(wizard)).

%Practical Session
%1.
lexi(man, n, singular, _).
lexi(men, n, plural, _).
lexi(woman, n, singular, _).
lexi(women, n, plural, _).
lexi(she, pron, singular, subject).
lexi(her, pron, singular, object).
lexi(he, pron, singular, subject).
lexi(him, pron, singular, object).
lexi(they, pron, plural, subject).
lexi(them, pron, plural, object).
lexi('I', pron, _, subject).
lexi(me, pron, singular, object).
lexi(beautiful, adj, _, _).
lexi(generous, adj, _, _).
lexi(good, adj, _, _).
lexi(know, v, plural).
lexi(knows, v, singular).
lexi(kiss, v, plural).
lexi(kisses, v, singular).
lexi(likes, v, singular).
lexi(like, v, plural).
lexi(is, v, singular).
lexi(are, v, plural).
lexi(a, det, singular).
lexi(the, det, _).
lexi(that, det, singular).
lexi(this, det, singular).


%X is singular/plural, Y subject/object
s(s(NP, VP)) --> np(NP, X, subject), vp(VP, X).

np(np(Det, N), X, Y) --> det(Det, X), n(N, X, Y).
np(np(Det, ADJ, N), X, Y) --> det(Det, X), adj(ADJ), n(N, X, Y).

np(np(N), _, object) --> pron(N, _, object).
np(np(N), X, subject) --> pron(N, X, subject).

vp(vp(V, NP), X) --> v(V, X), np(NP, _, object).
vp(vp(V), X) --> v(V, X).

det(det(Word), X) --> [Word], {lexi(Word, det, X)}.
n(n(Word), X, Y) --> [Word], {lexi(Word, n, X, Y)}.
pron(pron(Word), X, Y) --> [Word], {lexi(Word, pron, X, Y)}.
v(v(Word), X) --> [Word], {lexi(Word, v, X)}.
adj(adj(Word)) --> [Word], {lexi(Word, adj, _, _)}.

%pptree/1
%pptree(+Sentence), Sentence should be a list where each element representing a word in a sentence.
pptree(S) :-
    s(X, S, []),
    pp(X, 0).

pp(X) :-
    pp(X, 0).
pp(X, Lev) :-
    Lev = 0,
    functor(X, Func, Arity),
    Arity \= 0,
    write(Func), write('('),
    pp(X, 1, Arity, 1).
pp(X, _) :-
    atomic(X),
    write(X).
pp(X, Lev) :-
    Lev \= 0, nl, Lev1 is Lev * 2, Lev2 is Lev + 1, tab(Lev1),
    functor(X, Func, Arity),
    Arity \= 0,
    write(Func), write('('),
    pp(X, 1, Arity, Lev2).
pp(X, Acc, Arity, Lev) :-
    Acc \= Arity,
    arg(Acc, X, Arg),
    pp(Arg, Lev),
    Acc1 is Acc + 1,
    pp(X, Acc1, Arity, Lev).
pp(X, Acc, Arity, Lev) :-
    Acc = Arity,
    arg(Acc, X, Arg),
    pp(Arg, Lev),
    write(')').

%Practical Session 2
%operator definition for not, and, or, implies
:- op(600, xfy, not).
:- op(400, xfy, implies).
:- op(200, fx, not).
:- op(100, xfy, and).
:- op(100, xfy, or).

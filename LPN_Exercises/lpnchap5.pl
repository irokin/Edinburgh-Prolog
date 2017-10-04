%Arithmetic in Prolog
add_3_and_double(X, Y) :-
    Y is (X + 3) * 2.

%Arithmetic Equavalence
/*
As highlighted before, term is the most fundamental data structure in Prolog,
Everything translates to a term

X is 3+2.
X is +(3,2).
is(X, +(3,2)).
*/

%Length of List
len([], 0).
len([_|X], N) :-
    len(X, Y),
    N is Y + 1.

%A Tail Recursive Method
accLen([], A, A).
accLen([_|T], A, L) :-
    Anew is A + 1,
    accLen(T, Anew, L).
%A accLen wrapper
leng(List, Length) :-
    accLen(List, 0, Length).

%Find the maximum element in a list
accMax([H|T], A, M) :-
    A =< H,
    accMax(T, H, M), !.
accMax([H|T], A, M) :-
    A > H,
    accMax(T, A, M), !.
accMax([], A, A).
max(List, Max) :-
    accMax(List, 0, Max).

%Exercises
%5.1
/*
1. X = 3*4
2. X = 12
3. Arguments are not sufficiently instantiated
4. X = Y
5. T
6. T
7. Arguments are not sufficiently instantiated
8. T
9. T
10. T
11. T
12. T
13. T
14. T
15. F
16. T
*/

%5.2
increment(X, Y) :-
    Y is X + 1.
sum(X, Y, Z) :-
    Z is X + Y.

%5.3
addone([], []).
addone([Xh|Xt], [Yh|Yt]) :-
    Yh is Xh + 1,
    addone(Xt, Yt).

%Practical Session
%Min
accMin([], A, A).
accMin([H|T], A, M) :-
    H >= A,
    accMin(T, A, M), !.
accMin([H|T], A, M) :-
    H < A,
    accMin(T, H, M), !.
min([H|T], Min) :-
    accMin([H|T], H, Min).

%Scalar Multiplication
scalarMult(_, [], []).
scalarMult(C, [Xh|Xt], [Yh|Yt]) :-
    Yh is Xh * C,
    scalarMult(C, Xt, Yt), !.

%Dot Product
dot([], [], []).
dot([Xh|Xt], [Yh|Yt], [Zh|Zt]) :-
    Zh is Xh * Yh,
    dot(Xt, Yt, Zt), !.

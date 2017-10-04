%solutions to Learn Prolog Now chapter 4 Lists

%Recuring Down Lists
a2b([], []).
a2b([a|Ta], [b|Tb]) :-
    a2b(Ta, Tb).

%Exercises
%4.1
/*
1. F    different in number of elements
2. T    [head|list] format
3. F
4. T
5. F
6. T
7. F
8. T
9. T
10. F
11. F
*/

%4.2 Syntactical correctness
/*
1. Correct, 4
2. C, 3
3. Incorrect, violate [head|list] structure
4. C, 4
5. C, 4
6. C, 0
7. I
8. C, 5
*/

%4.3 Element Selection
second(X,[_|[H|_]]) :-
    X = H.

%4.4 Advanced ES
swap12([], []).
swap12([X1|[X2|XT]], [Y1|[Y2|YT]]) :-
    X1 = Y2,
    X2 = Y1,
    XT = YT.

%4.5 Matching
tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtrans([], []).
listtrans([GerH|GerT], [EngH|EngT]) :-
    tran(GerH, EngH),
    listtrans(GerT, EngT).

%4.6 Variablisation of multiple elements
twice([], []).
twice([XH|XT], [YH1, YH2|YT]) :-
    XH = YH1,
    YH1 = YH2,
    twice(XT, YT).

%Practical Session

%combine1/3
%combine1(+List1, +List2, ?List3)
%combine elements of List1 and List2 into List3
combine1([], [], []).
combine1([Xh|Xt], [Yh|Yt], [Z1, Z2|Zt]) :-
    Z1 = Xh,
    Z2 = Yh,
    combine1(Xt, Yt, Zt), !.
%List1 and List2 are of different length
combine1([], [Yh|Yt], [Z1|Zt]) :-
    Z1 = Yh,
    combine1([], Yt, Zt).
combine1([Xh|Xt], [], [Z1|Zt]) :-
    Z1 = Xh,
    combine1(Xt, [], Zt).

%combine2/3
%combine2(+List1, +List2, ?List3)
%aggregate elements of same position from List1 and List2 into a list constituting an element in List3 at the same position
combine2([], [], []).
combine2([Xh|Xt], [Yh|Yt], [Zh|Zt]) :-
    Zh = [Xh, Yh],
    combine2(Xt, Yt, Zt), !.
combine2([], [Yh|Yt], [Zh|Zt]) :-
    Zh = [[], Yh],
    combine2([], Yt, Zt).
combine2([Xh|Xt], [], [Zh|Zt]) :-
    Zh = [Xh, []],
    combine2(Xt, [], Zt).

%combine3/3
combine3([], [], []).
combine3([Xh|Xt], [Yh|Yt], [Zh|Zt]) :-
    Zh = j(Xh, Yh),
    combine3(Xt, Yt, Zt), !.
combine3([], [Yh|Yt], [Zh|Zt]) :-
    Zh = j([], Yh),
    combine3([], Yt, Zt).
combine3([Xh|Xt], [], [Zh|Zt]) :-
    Zh = j(Xh, []),
    combine3(Xt, [], Zt).

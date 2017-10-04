%Append
myappend([], [], []).
myappend([Xh|Xt], Y, [Zh|Zt]) :-
    Zh = Xh,
    myappend(Xt, Y, Zt).
myappend([], [Yh|Yt], [Zh|Zt]) :-
    Zh = Yh,
    myappend([], Yt, Zt).

%Use of Argument-level value assignment for append predicate
lappend([], L, L).
lappend([H|T], L2, [H|L3]) :-
    lappend(T, L2, L3).

%Opposing Functionality
prefix(L, P) :-
    lappend(P, _, L).
suffix(L, S) :-
    lappend(_, S, L).
sublist(L, Lsub) :-
    suffix(L, S),
    prefix(S, Lsub).

%Reversing a List
naiverev([], []).
naiverev([H|T], R) :-
    naiverev(T, RevT),
    lappend(RevT, [H], R).

accrev([], A, A).
accrev([H|T], A, R) :-
    accrev(T, [H|A], R).
rev(List, Rev) :-
    accrev(List, [], Rev).

%Exercise 6
%6.1
doubled(L) :-
    lappend(A, A, L).

%6.2
palindrome(L) :-
    rev(L, L).

%6.3
toptail([_|Int], Out) :-
    Int \= [],
    rev(Int, [_|Revt]),
    rev(Revt, Out).

%6.4
rev_last(L, X) :-
    rev(L, [H|_]),
    H = X.

%The anonymous variable is used to pass down useful value obtained
%from current recursion for the consideration of next round of recursion, I will call it Value Sentry
recur_last([], H, H).
recur_last([H|T], _, X) :-
    recur_last(T, H, X).
last(List, X) :-
    recur_last(List, [], X).

%6.5
rev_swapfl([L1h|L1t], [L2h|L2t]) :-
    rev(L1t, [R1h|R1t]),
    rev(L2t, [R2h|R2t]),
    L1h = R2h,
    R1h = L2h,
    R1t = R2t.

rec_swapfl([], [], [L1h|_], [L2h|_], L1h, L2h).
rec_swapfl([L1h|L1t], [L2h|L2t], L1, L2, _, _) :-
    rec_swapfl(L1t, L2t, L1, L2, L2h, L1h).
swapfl(L1, L2) :-
    rec_swapfl(L1, L2, L1, L2, [], []).

%6.6
zebra_owner(ZebraOwner, Colour) :-
    Street = [_, _, _], %Variable Container
    member(house(red, englishman, _), Street),
    member(house(Colour, ZebraOwner, zebra), Street),
    member(house(_, spanish, jaguar), Street),
    sublist(Street, [house(_, _, snail), house(_, japanese, _)]),
    sublist(Street, [house(_, _, snail), house(blue, _, _)]).

%Practical Session
%Programming Work 1.
%Steps to failure is n+1
app_member(X, L) :-
    lappend(_, [X|_], L).
%Steps to failure is n
std_member(X, [X|_]).
std_member(X, [_|T]) :-
    std_member(X, T).

%2. Implementation with append
set([], X, X).
set([Inh|Int], [], Out) :-
    set(Int, [Inh], Out), !.    %Compliant to the grammar requirement of append.
set([Inh|Int], Acc, Out) :-
    \+ member(Inh, Acc),
    append(Acc, [Inh], Acc2),
    set(Int, Acc2, Out).
set([Inh|Int], Acc, Out) :-
    member(Inh, Acc),
    set(Int, Acc, Out).
set(In, Out) :-
    set(In, [], Out).
%Implementation with reverse
rev_set([], X, X).
rev_set([Inh|Int], Acc, Out) :-
    not(member(Inh, Acc)),  %Compared to imperative programming, there is no Else flow control can make use of
    rev_set(Int, [Inh|Acc], Out).
rev_set([Inh|Int], Acc, Out) :-
    member(Inh, Acc),
    rev_set(Int, Acc, Out).
rev_set(In, Out) :-
    rev_set(In, [], TempOut),
    rev(TempOut, Out).

%3. Flatten a List
%Basic Logic:
/*
1. check whether an element is a list
2. If Yes, Read its content and check statement 1
3. If statement 1 failed, store the non-list element into a local accumulator
4. If statement 1 succeeded, exectue 2
5. Exit from 2, pass the local acc value to global acc and carry on with state 1
*/
flatten([], Out, Out).
flatten([Inh|Int], Acc, Out) :-
    \+ flatten(Inh, Acc, Out),  %Inh is not a list
    flatten(Int, [Inh|Acc], Out).
flatten([Inh|Int], Acc, Out) :-
    flatten(Inh, Acc, NewAcc),
    flatten(Int, NewAcc, Out).
flatten(In, Out) :-
    flatten(In, [], TempOut),
    reverse(TempOut, Out).

%Insert reversely
% base case
accFlatten([],L,L).
accFlatten(X, AccList, [X|AccList]) :-
    X \= [],
    X \= [_|_].

%% inductive case
accFlatten([HList|TList], AccList, Flat) :-
    accFlatten(TList, AccList, NewAccList),
    accFlatten(HList, NewAccList, Flat).

%% main
accflatten(List, Flat) :-
    accFlatten(List, [], Flat).

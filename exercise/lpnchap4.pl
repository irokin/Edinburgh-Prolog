%Memeber definition
member_my(X, [X|_]).
member_my(X, [_|T]) :-
    (X, T).
member_my(_, []).

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

%4.3
second(X,[_|[H|_]]) :-
    X = H.

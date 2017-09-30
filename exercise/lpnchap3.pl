%Examples used in Chapter 3
is_digesting(X, Y) :- just_ate(X, Y).
is_digesting(X, Y) :-
    just_ate(X, Z),
    is_digesting(Z, Y).

just_ate(a, b).
just_ate(b, c).
just_ate(c, d).

ancestor(X, Y) :-
    parent(Z, Y),
    ancestor(X, Z).
ancestor(X, Y) :-
    parent(X, Y).

parent(x, y).
parent(z, x).
parent(a, z).

%A logic numerical representation of numerals
numerals(0).
numerals(succ(X)) :-
    numerals(X).

add(0, Y, Y).
add(succ(X), Y, succ(Z)) :-
    add(X, Y ,Z).

%Exercise 3.1
/*
Yes, it will be problematic because the recursive clause will lead to infinite looping when there is no ancestor in knowledge base for X.
*/

%Exercise 3.2
directlyin(katarina, olga).
directlyin(olga, natasha).
directlyin(natasha, irina).

in(X, Y) :- directlyin(X, Y).
in(X, Y) :-
    directlyin(Z, Y),
    in(X, Z).

%Exercise 3.3
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelfromto(X, Y) :- directTrain(X, Y).
travelfromto(X, Y) :-
    directTrain(X, Z),
    travelfromto(Z, Y).

%Exercise 3.4
greaterthan(succ(X), 0).
greaterthan(succ(X), succ(Y)) :-
    greaterthan(X, Y).

%Exercise 3.5
swap(leaf(X), Z) :-
    Z = leaf(X).

swap(tree(X, Y), Z) :-
    swap(X, A),
    swap(Y, B),
    Z = tree(B, A).

%Practice 1 Path for The Maze
connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(A, B) :-
    connected(A, B).
path(A, B) :-
    connected(A, C),
    path(C, B).

%Practice 2 Travel Info
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

vehicle(A, B) :-
    byCar(A, B);
    byTrain(A, B);
    byPlane(A, B).

travel(A, B) :-
    vehicle(A, B).
travel(A, B) :-
    vehicle(A, C),
    travel(C, B).

%Practice 3 without print functionality
travel(A, B, C) :-
    vehicle(A, B),
    C = (A, B).
travel(A, B, C) :-
    vehicle(A, D),
    travel(D, B, E),
    C = (A, E).

%Practice 4 indicating vehicle
vehicle(A, B, C) :-
    byCar(A, B),
    C = car;
    byTrain(A, B),
    C = train;
    byPlane(A, B),
    C = plane.

travel_v(A, B, C) :-
    vehicle(A, B, D),
    C = (A, D, B).
travel_v(A, B, C) :-
    vehicle(A, D, F),
    travel_v(D, B, E),
    C = (A, F, E).

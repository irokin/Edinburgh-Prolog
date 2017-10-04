%Exercise 1.4
killer(butch).

married(mia, marsellus).

dead(zed).

kills(marsellus, X) :-
    footmassage(X, mia).

loves(mia, X) :-
    good_dancer(X).

eats(jules, X) :-
    nutritious(X);
    tasty(X).

footmassage(james, mia).
footmassage(zed, james).

good_dancer(ted).
good_dancer(marsellus).

nutritious(nuts).
nutritious(apple).
tasty(muffin).
tasty(chips).

ted.
mia.
nuts.

%Possible Query predicates
/*
loves(mia, X).
eats(jules, X).
kills(marsellus, X).
*/

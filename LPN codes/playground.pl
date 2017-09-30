doctor(james).
doctor(petter).
doctor(lucy).

patient(eric).
patient(yulong).

quack(sam).

diagnose(X, Y) :-
    doctor(X),
    patient(Y);
    quack(X),
    patient(Y).

non_patient(X) :-
    \+ patient(X).

on_screen(Goal) :-
    Goal,
    write(Goal), nl,
    fail.

on_screen(_).

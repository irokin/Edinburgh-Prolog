doctor(james).
doctor(petter).
doctor(lucy).

patient(eric).
patient(yulong).

diagnose(X, Y) :-
    doctor(X),
    patient(Y).

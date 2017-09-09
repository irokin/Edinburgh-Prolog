% A Student IQ determination system in logic programming

student(gary).
student(yulong).
student(james).
student(jack).
student(huan).
student([sam, beking, juicy]).

phd(yulong).
master(james).
master(jack).
master(huan).
undergraduate(gary).

score(yulong, a).
score(james, b).
score(jack, b).
score(huan, a).

% iq/2
% iq(?candidate, ?IQlevel)
% The candidate's IQlevel is ?
% the cut here acts like the if/else control in imperative programming
iq(hugo, low).
iq(times, low).
iq(carol, high).
iq(lucy, high).
iq(X, high) :-
    phd(X),
    score(X, a),
    student(X), !.
iq(X, high) :-
    master(X),
    score(X, a),
    student(X), !.
iq(X, medium) :-
    master(X),
    score(X, b),
    student(X), !.
iq(_, unknown).

% demotion/1
% demotion(+candidate)
% Does this candidate deserve a demotion
% With negation, the query needs to take instantiated argument.
% by default, the program will not list the candidates with proof, it will terminate when first time it failed.
demotion(X) :-
    \+ iq(X, high).

promotion(X) :-
    iq(X, high).

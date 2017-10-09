%Example of Difference List Technique
s(X, Z) :-
    np(X, Y), vp(Y, Z).
np(X, Z) :-
    det(X, Y), n(Y, Z).
vp(X, Z) :-
    v(X, Y), np(Y, Z).
vp(X, Z) :-
    v(X, Z).

det([a|W], W).
det([the|W], W).

n([woman|W], W).
n([man|W], W).

v([shoots|W], W).

%Equivalent DCG representation
sentence --> recur_sentence.
sentence --> recur_sentence, conj, sentence.

recur_sentence --> nounp, verbp.

nounp --> deter, noun.
verbp --> verb, nounp.
verbp --> verb.

deter --> [a].
deter --> [the].
verb --> [shoots].
noun --> [man].
noun --> [woman].

conj --> [and].
conj --> [or].
conj --> [but].

%Example : A Formal Language
sent --> [].    %sent(A, A).
sent --> l, sent, r.
l --> [a].
r --> [b].

%Exercise 7.1
sen(X, Y) :-
    foo(X, A),
    bar(A, B),
    wiggle(B, Y).

recur_foo([choo|W], W).
foo(X, Y) :- recur_foo(X, Y).
foo(X, Y) :-
    recur_foo(X, Z),
    foo(Z, Y).

bar(X, Y) :-
    mar(X, Z),
    zar(Z, Y).
mar(X, Y) :-
    me(X, Z),
    my(Z, Y).
me([i|W], W).
my([am|W], W).
zar(X, Y) :-
    blar(X, Z),
    car(Z, Y).
blar([a|W], W).
car([train|W], W).

recur_wiggle([toot|W], W).
wiggle(X, Y) :- recur_wiggle(X, Y).
wiggle(X, Y) :-
    recur_wiggle(X, Z),
    wiggle(Z, Y).

%7.2
anbn --> [a, b].
anbn --> l1, anbn, r1.
l1 --> [a].
r1 --> [b].

%7.3
anb2n --> [].
anb2n --> l2, anb2n, r2, r2.
l2 --> [a].
r2 --> [b].

%Practical Session 1.
%Even number of a s with empty string allowed
even --> [].
even --> a, a, even.

a --> [a].
b --> [b].
c --> [c].
d --> [d].

%2.
abcd --> [].
abcd --> a, abcd, d.
abcd --> b, b, abcd, c, c.

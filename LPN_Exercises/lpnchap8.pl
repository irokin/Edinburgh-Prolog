%Extra Arguments Example 1 - Concept Grouping

% s --> np(subject), vp.
%
% np(_) --> det, n.
% np(X) --> pro(X).
%
% vp --> v, np(object).
% vp --> v.
%
% det --> [the].
% det --> [a].
%
% n --> [woman].
% n --> [man].
%
% pro(subject) --> [he].
% pro(subject) --> [she].
% pro(object) --> [him].
% pro(object) --> [her].
%
% v --> [shoots].

%Example 2 - Annotation

% s(s(NP, VP)) --> np(NP), vp(VP).
% np(np(Det, N)) --> det(Det), n(N).
% vp(vp(V)) --> v(V).
% vp(vp(V, NP)) --> v(V), np(NP).
%
% det(det(a)) --> [a].
% det(det(the)) --> [the].
%
% n(n(woman)) --> [woman].
% n(n(man)) --> [man].
%
% v(v(shoots)) --> [shoots].

%Example 3

% s(Count) --> ablock(Count), bblock(Count), cblock(Count).
% ablock(0) --> [].
% ablock(succ(Count)) --> [a], ablock(Count).
% bblock(0) --> [].
% bblock(succ(Count)) --> [b], bblock(Count).
% cblock(0) --> [].
% cblock(succ(Count)) --> [c], cblock(Count).

%Extra Goals - Numeric Representation of Example 3
%This implementation is apparently flawed, as the Count remains a variable as it got passed down

% s(Count) --> ablock(Count), bblock(Count), cblock(Count).
% ablock(0) --> [].
% ablock(NewCount) --> [a], ablock(Count), {NewCount is Count + 1}.
% bblock(0) --> [].
% bblock(NewCount) --> [b], bblock(Count), {NewCount is Count + 1}.
% cblock(0) --> [].
% cblock(NewCount) --> [c], cblock(Count), {NewCount is Count + 1}.

%Extra Goals - Lexicon and Grammar Rule Separation

% lex(the, det).
% lex(a, det).
% lex(woman, n).
% lex(man, n).
% lex(shoots, v).
%
% sent --> np, vp.
% np --> det, n.
% vp --> v, np.
% vp --> v.
%
% det --> [Word], {lex(Word, det)}.
% n --> [Word], {lex(Word, n)}.
% v --> [Word], {lex(Word, v)}.

%Exercises
%8.1 Extra Argument for Concept Grouping
% s  -->  np(X),vp(X).
%
% np(X)  -->  det,n(X).
%
% vp(X)  -->  v(X),np(_).
% vp(X)  -->  v(X).
%
% det  -->  [the].
% det  -->  [a].
%
% n(singular)  -->  [woman].
% n(singular)  -->  [man].
% n(singular)  -->  [apple].
% n(singular)  -->  [pear].
% n(plural) --> [men].
%
% v(singular)  -->  [eats].
% v(plural) --> [eat].
% v(plural) --> [know].
% v(singular) --> [knows].

%8.2
kanga(V, R, Q) --> roo(V, R), jumps(Q, Q), {marsupial(V, R, Q)}.
%Translation to Prolog Format
kanga(V, R, Q, X, Y) :-
    roo(V, R, X, Z),
    jumps(Q, Q, Z, Y),
    marsupial(V, R, Q).

%8.5 Practical Session
%1.Extra Argument for Singular/Plural, Subject/Object, Parse Tree Construction, Lexicon Bases
lexi(man, n, singular, _).
lexi(men, n, plural, _).
lexi(woman, n, singular, _).
lexi(women, n, plural, _).
lexi(she, pron, singular, subject).
lexi(her, pron, singular, object).
lexi(he, pron, singular, subject).
lexi(him, pron, singular, object).
lexi(they, pron, plural, subject).
lexi(them, pron, plural, object).
lexi(beautiful, adj, _, _).
lexi(generous, adj, _, _).
lexi(know, v, plural).
lexi(knows, v, singular).
lexi(kiss, v, plural).
lexi(kisses, v, singular).
lexi(a, det, singular).
lexi(the, det, _).

%X is singular/plural, Y subject/object
s(s(NP, VP)) --> np(NP, X, subject), vp(VP, X).

np(np(Det, N), X, Y) --> det(Det, X), n(N, X, Y).
np(np(Det, ADJ, N), X, Y) --> det(Det, X), adj(ADJ), n(N, X, Y).

np(np(N), _, object) --> pron(N, _, object).
np(np(N), X, subject) --> pron(N, X, subject).

vp(vp(V, NP), X) --> v(V, X), np(NP, _, object).
vp(vp(V), X) --> v(V, X).

det(det(Word), X) --> [Word], {lexi(Word, det, X)}.
n(n(Word), X, Y) --> [Word], {lexi(Word, n, X, Y)}.
pron(pron(Word), X, Y) --> [Word], {lexi(Word, pron, X, Y)}.
v(v(Word), X) --> [Word], {lexi(Word, v, X)}.
adj(adj(Word)) --> [Word], {lexi(Word, adj, _, _)}.

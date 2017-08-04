/* Some Bulit-in Prolog predicate:
    listing : display contents of current knowledge base
    halt : stop the Prolog process
    [*.pl] or ['file path'] : consult konwledge base
*/

% woman(mia).
% woman(jody).
% woman(yolanda).
% playsAirGuitar(jody).
% party. /* predicate that takes zero argument */
%
% /* In following statements, we have:
%    5 clauses, 2 facts, 3 rules and 0 relations */
% happy(yolanda).
% listens2Music(mia).
% listens2Music(yolanda) :- happy(yolanda).
% playsAirGuitar(mia) :- listens2Music(mia).
% playsAirGuitar(yolanda) :- listens2Music(yolanda).
%
% /* Facts */
% happy(vincent).
% listens2Music(butch).
%
% /* Conjunction
%    is presented by comma , */
% playsAirGuitar(vincent) :-
%     listens2Music(vincent),
%     happy(vincent).
%
% /* Disjunction
%    In Prolog, Disjunction is presented by semi-colon ; */
% playsAirGuitar(butch) :-
%     happy(butch).
% playsAirGuitar(butch) :-
%     listens2Music(butch).
% playsAirGuitar(butch) :-
%     happy(butch);
%     listens2Music(butch).

/*  Any word beginning with an upper-case letter is a Prolog variable
    A Prolog variable is a placeholder for information. */

% woman(mia).
% woman(jody).
% woman(yolanda).
%
% loves(vincent,mia).
% loves(marsellus,mia).
% loves(pumpkin,honey_bunny).
% loves(honey_bunny,pumpkin).

/*  The variable and unification are features of
    first-order-logic, by default, the unification includes
    recursive and permutation. */

% loves(vincent,mia).
% loves(marsellus,mia).
% loves(pumpkin,honey_bunny).
% loves(honey_bunny,pumpkin).

/* variable can also be used in knowledge base */

% jealous(X,Y) :- loves(X,Z), loves(Y,Z).

/*  There are 4 kinds of terms :
    Atoms, Numbers, variables, and complex terms(Structures)
    Constants : Atoms and Numbers
    Variables and Constants make up simple Terms in Prolog
    */

/* Atom :
    A string of characters including :
    upper-case, lower-case letters, digits and underscore, and begin with
    lower-case letter : big_kahuna_burger;
    An arbitrary sequence of characters enclosed in single quotes :
    'The Gimp', ' ', '$&£*$start'
    The sequence between the single quotes is called the atom name;
    The special characters are also atoms such as:
    :-, ;, , that have pre-defined meaning
*/
% test('&test1^&&^£SDJ').

/* Variables:
    A string of upper/lower/digit/underscore that beings with an upper-case
    letter or with an underscore.
    The character underscore is rather special and is termed anonymouse variable
% */

% test(mia).
% take(mia, math).
% score_satisfy(mia, math).
%
% pass(X, Y) :-
%     test(X),
%     take(X, Y),
%     score_satisfy(X, Y).

/* Complex Terms:
    A functor followed by a sequence of arguments. The functor is an atom,
    and arguments can take any form of term.
    The number of arguments that a complex term has is called its arity.
*/

% father(james, mia).
% father(tod, james).
% father(Z, father(X, Y)) :- father(X, Y).
% grandpa(Z, Y) :- father(Z, father(X, Y)).

/* Chapter 1 Exercises: */
% 1.4
killer(butch).
married(mia, marsellus).
dead(zed).

footmassaage(james, mia).
footmassaage(tom, mia).
kills(marsellus, X) :- footmassaage(X, mia).

loves(mia, X) :-
    good_dancer(X).

nutritious(nuts).
nutritious(fruits).
tasty(spaghtti).
tasty(chomew).
eats(jules, X) :-
    nutritious(X);
    tasty(X).

wizard(ron).
wizard(X):-  hasBroom(X),  hasWand(X).
hasWand(harry).
quidditchPlayer(harry).
hasBroom(X):-  quidditchPlayer(X).

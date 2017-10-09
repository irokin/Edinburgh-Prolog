%printActors is a public predicate, yet displayList is a private one
:- module(printActors, [printActors/1]).

printActors(Film):-
      setof(Actor,starring(Actor,Film),List),
      displayList(List).

displayList([]):-  nl.
displayList([X|L]):-
      write(X),  tab(1),
      displayList(L).

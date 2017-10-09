:- [lib].
:- ensure_loaded([lib]).    %Prolog mechanism for avoiding circular inclusion.

:- use_module(printActors, [printActors/1]).
:- use_module(printMovies, [printMovies/1]).

starring('James Franco', '24 Hour').
starring('Natalia Portman', 'Black Swan').
starring('Jackie Chen', 'Rush Hour').
starring('Emma Stone', 'Gift').

directed('Alan Turing', 'Turing\'s Game').
directed('De\'long Stan', 'Fast and Furious').

%Write to a file
:- open('hogwarts.txt', write, Stream),
    write(Stream, 'Gryffindor'), nl(Stream), close(Stream).
:- open('hogwarts.txt', append, Str),
    write(Str, 'Hufflepuff'), nl(Str),
    write(Str, 'Ravenclaw'), nl(Str),
    write(Str, 'Slytherin'), nl(Str),
    close(Str).
:- open('hogwarts.txt', read, Str),
    read_line_to_string(Str, L1),
    read_line_to_string(Str, L2),
    read_line_to_string(Str, L3),
    read_line_to_string(Str, L4),
    close(Str),
    write([L1, L2, L3, L4]), nl.

readWord(InStream,W):-
      get_code(InStream,Char),
      checkCharAndReadRest(Char,Chars,InStream),
      atom_codes(W,Chars).

checkCharAndReadRest(10,[],_):-  !. %10 is \n

checkCharAndReadRest(32,[],_):-  !. %32 is space

checkCharAndReadRest(-1,[],_):-  !. %-1 is end of stream

checkCharAndReadRest(end_of_file,[],_):-  !.

checkCharAndReadRest(46,[],_):- !.

checkCharAndReadRest(Char,[Char|Chars],InStream):-
    get_code(InStream,NextChar),
    checkCharAndReadRest(NextChar,Chars,InStream).

%Exercise
:- open('hogwarts.houses', write, S),
    tab(S, 10), write(S, 'Gryffindor'), nl(S),
    write(S, 'Hufflepuff'), tab(S, 7), write(S, 'Ravenclaw'), nl(S),
    tab(S, 10), write(S, 'Slytherin'), nl(S),
    close(S).

%2.
:- retractall(word(_, _)).
:- dynamic word/2.

readWords(S, W) :-
    readWords(S, [], W).
readWords(_, '', []) :- !.
readWords(S, _, [H|T]) :-
    readWord(S, W1), H = W1,
    readWords(S, H, T).

word_freq(List) :-
    word_freq(List, []).
word_freq([], _) :- !.
word_freq([''|T], Acc) :-
    word_freq(T, Acc), !.
word_freq([H|T], Acc) :-
    \+ member(H, Acc), !,
    append(Acc, [H], Acc1),
    word_freq(T, H, 1),
    word_freq(T, Acc1).
word_freq([H|T], Acc) :-
    member(H, Acc),
    word_freq(T, Acc).

word_freq([], Ele, Acc) :-
    assert(word(Ele, Acc)), !.
word_freq([H|T], H, Acc) :-
    Acc1 is Acc + 1, !,
    word_freq(T, H, Acc1).
word_freq([_|T], Ele, Acc) :-
    word_freq(T, Ele, Acc).

:- open('test.txt', read, S),
    readWords(S, W),
    close(S),
    write(W), nl,
    word_freq(W).

:- listing(word(_, _)).


% Lab 9 - The Name Game

:- dynamic letter/1.

% Start the program
name_game :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the "Name Game"'), nl,
    write('You will be given a set of English letters in which you will add,delete or move to creae your name.'), nl,
    menu.

% Display menu
menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    execute(Choice).

% 1- Display letters
execute(1) :-
    listing(letter/1),
    menu.

% 2- Add a letter
execute(2) :-
    write('Enter a letter: '),
    read(Letter),
    ( \+ letter(Letter) ->
        assert(letter(Letter)),
        write('Letter added successfully.'), nl
    ;
        write('Letter already exists.'), nl
    ),
    menu.

% 3- Add a letter at the top
execute(3) :-
    write('Enter a letter: '),
    read(Letter),
    ( \+ letter(Letter) ->
        asserta(letter(Letter)),
        write('Letter added at the top.'), nl
    ;
        write('Letter already exists.'), nl
    ),
    menu.

% 4- Add a letter at the bottom
execute(4) :-
    write('Enter a letter: '),
    read(Letter),
    ( \+ letter(Letter) ->
        assertz(letter(Letter)),
        write('Letter added at the bottom.'), nl
    ;
        write('Letter already exists.'), nl
    ),
    menu.

% 5- Delete a letter
execute(5) :-
    write('Enter a letter to delete: '),
    read(Letter),
    ( retract(letter(Letter)) ->
        write('Letter deleted successfully.'), nl
    ;
        write('Letter not found.'), nl
    ),
    menu.

% 6- Delete all letters
execute(6) :-
    retractall(letter(_)),
    write('All letters have been deleted.'), nl,
    menu.

% 7- Exit
execute(7) :-
    write('Goodbye!'), nl,
    !.

% Invalid choice
execute(_) :-
    write('Invalid choice.'), nl,
    menu.

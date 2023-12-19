:- use_module(library(random)).

%starting the game
guess :-
    random(1, 11, RandomNum),  %generating a random number between 1 and 10
    write('Guess a number between 1 and 10.'), nl,
    guess_loop(RandomNum).

%the main loop
guess_loop(RandomNum) :-
    read(Guess), %reading user's input
    (   number(Guess) ->
        check_guess(Guess, RandomNum)
    ;   write('Please enter a valid number.'), nl,
        guess_loop(RandomNum)
    ).

%checking the guess
check_guess(Guess, RandomNum) :-
    Guess < RandomNum ->
    write('Higher.'), nl,
    guess_loop(RandomNum);
    Guess > RandomNum ->
    write('Lower.'), nl,
    guess_loop(RandomNum);
    write('Correct!'), nl.

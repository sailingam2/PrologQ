printn(0) :-write('zero').
printn(1) :-write('one').
printn(2) :-write('two').
printn(3) :-write('three').
printn(4) :-write('four').
printn(5) :-write('five').
printn(6) :-write('six').
printn(7) :-write('seven').
printn(8) :-write('eight').
printn(9) :-write('nine').
printn(d) :-write('-').		


full_words(X) :- full_wordsR(X,L),reverseL(L,Z,Y),printout(Z).

full_wordsR(0,[]).
full_wordsR(X,[H|T]) :-
					X > 0,
					H is X mod 10,
					Y is X // 10,
					full_wordsR(Y,T).

reverseL([],L,L).
reverseL([H|T],L,T1) :- reverseL(T,L,[H|T1]).

printout([N]):- printn(N),!.
printout([N|Tail]):- printn(N),write('-'),printout(Tail).

peg(a).
peg(b).
peg(c).

printab:- write('Move a to b'),nl.
printac:- write('Move a to c'),nl.
printba:- write('Move b to a'),nl.
printbc:- write('Move b to c'),nl.
printca:- write('Move c to a'),nl.
printcb:- write('Move c to b'),nl.

hanoi(1,X,Y,Z):-	X = a, Y = b, printab;
					X = a, Y = c, printac;
					X = b, Y = a, printba;
					X = b, Y = c, printbc;
					X = c, Y = a, printca;
					X = c, Y = b, printcb.

hanoi(N,X,Y,Z) :-	N > 1, 
					N1 is N-1, 
					hanoi(N1,X,Z,Y),
					hanoi(1,X,Y,Z),
					hanoi(N1,Z,Y,X).

divisible(X,Y) :- 0 is mod(X,Y).
divisible(X,Y) :- X > Y+1, divisible(X, Y+1).

isPrime(2).
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).

findprime(P,NextP) :- NextP is P+2, isPrime(NextP).
findprime(P,NextP) :- NextP1 is P+2, findprime(NextP1,NextP).

goldbach(4,[2,2]).
goldbach(N,[X,Y]) :- divisible(N,2),N>4,goldbach(N,[X,Y],3).

goldbach(N,[X,Y],X) :- Y is N-X, isPrime(Y).
goldbach(N,[X,Y],P) :- P<N, findprime(P,NextP),goldbach(N,[X,Y],NextP).
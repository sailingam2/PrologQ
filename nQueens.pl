ismember(A,[A|T]).
ismember(A,[X|T]) :- ismember(A,T).

generatelist(N,N,[N]).
generatelist(X,Y,[X|L]) :- X<Y,X1 is X+1,generatelist(X1,Y,L).

permutationlist(N,L,X):- permutationlist(N,L,X,[]).

permutationlist(N,L,Y,Y):-	length(Y,N).
permutationlist(N,L,X,Y):-	select(A,L,Ml),
							append([A],Y,List1),
							permutationlist(N,Ml,X,List1).

testlist(PermList) :- testlist(PermList,1,[],[]).

testlist([],_,_,_).
testlist([Y|Ytail],X,RightD,LeftD) :- 	R is X-Y,not(ismember(R,RightD)), 
										L is X+Y, not(ismember(L,LeftD)),
										X1 is X+1,
										testlist(Ytail,X1,[R|RightD],[L|LeftD]).


queens(0,[]).
queens(N,PermList) :- 	generatelist(1,N,GenList),
						permutationlist(N,GenList,PermList),
						testlist(PermList).


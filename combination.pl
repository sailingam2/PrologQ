combination(N,L,X):- combination(N,L,X,[]).


combination(N,L,Y,Y):-	length(Y,N).
combination(N,L,X,Y):-	select(A,L,Ml),
						append([A],Y,List1),
						combination(N,Ml,X,List1).
vertex(a).
vertex(b).
vertex(c).
vertex(d).
vertex(e).

edge(a,b,1,[a,b]).
edge(a,c,6,[a,c]).
edge(b,c,4,[b,c]).
edge(b,d,3,[b,d]).
edge(b,e,1,[b,e]).
edge(c,d,1,[c,d]).
edge(c,a,6,[c,a]).
edge(c,b,4,[c,b]).
edge(d,b,3,[d,b]).
edge(d,e,1,[d,e]).
edge(d,c,1,[d,c]).
edge(e,b,1,[e,b]).
edge(e,d,1,[e,d]).



append([],L,L).
append([H|T],L1,[H|L2]) :-append(T,L1,L2).

appendele(1,[],R).

findpath(X,Y,W,Path):- 	edge(X,Y,W,Path).
findpath(X,Y,W,Path):- 	select(Y,[a,b,c,d,e],Graph),findpath(X,Y,W,Path,Graph).

findpath(X,Y,W,Path,L)	:- 	edge(X,Y,W,Path).
findpath(X,Y,W,Path,L) 	:-	edge(X,Z,W1,Path1),member(Z,L),select(Z,L,Ml),
							findpath(Z,Y,W2,Path2,Ml),
							W is W1+W2,
							removehead(Path2,Path2M),
							append(Path1,Path2M,Path).

removehead([_|T],T).

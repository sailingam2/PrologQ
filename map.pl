edge(1,2).
edge(1,3).
edge(1,6).
edge(2,1).
edge(2,3).
edge(2,5).
edge(3,1).
edge(3,2).
edge(3,4).
edge(3,5).
edge(3,6).
edge(4,3).
edge(4,5).
edge(4,6).
edge(5,2).
edge(5,3).
edge(5,4).
edge(6,1).
edge(6,3).
edge(6,4).

changecolororder(N,L,X):- changecolororder(N,L,X,[]).


changecolororder(N,L,Y,Y):-	length(Y,N).
changecolororder(N,L,X,Y):-	select(A,L,Ml),
						append([A],Y,List1),
						changecolororder(N,Ml,X,List1).

search(Node,NotAllowed,[[X,Y]|T],Y) 	:-		not(edge(Node,X)),not(memberchk(Y,NotAllowed)).
search(Node,NotAllowed,[[X,Y]|T],Color) :-				search(Node,[Y|NotAllowed],T,Color).

color_map(CN) :- changecolororder(4,[yellow,red,green,blue],AvailableColors),colorgraph([1,2,3,4,5,6],AvailableColors,[],CN).

colorgraph([],[],CN1,CN1).
colorgraph([N|T],[Color|T1],ColouredNodes,CN) :-	search(N,[],ColouredNodes,Tobegiven),
													colorgraph(T,[Color|T1],[[N,Tobegiven]|ColouredNodes],CN).

colorgraph([N|T],[Color|T1],ColouredNodes,CN) :-	colorgraph(T,T1,[[N,Color]|ColouredNodes],CN).
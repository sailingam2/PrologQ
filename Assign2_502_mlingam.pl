%===========nQueesn===================================

:- use_module(library(clpfd)).

queens(N,Qs) :- 
			length(Qs,N), Qs ins 1..N, 
			all_distinct(Qs), test(Qs),
			label(Qs).

test([]).
test([Q|Remain]) :- 
		test(Q,1,Remain),
		test(Remain).

test(_,_,[]).
test(Q1,D,[Q2|Remain]) :-
			Q1 #\= Q2 + D,
			Q1 #\= Q2 - D,
			D1 #= D + 1,
			test(Q1, D1, Remain).

%========================Sudoku============================

:- use_module(library(clpfd)).

sudoku(Puzzle) :-
					Puzzle = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
					setRows(Puzzle),
					transpose(Puzzle, PuzzleT),
					setColumns(PuzzleT),
					setBox(R1,R2,R3),setBox(R4,R5,R6),setBox(R7,R8,R9),
					flatten(Puzzle,List),label(List).


setRows([]).
setRows([R1|RemainingRows]) :- 
					length(R1,9), R1 ins 1..9,
					all_distinct(R1),setRows(RemainingRows).

setColumns([]).
setColumns([C1|RemainingColumns]) :- 
					length(C1,9), C1 ins 1..9,
					all_distinct(C1),setColumns(RemainingColumns).

setBox([],[],[]).
setBox([A1,A2,A3|A],[B1,B2,B3|B],[C1,C2,C3|C]) :-
    				SomeList = [A1,A2,A3,B1,B2,B3,C1,C2,C3],
					SomeList ins 1..9,
					all_distinct(SomeList),
					setBox(A,B,C).


problem(1, [[_,_,6, 5,9,_, _,_,_],
[_,_,3, _,_,_, _,7,_],
[_,_,_, _,_,_, 5,6,_],
[_,2,_, 1,7,_, _,_,_],
[4,8,5, _,_,_, _,_,_],
[_,6,_, _,_,4, 9,_,_],
[2,_,_, _,_,5, _,_,8],
[_,3,8, _,_,1, _,_,_],
[_,_,_, 3,_,_, 7,5,4]]).

%======================Zebra Puzzle======================

:- use_module(library(clpfd)).

neighbour(A,B) :- ((A #= B+1) #\/ (A #= B-1)).

solveZebra(Zebra,Water) :-
			
			Owners = [English,Spanish,Ukrainian,Norwegian,Japanese],
			Pets = [Serpent,Fox,Dog,Horse,Zebra],
			Cigarettes = [Kool, Chesterfield, LuckyStrike, Kent, Winston],
			Drinks = [Tea, Coffee, Milk, Juice, Water],
			Color = [Red, Green, Blue, White, Yellow],
			setValuesA([Owners,Pets,Cigarettes,Drinks,Color]),
			A = [Owners,Pets,Cigarettes,Drinks,Color],

			English #= Red,
			Spanish #= Dog,
			Green #= Coffee,
			Ukrainian #= Tea,
			neighbour(Green, White),
			Winston #= Serpent,
			Yellow #= Kool,
			Milk #= 3,
			Norwegian #= 1,
			neighbour(Chesterfield,Fox),
			neighbour(Horse,Kool),
			LuckyStrike #= Juice,
			Japanese #= Kent,
			neighbour(Norwegian,Blue),
			flatten(A,List),label(List).

setValuesA([]).
setValuesA([Value|RValues]) :- setValues(Value),
							   setValuesA(RValues).

setValues(Array) :- Array ins 1..5,
					all_distinct(Array).

%====================Map Coloring=======================


:- use_module(library(clpfd)).

color(1,red).
color(2,yellow).
color(3,blue).
color(4,green).

setTuple(D,Color,[D,Color]).

setColors([C1,C2,C3,C4,C5,C6]) :-
				all_distinct([C1,C2]),
				all_distinct([C1,C3]),
				all_distinct([C1,C4]),
				all_distinct([C1,C6]),
				all_distinct([C2,C3]),
				all_distinct([C2,C5]),
				all_distinct([C3,C4]),
				all_distinct([C3,C5]),
				all_distinct([C3,C6]),
				all_distinct([C4,C5]),
				all_distinct([C4,C6]).

setColorstoGraph(_,[],[]).
setColorstoGraph(D,[Tuple|RemainingG],[A1|RemainingColor]) :-
    			color(A1,Y),setTuple(D,Y,Tuple),
    			D1 #= D+1,
    			setColorstoGraph(D1,RemainingG,RemainingColor).

color_map(Graph) :-
    			length(Graph,6),
    			length(Colors,6),
				Colors ins 1..4,
				setColors(Colors),
				label(Colors),
    			setColorstoGraph(1,Graph,Colors).
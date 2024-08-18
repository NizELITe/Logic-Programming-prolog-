maze([
    ['S','W','W','W'],
    [(1,0),(1,1),(1,2),(1,3)],
    [(2,0),'W','W',(2,3)],
    [(3,0),'W','W','E']
]).

wall((2,1), 'W').
wall((2,2), 'W').
wall((3,1), 'W').
wall((3,2), 'W').
wall((0,1), 'W').
wall((0,2), 'W').

goal((3,3), 'E').

move((X1,Y), (X2,Y)) :- X2 is X1 + 1, X2 =< 3.
move((X,Y1), (X,Y2)) :- Y2 is Y1 + 1, Y2 =< 3.

path(X, E, _, []) :- goal(X, E), !.

path(S, E, Visited, [S | Path]) :-
    move(S, Next),
    \+ wall(Next, _),
    \+ member(Next, Visited),
    path(Next, E, [Next | Visited], Path).

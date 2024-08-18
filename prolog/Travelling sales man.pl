route(a1, a2).
route(a2, a3).
route(a3, b1).
route(a3, a4).
route(a4, c1).
route(a4, c2).
route(a4, a5).
route(c1, c3).
route(c1, c4).
route(a5, a6).
route(a6, b2).
route(a6, a7).
route(a7, a9).
route(a7, a8).
route(b2, b3).
route(b3, b4).

connected(X, Y) :-
    route(X, Y); route(Y, X).

path(X, Y, Path) :-
    path(X, Y, [X, Y], P1),
    Path = [X|P1].    

path(X, Y, _, Path) :-
    connected(X, Y),
    Path = [Y].

path(X, Y, Visited, Path) :-
    connected(X, Z),
    \+ member(Z, Visited),
    path(Z, Y, [Z|Visited], P1),
    Path = [Z|P1].

neighboring_stops(Stop, 0, [Stop]) :- !.
neighboring_stops(Stop, N, Neighbors) :-
    N > 0,
    findall(NextStop, (connected(Stop, NextStop), N1 is N - 1, neighboring_stops(NextStop, N1, _)), Neighbors).

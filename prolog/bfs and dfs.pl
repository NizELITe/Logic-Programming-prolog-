vertex(a).
vertex(b).
vertex(c).
vertex(d).
vertex(e).
vertex(f).
vertex(g).
vertex(h).
edge(a, b).
edge(a, c).
edge(c, d).
edge(b, f).
edge(d, e).
edge(e, g).
edge(e, h).


member(X, [X|_]).
member(X, [_|T]) :- member(X, T).


bfs(Start, Goal, Path) :-
    bfs([(Start, [])], Goal, Path).

bfs([(Node, Path)|_], Goal, Path) :-
    Node = Goal.

bfs([(Node, Path)|Queue], Goal, SolutionPath) :-
    findall((Next, [Next|Path]), (edge(Node, Next), not(member(Next, Path)), not(member(Next, Queue)), not(Next = Goal)), NextNodes),
    append(Queue, NextNodes, UpdatedQueue),
    bfs(UpdatedQueue, Goal, SolutionPath).


dfs(Start, Goal, Path) :-
    dfs(Start, Goal, [Start], Path).

dfs(Node, Node, _, [Node]).

dfs(Node, Goal, Visited, [Node|Path]) :-
    edge(Node, Next),
    \+member(Next, Visited),
    dfs(Next, Goal, [Next|Visited], Path).


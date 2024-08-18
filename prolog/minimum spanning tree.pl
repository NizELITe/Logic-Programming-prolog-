vertex(a).
vertex(b).
vertex(c).
vertex(d).
vertex(e).

edge(a, b, 2).
edge(a, d, 5).
edge(b, c, 4).
edge(b, d, 3).
edge(c, d, 1).
edge(c, e, 7).
edge(d, e, 6).
graph([edge(a, b, 2),edge(a, d, 5),
       edge(b, c, 4),edge(b, d, 3),
       edge(c, d, 1),edge(c, e, 7),
        edge(d, e, 6)]).

minimumstree(Graph, Tree) :-
    member(Edge, Graph),
    spread([Edge], Tree, Graph).

spread(Tree1, Tree, Graph) :-
    addedge(Tree1, Tree2, Graph),
    spread(Tree2, Tree, Graph).

spread(Tree, Tree, Graph) :-
    \+ addedge(Tree, _, Graph).

addedge(Tree, [edge(A, B, Z) | Tree], Graph) :-
    adjacent(A, B, Graph),
    node(A, Tree),
    \+ node(B, Tree),
    edge(A, B, X),
    edge(A, B, Y),
    min(X, Y, Z).

adjacent(A, B, Graph) :-
    member(edge(A, B, _), Graph);
    member(edge(B, A, _), Graph).

node(A, Graph) :-
    adjacent(A, _, Graph).

min(X, Y, Min) :-
    X =< Y,
    Min is X.

min(X, Y, Min) :-
    X > Y,
    Min is Y.
%query like this
%minimumstree([edge(a, b, 2),edge(a, d, 5),
 %                edge(b, c, 4),edge(b, d, 3),
  %               edge(c, d, 1),edge(c, e, 7),
   %              edge(d, e, 6)], Tree).


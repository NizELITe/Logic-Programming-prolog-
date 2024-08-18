member(Head,[Head|Tail]).
member(X,[Head|Tail]):- member(X,Tail).
set([]).
set([Head|Tail]):- \+ member(Head,Tail),set(Tail).
set_member(X,Set):- set(Set),member(X,Set).

set_union([], Set2, Set2).
set_union([Head|Tail], Set2, Union) :-
  member(Head, Set2),
  set_union(Tail, Set2, Union).
set_union([Head|Tail], Set2, [Head|Union]) :-
  \+ member(Head, Set2),
  set_union(Tail, Set2, Union).
% query for union set([1,2,3,4,5]),set([3,4,5]),
%set_union([1,2,3,4,5],[3,4,5],UnionSet).

set_intersection([], _, []).
set_intersection([Head|Tail], Set2, [Head|Intersect]) :-
    member(Head, Set2),
    set_intersection(Tail, Set2, Intersect).
set_intersection([Head|Tail], Set2, Intersect) :-
    \+ member(Head, Set2),
    set_intersection(Tail, Set2, Intersect).
%set([1,2,3,4,5]),set([3,4,5]),set_intersection([1,2,3,4,5],[3,4,5],Intersect).

cardinality([],0).
cardinality([Head|Tail],N):- cardinality(Tail,N1),N is N1+1.

set_cardinality([Head|Tail],N):-set([Head|Tail]),cardinality([Head|Tail],N).

difference([],_,[]).
 difference([Head|Tail],Set,[Head|D]):-
 \+member(Head,Set),!,
 difference(Tail,Set,D).
difference([_|Tail],Set,D):- difference(Tail,Set,D).


    


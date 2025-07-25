/* To run this Program
[nqueens].
 n_queens(4,Qs).
*/
:- use_module(library(clpfd)).

n_queens(N, Qs) :-
    length(Qs, N),
    Qs ins 1..N,
    safe_queens(Qs),
    label(Qs).  % <- Required to generate concrete values

safe_queens([]).
safe_queens([Q|Qs]) :-
    safe_queens(Qs),
    no_attack(Q, Qs, 1).

no_attack(_, [], _).
no_attack(Q, [Q1|Qs], D) :-
    Q #\= Q1,
    abs(Q - Q1) #\= D,
    D1 #= D + 1,
    no_attack(Q, Qs, D1).

/* To run this Program
[nqueens].
n_queens(4,Qs).
use ; colon to get more outputs
*/
:- use_module(library(clpfd)).

n_queens(N, Qs) :-
    length(Qs, N),
    Qs ins 1..N,
    all_different(Qs),
    numlist(1, N, Cs),
    maplist(sum, Qs, Cs, SumList),
    all_different(SumList),
    maplist(diff, Qs, Cs, DiffList),
    all_different(DiffList),
    label(Qs).

sum(R, C, S) :- S #= R + C.
diff(R, C, D) :- D #= R - C.


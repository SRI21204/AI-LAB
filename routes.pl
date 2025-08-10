/* To run this Program
 [routes].
 route(a, c, Path, Dist).
 use ; colon to get more outputs
*/

road(a, b, 5). road(b, c, 7). road(a, c, 12).

connected(X, Y, D) :- road(X, Y, D) ; road(Y, X, D).

route(A, B, Path, Dist) :-
    travel(A, B, [A], Path, 0, Dist).

travel(B, B, V, P, D, D) :- reverse(V, P).
travel(A, B, V, P, D0, D) :-
    connected(A, X, DX), \+ member(X, V),
    D1 is D0 + DX, travel(X, B, [X|V], P, D1, D).

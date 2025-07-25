/* To run this Program
 [routes].
 route_path("tampa", "kansas_city", Path, Distance).
 use ; colon to get outputs
*/

% --------------------------------------
% Facts: Direct roads with distances
% --------------------------------------
road("tampa", "houston", 200).
road("gordon", "tampa", 300).
road("houston", "gordon", 100).
road("houston", "kansas_city", 120).
road("gordon", "kansas_city", 130).

% --------------------------------------
% Make roads bidirectional (optional)
% --------------------------------------
connected(X, Y, D) :- road(X, Y, D).
connected(X, Y, D) :- road(Y, X, D).  % makes it undirected

% --------------------------------------
% route_path(Start, End, Path, Distance)
% Finds a path from Start to End with total Distance
% --------------------------------------
route_path(Start, End, Path, Distance) :-
    travel(Start, End, [Start], Path, 0, Distance).

% travel(Current, Goal, Visited, FinalPath, AccumulatedDist, FinalDist)
travel(End, End, Visited, Path, D, D) :-
    reverse(Visited, Path).
travel(Current, Goal, Visited, Path, D0, D) :-
    connected(Current, Next, Dist),
    \+ member(Next, Visited),  % avoid cycles
    D1 is D0 + Dist,
    travel(Next, Goal, [Next | Visited], Path, D1, D).

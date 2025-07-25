/*To run this Program
[puzzle_ids].
ids.
*/
% ------------------------------
% 8-Puzzle State Representation
% ------------------------------
% State is represented as: state(A,B,C,D,E,F,G,H,I)
% Empty space is denoted by '*'

% ------------------------------
% Starting and Goal States
% ------------------------------
start(state(6,1,3,4,*,5,7,2,0)).
goal(state(*,0,1,2,3,4,5,6,7)).

% ------------------------------
% IDS Entry Point
% ------------------------------
ids :-
    start(State),
    length(Moves, N),
    dfs([State], Moves, Path), !,
    show([start | Moves], Path),
    format('~nMoves = ~w~n', [N]).

% ------------------------------
% DFS with path checking
% ------------------------------
dfs([State | States], [], Path) :-
    goal(State), !,
    reverse([State | States], Path).

dfs([State | States], [Move | Moves], Path) :-
    move(State, Next, Move),
    \+ memberchk(Next, [State | States]), % avoid revisiting states
    dfs([Next, State | States], Moves, Path).

% ------------------------------
% Display Puzzle State
% ------------------------------
show([], _).
show([Move | Moves], [State | States]) :-
    State = state(A,B,C,D,E,F,G,H,I),
    format('~n~w~n~n', [Move]),
    format('~w ~w ~w~n', [A,B,C]),
    format('~w ~w ~w~n', [D,E,F]),
    format('~w ~w ~w~n', [G,H,I]),
    show(Moves, States).

% ------------------------------
% Move Rules (up, down, left, right)
% ------------------------------
move(state(*,B,C,D,E,F,G,H,I), state(B,*,C,D,E,F,G,H,I), right).
move(state(*,B,C,D,E,F,G,H,I), state(D,B,C,*,E,F,G,H,I), down).

move(state(A,*,C,D,E,F,G,H,I), state(*,A,C,D,E,F,G,H,I), left).
move(state(A,*,C,D,E,F,G,H,I), state(A,C,*,D,E,F,G,H,I), right).
move(state(A,*,C,D,E,F,G,H,I), state(A,E,C,D,*,F,G,H,I), down).

move(state(A,B,*,D,E,F,G,H,I), state(A,*,B,D,E,F,G,H,I), left).
move(state(A,B,*,D,E,F,G,H,I), state(A,B,F,D,E,*,G,H,I), down).

move(state(A,B,C,*,E,F,G,H,I), state(*,B,C,A,E,F,G,H,I), up).
move(state(A,B,C,*,E,F,G,H,I), state(A,B,C,E,*,F,G,H,I), right).
move(state(A,B,C,*,E,F,G,H,I), state(A,B,C,G,E,F,*,H,I), down).

move(state(A,B,C,D,*,F,G,H,I), state(A,*,C,D,B,F,G,H,I), up).
move(state(A,B,C,D,*,F,G,H,I), state(A,B,C,D,F,*,G,H,I), right).
move(state(A,B,C,D,*,F,G,H,I), state(A,B,C,D,H,F,G,*,I), down).
move(state(A,B,C,D,*,F,G,H,I), state(A,B,C,*,D,F,G,H,I), left).

move(state(A,B,C,D,E,*,G,H,I), state(A,B,*,D,E,C,G,H,I), up).
move(state(A,B,C,D,E,*,G,H,I), state(A,B,C,D,*,E,G,H,I), left).
move(state(A,B,C,D,E,*,G,H,I), state(A,B,C,D,E,I,G,H,*), down).

move(state(A,B,C,D,E,F,*,H,I), state(A,B,C,D,E,F,H,*,I), left).
move(state(A,B,C,D,E,F,*,H,I), state(A,B,C,*,E,F,D,H,I), up).

move(state(A,B,C,D,E,F,G,*,I), state(A,B,C,D,E,F,*,G,I), left).
move(state(A,B,C,D,E,F,G,*,I), state(A,B,C,D,*,F,G,E,I), up).
move(state(A,B,C,D,E,F,G,*,I), state(A,B,C,D,E,F,G,I,*), right).

move(state(A,B,C,D,E,F,G,H,*), state(A,B,C,D,E,*,G,H,F), up).
move(state(A,B,C,D,E,F,G,H,*), state(A,B,C,D,E,F,G,*,H), left).

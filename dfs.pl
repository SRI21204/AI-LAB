% Define the goal node
goal(g).  % <-- You can change 'g' to your actual goal node

% Define state transitions (edges in the graph)
% s(Node, NextNode) represents a directed edge from Node to NextNode
s(a, b).
s(b, c).
s(c, g).
s(a, d).
s(d, e).
s(e, g).

% solve(Node, Solution):
% Solution is a path (in reverse order) from Node to a goal node
solve(Node, Solution) :-
    depthfirst([], Node, Solution).

% depthfirst(Path, Node, Solution):
% Builds Solution by extending the path [Node | Path] to a goal
depthfirst(Path, Node, [Node | Path]) :-
    goal(Node).

depthfirst(Path, Node, Solution) :-
    s(Node, Next),
    \+ member(Next, Path),        % Avoid cycles
    depthfirst([Node | Path], Next, Solution).

% depthfirst2(Node, Path, MaxDepth):
% Bounded Depth-First Search variant
depthfirst2(Node, [Node], _) :-
    goal(Node).

depthfirst2(Node, [Node | Path], MaxDepth) :-
    MaxDepth > 0,
    s(Node, Next),
    NewDepth is MaxDepth - 1,
    depthfirst2(Next, Path, NewDepth).

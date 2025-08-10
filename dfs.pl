/* To run the program
[dfs].
path(a,P).
use ; colon to get more outputs
*/
goal(g).
s(a,b). s(b,c). s(c,g). s(a,d). s(d,e). s(e,g).

path(Node, [Node]) :- goal(Node).
path(Node, [Node|Rest]) :- s(Node, Next), path(Next, Rest).

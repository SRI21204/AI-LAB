/*To run this Program
[puzzle].
ids.
*/

start(state(1,*,2,3)).
goal(state(*,1,2,3)).

ids :- start(S), between(0,5,N), length(M,N), dfs(S,M,[S],P), !, show([start|M],P).

dfs(S,[],P,P):-goal(S).
dfs(S,[Mv|Ms],V,P):-move(S,N,Mv),\+member(N,V),dfs(N,Ms,[N|V],P).

move(state(*,B,C,D), state(B,*,C,D), right).
move(state(*,B,C,D), state(C,B,*,D), down).
move(state(A,*,C,D), state(*,A,C,D), left).
move(state(A,*,C,D), state(A,C,*,D), down).
move(state(A,B,*,D), state(*,B,A,D), up).
move(state(A,B,*,D), state(A,B,D,*), right).
move(state(A,B,C,*), state(*,B,C,A), up).
move(state(A,B,C,*), state(A,B,*,C), left).

show([], _).
show([M|Ms],[state(A,B,C,D)|Ss]):-nl,write(M),nl,write(A),write(' '),write(B),nl,write(C),write(' '),write(D),nl,show(Ms,Ss).

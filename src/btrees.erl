-module(btrees).
-export([sum/1, max/1, min/1, is_ordered/1, insert/2, gentree/1, test_list/0]).
-import(lists,[]).
-include("btrees.hrl").

sum(#btree{left = empty, right = empty, value = V}) -> V;
sum(#btree{left = L, right = empty, value = V}) -> V + sum(L); 
sum(#btree{left = empty, right = R, value = V}) -> V + sum(R);
sum(#btree{left = L, right = R, value = V}) -> V + sum(L) + sum(R).

max(#btree{left = empty, right = empty, value = V}) -> V;
max(#btree{left = L, right = empty, value = V}) -> max(V, max(L));
max(#btree{left = empty, right = R, value = V}) -> max(V, max(R));
max(#btree{left = L, right = R, value = V}) -> max3(V, max(L), max(R)).

min(#btree{left = empty, right = empty, value = V}) -> V;
min(#btree{left = L, right = empty, value = V}) -> min(V, min(L));
min(#btree{left = empty, right = R, value = V}) -> min(V, min(R));
min(#btree{left = L, right = R, value = V}) -> min3(V, min(L), min(R)).

is_ordered(#btree{left = empty, right = empty}) -> true;
is_ordered(#btree{left = L, right = empty, value = V}) -> is_ordered(L) and (max(L) =< V);
is_ordered(#btree{left = empty, right = R, value = V}) -> is_ordered(R) and (V =< min(R));
is_ordered(#btree{left = L, right = R, value = V}) -> is_ordered(L) and is_ordered(R) and (max(L) =< V) and (V =< min(R)).

insert(E, empty) -> E;
insert(#btree{value = Vnew} = E, #btree{left = L, value = V} = T) when Vnew =< V -> T#btree{left = insert(E, L)};
insert(#btree{value = Vnew} = E, #btree{right = R, value = V} = T) when V < Vnew -> T#btree{right = insert(E, R)}.
                                                                        
test_list() -> [#btree{value=1}, #btree{value=2}, #btree{value=4}, #btree{value=3}, #btree{value=2}, #btree{value=28}, #btree{value=100}, #btree{value=-1}, #btree{value=-100}, #btree{value=2001}, #btree{value=162000}, #btree{value=17}, #btree{value=29}, #btree{value=18}, #btree{value=3}, #btree{value=6}, #btree{value=3}, #btree{value=-100}].
gentree(List) -> lists:foldr(fun(E, Acc) -> insert(E, Acc) end, empty, List). 

% Internal functions
max3(A,B,C) -> max(A, max(B, C)).
min3(A,B,C) -> min(A, min(B, C)).

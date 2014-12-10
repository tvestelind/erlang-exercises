%% @author Tomas Vestelind
%% @doc This modules provides basic functionality on binary trees.
%%      A binary tree is a node that may be connected to up to 2 other
%%      nodes. Each node must also contains a value, which by default is 0.
%%

-module(btrees).
-export([sum/1, max/1, min/1, is_ordered/1, insert/2]).
-import(lists,[]).
-include("btrees.hrl").

%% @doc Find the largest value stored in the tree.
-spec(max(Tree::#btree{}) -> integer()).

max(#btree{left = empty, right = empty, value = V}) -> V;
max(#btree{left = L, right = empty, value = V}) -> erlang:max(V, max(L));
max(#btree{left = empty, right = R, value = V}) -> erlang:max(V, max(R));
max(#btree{left = L, right = R, value = V}) -> max3(V, max(L), max(R)).

%% @doc Find the smallest value stored in the tree.
-spec(min(Tree::#btree{}) -> integer()).

min(#btree{left = empty, right = empty, value = V}) -> V;
min(#btree{left = L, right = empty, value = V}) -> erlang:min(V, min(L));
min(#btree{left = empty, right = R, value = V}) -> erlang:min(V, min(R));
min(#btree{left = L, right = R, value = V}) -> min3(V, min(L), min(R)).

%% @doc Sum all values in the tree.
-spec(sum(Tree::#btree{}) -> integer()).

sum(#btree{left = empty, right = empty, value = V}) -> V;
sum(#btree{left = L, right = empty, value = V}) -> V + sum(L);
sum(#btree{left = empty, right = R, value = V}) -> V + sum(R);
sum(#btree{left = L, right = R, value = V}) -> V + sum(L) + sum(R).

%% @doc Check if the tree is ordered such that for each node, all nodes to the
%%      left contain lower or equal values and all nodes to the right contain
%%      larger values.
-spec(is_ordered(Tree::#btree{}) -> boolean()).

is_ordered(#btree{left = empty, right = empty}) -> true;
is_ordered(#btree{left = L, right = empty, value = V}) -> is_ordered(L) and (max(L) =< V);
is_ordered(#btree{left = empty, right = R, value = V}) -> is_ordered(R) and (V < min(R));
is_ordered(#btree{left = L, right = R, value = V}) -> is_ordered(L) and is_ordered(R) and (max(L) =< V) and (V < min(R)).

%% @doc Insert an element into an already ordered tree such that the tree
%%      remains ordered according to the rules in @see is_ordered/1.
-spec(insert(Element::#btree{}, Tree::#btree{}) -> NewTree::#btree{}).

insert(E, empty) -> E;
insert(#btree{value = Vnew} = E, #btree{left = L, value = V} = T) when Vnew =< V -> T#btree{left = insert(E, L)};
insert(#btree{value = Vnew} = E, #btree{right = R, value = V} = T) when V < Vnew -> T#btree{right = insert(E, R)}.

% Internal functions

-spec(max3(integer(), integer(), integer()) -> integer()).

max3(A,B,C) -> max(A, max(B, C)).

-spec(min3(integer(), integer(), integer()) -> integer()).

min3(A,B,C) -> min(A, min(B, C)).

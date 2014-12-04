-module(btrees).
-export([tsum/1, tmax/1]).
-include("btrees.hrl").

tsum(empty) -> 0;
tsum(#btree{node1 = N1, node2 = N2, value = V}) -> V + tsum(N1) + tsum(N2).

tmax(empty) -> 0;
tmax(#btree{node1 = N1, node2 = N2, value = V}) -> max3(V, tmax(N1), tmax(N2)).

max3(A,B,C) -> max(A, max(B, C)).

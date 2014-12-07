-module(bm).
-export([bm_opt/0, bm_naive/0, bm_tail/0]).
-import(timer,[]).
-import(exercise3,[]).
-import(lists,[]).

bm_opt() -> io:format("Testing lists:reverse~n"),
            bm(fun lists:reverse/1, 100).

bm_naive() -> io:format("Testing exercise3:naive_reverse~n"),
              bm(fun exercise3:naive_reverse/1, 1).

bm_tail() -> io:format("Testing exercise3:tail_reverse~n"),
             bm(fun exercise3:tail_reverse/1, 100).

bm(F, Samples) -> P = fun(N) -> print(N, average(time(F, create(N), Samples))) end,
                    lists:foreach(P, [1, 10, 100, 1000, 10000, 100000, 1000000]).

% Internal functions
create(N) -> lists:seq(1,N).

average(L) -> lists:sum(L) / length(L).

time(F, L, 0) -> [fst(timer:tc(F, [L]))];
time(F, L, Samples) -> [fst(timer:tc(F, [L])) | time(F, L, Samples - 1)].

fst({A,_}) -> A.

print(E, N) -> io:format("Elem ~p: ~p~n", [E, N]).

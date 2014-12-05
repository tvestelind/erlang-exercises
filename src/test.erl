-module(test).
-export([test_opt/0, test_naive/0, test_tail/0]).
-import(timer,[]).
-import(exercise3,[]).
-import(lists,[]).

test_opt() -> io:format("Testing lists:reverse~n"),
              test(fun lists:reverse/1, 100).

test_naive() -> io:format("Testing exercise3:naive_reverse~n"),
                test(fun exercise3:naive_reverse/1, 1).

test_tail() -> io:format("Testing exercise3:tail_reverse~n"),
               test(fun exercise3:tail_reverse/1, 100).

test(F, Samples) -> P = fun(N) -> print(N, average(time(F, create(N), Samples))) end,
                    lists:foreach(P, [1, 10, 100, 1000, 10000, 100000, 1000000]).

% Internal functions
create(N) -> lists:seq(1,N).

average(L) -> lists:sum(L) / length(L).

time(F, L, 0) -> [fst(timer:tc(F, [L]))];
time(F, L, Samples) -> [fst(timer:tc(F, [L])) | time(F, L, Samples - 1)].

fst({A,_}) -> A.

print(E, N) -> io:format("Elem ~p: ~p~n", [E, N]).

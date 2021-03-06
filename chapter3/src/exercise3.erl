-module(exercise3).
-export([sum/1,sum/2, create/1, reverse_create/1, print/2, filter/2, naive_reverse/1, tail_reverse/1, concatenate/1, flatten/1]).
-import(lists,[]).

% Exercise 1
sum(N) -> lists:sum(lists:seq(1,N)).

sum(N, M) when N >= 0, N =< M -> lists:sum(lists:seq(N,M));
sum(_, _) -> exit("the second argument must be equal to or larger than the first").

% Exercise 2
create(N) -> lists:seq(1,N).

reverse_create(N) -> lists:reverse(create(N)).

% Exercise 3
print(all, N) -> lists:foreach(fun printa/1, create(N));
print(even, N) -> lists:foreach(fun printa/1, lists:filter(fun(A) -> (A rem 2) =:= 0 end, create(N))).

printa(N) -> io:format("Number: ~p~n",[N]).

% Exercise 5
filter([], _) -> [];
filter([H|T], N) when H =< N -> [H | filter(T,N)];
filter([_|T], N) -> filter(T,N).

naive_reverse([]) -> [];
naive_reverse([H|T]) -> naive_reverse(T) ++ [H].

tail_reverse(L) -> tail_reverse(L, []).
tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H | Acc]).

concatenate([]) -> [];
concatenate([H|T]) -> H ++ concatenate(T).

flatten([]) -> [];
flatten([H|T]) when is_list(H) -> concatenate([flatten(H), flatten(T)]);
flatten([H|T]) -> [H|flatten(T)].

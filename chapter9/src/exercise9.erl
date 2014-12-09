-module(exercise9).
-export([print/2, filter/2, concat/1, sum/1, divByThree/0, squaredInts/1, intersection/2, symmetricDiff/2]).
-export([zip/2, zipWith/3]).
-import(math,[]).
-import(lists,[]).

% 9-1
create(N) -> lists:seq(1,N).

print(all, N) -> lists:foreach(fun printa/1, create(N));
print(even, N) -> lists:foreach(fun printa/1, lists:filter(fun(A) -> (A rem 2) =:= 0 end, create(N))).

printa(N) -> io:format("Number: ~p~n",[N]).

filter(N, Ns) -> lists:filter(fun(M) -> M =< N end, Ns).

concat(L) -> lists:concat(L).

sum(L) -> lists:foldl(fun(A,B) -> A + B end, 0, L).

% 9-2
divByThree() -> [ X || X <- lists:seq(1,10), (X rem 3) =:= 0].

squaredInts(L) -> [ math:pow(X,2) || X <- L, is_integer(X)].

intersection(A,B) -> [ X || X <- A, lists:member(X,B)].

symmetricDiff(A,B) -> [ X || X <- (A ++ B), not(lists:member(intersection(A,B))) ].

% 9-3
zip(_,[]) -> [];
zip([],_) -> [];
zip([A|Al],[B|Bl]) -> [ {A,B} | zip(Al,Bl) ].

zipWith(F, A, B) -> [ F(Ea,Eb) || {Ea,Eb} <- zip(A,B) ].


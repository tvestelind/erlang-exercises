-module(demo).
-export([double/1]).

double(N) -> times(N,2).

times(A,B) -> A*B.

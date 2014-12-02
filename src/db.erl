-module(db).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).

new() -> [].

destroy(_) -> ok.

write(Key, Elem, Db) -> [{Key, Elem} | delete(Key, Db)].

delete(Key, Db) -> del(Key, [], Db).

del(_, NewDb, []) -> NewDb;
del(Key, NewDb, [{Key,_}|T]) -> NewDb ++ T;
del(Key, NewDb, [H|T]) -> del(Key, [H|NewDb], T).

read(Key, Db) -> find(Key, Db).

find(_, []) -> {error, instance};
find(Key, [{Key,E}|_]) -> {ok, E};
find(Key, [_|T]) -> find(Key, T).

match(Elem, Db) -> find_e(Elem, [], Db).

find_e(_, Matches, []) -> Matches;
find_e(Elem, Matches, [{K,Elem}|T]) -> find_e(Elem, [K|Matches], T);
find_e(Elem, Matches, [_|T]) -> find_e(Elem, Matches, T).

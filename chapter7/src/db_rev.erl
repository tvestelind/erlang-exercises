-module(db_rev).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).
-include("db_rev.hrl").

new() -> [].

destroy(_) -> ok.

write(Key, Elem, Db) -> [#data{key = Key, data = Elem} | delete(Key, Db)].

delete(Key, Db) -> del(Key, [], Db).

del(_, NewDb, []) -> NewDb;
del(Key, NewDb, [#data{key = Key} | T]) -> NewDb ++ T;
del(Key, NewDb, [H | T]) -> del(Key, [H | NewDb], T).

read(_, []) -> {error, instance};
read(Key, [#data{key = Key, data = E} | _]) -> {ok, E};
read(Key, [_ | T]) -> read(Key, T).

match(Elem, Db) -> find_e(Elem, [], Db).

find_e(_, Matches, []) -> Matches;
find_e(Elem, Matches, [#data{key = K, data = Elem} | T]) -> find_e(Elem, [K | Matches], T);
find_e(Elem, Matches, [_ | T]) -> find_e(Elem, Matches, T).

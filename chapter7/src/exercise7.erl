-module(exercise7).
-export([birthday/1, joe/0, showPerson/1, foobar/1]).
-record(person, {name, address, age=0, phone=""}).

birthday(P = #person{age=Age}) -> P#person{age = Age+1}.

joe() -> #person{name = "Joe", age = 21, phone = "999-999"}.

showPerson(#person{name = Name, address = Address, age = Age, phone = Phone}) ->
    io:format("name: ~p address: ~p age: ~p phone: ~p", [Name, Address, Age, Phone]).

foobar(P) when is_record(P, person), P#person.name =:= "Joe" -> "Joe".

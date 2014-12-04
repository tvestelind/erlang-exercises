-module(shapes).
-export([area/1, perimiter/1]).
-include("shapes.hrl").

area(#circle{radius = R}) -> R * R * 3.14;
area(#rectangle{width = W, length = L}) -> W * L.

perimiter(#circle{radius = R}) -> 2 * R * 3.14;
perimiter(#rectangle{width = W, length = L}) -> 2 * (W + L).

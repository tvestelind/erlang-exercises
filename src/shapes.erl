-module(shapes).
-export([area/1, perimiter/1]).
-import(math,[]).
-include("shapes.hrl").

area(#circle{radius = R}) -> R * R * 3.14;
area(#rectangle{width = W, length = L}) -> W * L;
area(#triangle{a = S1, b = S2, c = S3}) -> S = (S1 + S2 + S3) / 2,
                                           math:sqrt(S * (S - S1) * (S - S2) * (S - S3)).

perimiter(#circle{radius = R}) -> 2 * R * 3.14;
perimiter(#rectangle{width = W, length = L}) -> 2 * (W + L);
perimiter(#triangle{a = S1, b = S2, c = S3}) -> S1 + S2 + S3.

module Main exposing (..)

import Debug exposing (log)


output : String
output =
    log "output" x


x : String
x =
    f alice


alice : String
alice =
    "Alice"


f : String -> String
f user =
    "Hi, " ++ user ++ "!"

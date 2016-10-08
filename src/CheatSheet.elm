module Main exposing (..)

import Debug exposing (log)


output : String
output =
    log "output" x


x : String
x =
    f alice


type User
    = UserCons
        { name : String
        , age : Int
        , username : String
        , role : Role
        }
    | Anonymous


type Role
    = Admin
    | User


renderRole : String -> Role -> String
renderRole username role =
    let
        inner =
            case role of
                Admin ->
                    "logged in as " ++ username ++ " (admin)"

                User ->
                    "logged in as " ++ username
    in
        "(" ++ inner ++ ")"


alice : User
alice =
    UserCons
        { name = "Alice"
        , age = 42
        , username = "alice"
        , role = Admin
        }


f user =
    case user of
        UserCons rec ->
            rec.name
                ++ " "
                ++ renderRole rec.username rec.role
                ++ " is "
                ++ toString rec.age
                ++ " years old."

        Anonymous ->
            "not logged in"

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
    case role of
        Admin ->
            "logged in as " ++ username ++ " (admin)"

        User ->
            "logged in as " ++ username


alice : User
alice =
    UserCons
        { name = "Alice"
        , age = 42
        , username = "alice"
        , role = Admin
        }


f : User -> String
f user =
    case user of
        UserCons { name, age, username, role } ->
            name
                ++ " ("
                ++ renderRole username role
                ++ ") is "
                ++ toString age
                ++ " years old."

        Anonymous ->
            "not logged in"

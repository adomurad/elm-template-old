module Main exposing (..)

import Models exposing (Model, Msg(..))
import Views exposing (view)
import Update exposing (update)
import Html exposing (..)
import Time exposing (Time, second)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( Model []
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second TimeTick

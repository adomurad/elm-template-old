module Update exposing (update)

import Models exposing (Model, Msg(..), TemperaturePoint)
import Debug
import ProbeClient


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TimeTick _ ->
            update GetNewTemperature model

        GetNewTemperature ->
            ( model, ProbeClient.getTemperature GotNewTemperature )

        GotNewTemperature (Ok temp) ->
            ( { model | temperaturePoints = appendTemperature model.temperaturePoints temp }, Cmd.none )

        GotNewTemperature (Err err) ->
            let
                _ =
                    Debug.log "Error while trying to get data: " err
            in
                ( model, Cmd.none )


appendTemperature : List TemperaturePoint -> TemperaturePoint -> List TemperaturePoint
appendTemperature list temp =
    list
        |> flip List.append [ temp ]
        |> List.reverse
        |> List.take 224
        |> List.reverse

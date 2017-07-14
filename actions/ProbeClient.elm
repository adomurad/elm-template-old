module ProbeClient exposing (getTemperature)

import Http
import Json.Decode exposing (Decoder, field, int, float)
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (TemperaturePoint, Msg)


getTemperature : (Result Http.Error TemperaturePoint -> Msg) -> Cmd Msg
getTemperature msg =
    let
        url =
            "localhost/api/temperature"
    in
        Http.send msg (Http.get url decodeTemperature)


decodeTemperature : Decoder TemperaturePoint
decodeTemperature =
    decode TemperaturePoint
        |> required "time" int
        |> required "temperature" float

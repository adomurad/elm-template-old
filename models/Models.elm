module Models exposing (Model, Msg(..), TemperaturePoint)

import Http
import Time exposing (Time)


type alias Model =
    { temperaturePoints : List TemperaturePoint
    }


type Msg
    = GotNewTemperature (Result Http.Error TemperaturePoint)
    | GetNewTemperature
    | TimeTick Time


type alias TemperaturePoint =
    { time : Int
    , temperature : Float
    }

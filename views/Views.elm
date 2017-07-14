module Views exposing (view)

import Models exposing (Model, Msg(..), TemperaturePoint)
import Html exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ Html.text "List of temperaturki2" ]
        , svg [ width "900", height "400", viewBox "0 0 900 400" ]
            [ polyline [ fill "none", stroke "black", strokeWidth "3", points (getChartPairs (normalize model.temperaturePoints)) ] [] ]

        -- , ul [] (List.map renderTemperatureElement model.temperaturePoints)
        ]


normalize : List TemperaturePoint -> List TemperaturePoint
normalize list =
    let
        minTime =
            case (List.head list) of
                Just a ->
                    a.time

                Nothing ->
                    0
    in
        list
            |> List.map (\el -> { time = (round ((toFloat el.time / 1000) - (toFloat minTime / 1000))) * 4, temperature = (400 - ((el.temperature - 15) / 10) * 400) })


getChartPairs : List TemperaturePoint -> String
getChartPairs list =
    list
        |> List.map (\el -> toString el.time ++ "," ++ toString el.temperature ++ " ")
        |> List.foldr (++) ""


renderTemperatureElement : TemperaturePoint -> Html Msg
renderTemperatureElement tempPoint =
    li []
        [ Html.text ("Time: " ++ toString tempPoint.time ++ " Temperature: " ++ toString tempPoint.temperature)
        ]

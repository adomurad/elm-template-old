module Example exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, list, int, string)
import Test exposing (..)


suite : Test
suite =
    describe "Elm test suite"
        [ describe "First test suite"
            [ test "should pass" <|
                \_ ->
                    let
                        value =
                            { name = "artur" }
                    in
                        Expect.equal { name = "artur" } value
            , test "should fail1" <|
                \_ ->
                    let
                        value =
                            { name = "artur" }
                    in
                        Expect.equal { name = "artur2" } value
            , test "should fail 2" <|
                \_ ->
                    let
                        value =
                            { name = "artur" }
                    in
                        Expect.equal { name = "artur2" } value
            , todo "some test i forgotten to do"
            ]
        ]

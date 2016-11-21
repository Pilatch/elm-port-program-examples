port module Main exposing (..)

import Mangle exposing (mangle)
import String
import Json.Decode


port input : (MangleMe -> msg) -> Sub msg


port output : Mangled -> Cmd a


type alias Mangled =
    String


type alias MangleMe =
    String


type alias MangledModel =
    { numberOfMangles : Int, mangleOffset : Int, longestMangle : String }


type Msg
    = MangleRequestedOn MangleMe


initialMangledModel : MangledModel
initialMangledModel =
    MangledModel 0 1 ""


update : Msg -> MangledModel -> ( MangledModel, Cmd a )
update msg { numberOfMangles, mangleOffset, longestMangle } =
    case msg of
        MangleRequestedOn mangleMe ->
            let
                mangled =
                    mangle mangleOffset mangleMe

                newLongestMangle =
                    if String.length mangled > String.length longestMangle then
                        mangled
                    else
                        longestMangle

                newModel =
                    MangledModel (numberOfMangles + 1) (mangleOffset + 2) newLongestMangle
            in
                ( newModel, output mangled )


subscriptions : MangledModel -> Sub Msg
subscriptions mangledModel =
    input MangleRequestedOn


main : Program Never MangledModel Msg
main =
    Platform.program
        { init = ( initialMangledModel, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        }

port module Greet exposing (..)

import Json.Decode

port greet : String -> Cmd a

port inputName : (String -> msg) -> Sub msg

port inputHobby : (String -> msg) -> Sub msg

type Msg = Name String | Hobby String

type alias Model = { visitors : Int }

update : Msg -> Model -> ( Model, Cmd a )
update msg model =
  case msg of
      Name name ->
        let newModel =
              model.visitors + 1 |> Model
            greeting =
              "Hello " ++ name ++ ", you are visitor number " ++ toString newModel.visitors ++ "."
        in
          (newModel, greet greeting)
      Hobby hobby ->
        let greeting =
            "Would you like to participate in some " ++ hobby ++ " with our " ++ toString model.visitors ++ " visitor(s)?"
        in
            (model, greet greeting)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch [
    inputName Name,
    inputHobby Hobby
  ]

main =
  Platform.program {
    init = ({ visitors = 0 }, Cmd.none),
    update = update,
    subscriptions = subscriptions
  }

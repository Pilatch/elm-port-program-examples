port module Greet exposing (..)

import Json.Decode

port greet : String -> Cmd a

port inputTitle : (String -> msg) -> Sub msg

port inputPasstime : (String -> msg) -> Sub msg

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
            "Would you like to participate in some " ++ hobby ++ " with our " ++ toString model.visitors ++ " visitors?"
        in
            (model, greet greeting)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch [
    inputTitle Name,
    inputPasstime Hobby
  ]

-- Elm assumes that your program will only have one input port.
-- Regardless of what you name that port in your Elm code, it will be named `input`
-- though the outbound ports will retain their names.
-- How should I specify that I'm sending to inputHobby instead of inputName?

main =
  Platform.program {
    init = ({ visitors = 0 }, Cmd.none),
    update = update,
    subscriptions = subscriptions
  }

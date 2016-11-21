module Mangle exposing (..)

import Char
import List
import String


mangleChar : Int -> Char -> Char
mangleChar offset char =
    char
        |> Char.toCode
        |> (+) offset
        |> Char.fromCode


mangle : Int -> String -> String
mangle offset str =
    let
        mangleCharWithOffset =
            mangleChar offset
    in
        str
            |> String.toList
            |> List.foldl (\char charList -> mangleCharWithOffset char :: charList) []
            |> String.fromList

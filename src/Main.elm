module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)



-- MAIN


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MODEL


type alias Model =
    Int


init : () -> ( Model, Cmd Msg )
init _ =
    ( 0, Cmd.none )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Wonderhond"
    , body =
        [ main_ []
            [ div [ class "artwork" ] []
            , div [ class "content" ]
                [-- viewSoundCloudIframes
                ]
            , viewFooter
            ]
        ]
    }


viewSoundCloudIframes : Html Msg
viewSoundCloudIframes =
    ul [ class "soundcloud-list" ] <|
        List.map viewIframe
            [ "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/621098688&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            , "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/598755735&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            , "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/586096575&color=%23ff5500&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"
            ]


viewIframe : String -> Html Msg
viewIframe url =
    li [ class "soundcloud-list__item" ]
        [ iframe
            [ height 166
            , src url
            , attribute "frameborder" "0"
            , attribute "width" "100%"
            , sandbox "allow-same-origin allow-scripts"
            ]
            []
        ]


viewFooter : Html Msg
viewFooter =
    footer []
        [ p []
            [ a
                [ target "_blank"
                , rel "noopener noreferrer"
                , href "mailto:contact@wonderhond.de"
                ]
                [ text "contact@wonderhond.de" ]
            ]
        , p []
            [ text "design by "
            , a
                [ target "_blank"
                , rel "noopener noreferrer"
                , href "https://annevandenboogaard.com"
                ]
                [ text "annevandenboogaard.com" ]
            ]
        ]

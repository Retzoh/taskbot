module Main exposing (main, view)

-- import Html exposing (Html, div, h1, text)

import Browser
import Css
import Css.Global
import Html.Styled exposing (Html, div, h1, styled, text)


main : Program () Model msg
main =
    Browser.element
        { init = init
        , update = updateAppWith
        , subscriptions = subscriptions
        , view = view >> Html.Styled.toUnstyled
        }



-- MODEL


type alias Model =
    {}


init : () -> ( Model, Cmd msg )
init _ =
    ( Model, Cmd.none )



-- UPDATE


updateAppWith : msg -> Model -> ( Model, Cmd msg )
updateAppWith _ model =
    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html msg
view _ =
    mainLayout <|
        contentLayout [ h1 [] [ text "Hello world" ] ]
            ++ globalStyles


mainLayout : List (Html msg) -> Html msg
mainLayout =
    Html.Styled.styled div mainLayoutStyles []


contentLayout : List (Html msg) -> List (Html msg)
contentLayout content =
    [ Html.Styled.styled div contentLayoutStyles [] content ]



-- STYLES


globalStyles : List (Html msg)
globalStyles =
    [ Css.Global.global
        [ Css.Global.body
            [ Css.height (Css.pct 100)
            , Css.fontFamilies [ "Montserrat" ]
            , Css.textAlign Css.justify
            , Css.margin (Css.px 0)
            ]
        , Css.Global.html
            [ Css.height (Css.pct 100) ]
        ]
    ]


mainLayoutStyles : List Css.Style
mainLayoutStyles =
    [ Css.maxWidth (Css.ch 70)
    , Css.paddingLeft (Css.ch 2)
    , Css.paddingRight (Css.ch 2)
    , Css.margin Css.auto
    , Css.position Css.relative
    , Css.height (Css.pct 100)
    , Css.displayFlex
    , Css.flexDirection Css.column
    , Css.alignItems Css.center
    , Css.justifyContent Css.stretch
    ]


contentLayoutStyles : List Css.Style
contentLayoutStyles =
    [ Css.displayFlex
    , Css.flexDirection Css.column
    , Css.alignItems Css.center
    , Css.justifyContent Css.center
    , Css.height Css.inherit
    ]



-- HELPERS

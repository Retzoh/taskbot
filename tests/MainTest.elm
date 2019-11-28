module MainTest exposing (suite)

import Expect
import Html.Styled exposing (toUnstyled)
import Main exposing (view)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (tag)


suite : Test
suite =
    describe "Main app"
        [ test "is not empty" <|
            \() ->
                view {}
                    |> toUnstyled
                    |> Query.fromHtml
                    |> Query.findAll [ tag "h1" ]
                    |> Query.count (Expect.greaterThan 0)
        ]

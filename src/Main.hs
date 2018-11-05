module Main (main) where

import           Graphics.UI.Gtk
                    ( AttrOp(..)
                    , initGUI
                    , mainGUI
                    , mainQuit
                    , objectDestroy
                    , on
                    , set
                    , widgetShowAll
                    , windowNew
                    , windowSetDefaultSize
                    , windowTitle
                    )

main :: IO ()
main = do
    initGUI

    window <- windowNew

    set window
        [ windowTitle := "Minimal GTK3 app in Haskell"
        ]

    on window objectDestroy $ do
        mainQuit
        return ()

    windowSetDefaultSize window 512 512

    widgetShowAll window

    mainGUI

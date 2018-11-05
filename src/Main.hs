module Main (main) where

import           Graphics.UI.Gtk
                    ( initGUI
                    , mainGUI
                    , mainQuit
                    , objectDestroy
                    , on
                    , widgetShowAll
                    , windowNew
                    , windowSetDefaultSize
                    )

main :: IO ()
main = do
    initGUI

    window <- windowNew

    on window objectDestroy $ do
        mainQuit
        return ()

    windowSetDefaultSize window 512 512

    widgetShowAll window

    mainGUI

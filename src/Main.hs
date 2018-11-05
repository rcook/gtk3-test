module Main (main) where

import           Graphics.UI.Gtk
                    ( initGUI
                    , mainGUI
                    , widgetShowAll
                    , windowNew
                    , windowSetDefaultSize
                    )

main :: IO ()
main = do
    initGUI
    window <- windowNew
    windowSetDefaultSize window 512 512
    widgetShowAll window
    mainGUI

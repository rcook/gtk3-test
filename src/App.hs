{-# LANGUAGE CPP #-}
{-# LANGUAGE TemplateHaskell #-}

module App (initApp) where

-- macOS-specific imports
#if defined(darwin_HOST_OS)
import           Files (loadLogo)
import qualified Graphics.UI.Gtk as Gtk
import qualified Graphics.UI.Gtk.OSX as OSX
#endif

-------------------------------------------------------------------------------

#if defined(darwin_HOST_OS)

initApp :: IO ()
initApp = do
  app <- OSX.applicationNew
  menuBar <- Gtk.menuBarNew
  logo <- $loadLogo
  OSX.applicationSetMenuBar app menuBar
  OSX.applicationSetDockIconPixbuf app (Just logo)
  OSX.applicationReady app

#else

initApp :: IO ()
initApp = return ()

#endif

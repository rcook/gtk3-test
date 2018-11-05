{-# LANGUAGE CPP #-}
{-# LANGUAGE TemplateHaskell #-}

module App (initApp) where

-- macOS-specific GTK imports
#if defined(darwin_HOST_OS)
import qualified Graphics.UI.Gtk as Gtk
import qualified Graphics.UI.Gtk.OSX as OSX
#endif

-------------------------------------------------------------------------------

#if defined(darwin_HOST_OS)

initApp :: IO ()
initApp = do
  app <- OSX.applicationNew
  menuBar <- Gtk.menuBarNew
  OSX.applicationSetMenuBar app menuBar
  OSX.applicationReady app

#else

initApp :: IO ()
initApp = return ()

#endif

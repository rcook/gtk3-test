{-# LANGUAGE TemplateHaskell #-}

module Files (loadLogo) where

import           Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString (hPut)
import           Data.FileEmbed (embedFile, makeRelativeToProject)
import           Graphics.UI.Gtk (Pixbuf, pixbufNewFromFile)
import           Language.Haskell.TH (Exp, Q)
import           System.IO (hClose)
import           System.IO.Temp (withSystemTempFile)

logoPath :: FilePath
logoPath = "logo.png"

loadLogo :: Q Exp
loadLogo = [| renderLogo $(makeRelativeToProject logoPath >>= embedFile) |]

renderLogo :: ByteString -> IO Pixbuf
renderLogo bytes =
    withSystemTempFile logoPath $ \path h -> do
        ByteString.hPut h bytes
        hClose h
        pixbufNewFromFile path

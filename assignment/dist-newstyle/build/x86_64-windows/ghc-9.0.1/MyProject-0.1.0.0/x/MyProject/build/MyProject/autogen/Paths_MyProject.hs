{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_MyProject (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\tespelien\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\tespelien\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\MyProject-0.1.0.0-inplace-MyProject"
dynlibdir  = "C:\\Users\\tespelien\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1"
datadir    = "C:\\Users\\tespelien\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-9.0.1\\MyProject-0.1.0.0"
libexecdir = "C:\\Users\\tespelien\\AppData\\Roaming\\cabal\\MyProject-0.1.0.0-inplace-MyProject\\x86_64-windows-ghc-9.0.1\\MyProject-0.1.0.0"
sysconfdir = "C:\\Users\\tespelien\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "MyProject_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "MyProject_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "MyProject_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "MyProject_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "MyProject_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "MyProject_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)

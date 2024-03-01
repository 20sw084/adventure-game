{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_haskell_angel (
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

bindir     = "/home/codespace/.cabal/bin"
libdir     = "/home/codespace/.cabal/lib/x86_64-linux-ghc-8.6.5/haskell-angel-0.1.0.0-G0WL4isJusNGpGVQkW5hk1-haskell-angel"
dynlibdir  = "/home/codespace/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/codespace/.cabal/share/x86_64-linux-ghc-8.6.5/haskell-angel-0.1.0.0"
libexecdir = "/home/codespace/.cabal/libexec/x86_64-linux-ghc-8.6.5/haskell-angel-0.1.0.0"
sysconfdir = "/home/codespace/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskell_angel_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskell_angel_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "haskell_angel_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "haskell_angel_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskell_angel_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskell_angel_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)

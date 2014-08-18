--
-- Sample Haskell template for pipe-filter like command
--

import Control.Monad
import Data.Int
import Data.Maybe
import Options.Applicative
import System.Console.ANSI
import System.Directory
import System.Exit
import System.IO
import Text.Regex.PCRE
import Text.Regex.PCRE.ByteString.Lazy
import qualified Data.ByteString.Lazy.Char8 as BS
import qualified Data.List as DL
type Str = BS.ByteString

----------------------------------------------------------------------------
helpdoc = concat $ DL.intersperse " "
    [
      "Haskell template for pipe fileter like command",
      "Help text here."
    ]

data CmdOpts = CmdOpts {
                 opt_switch   :: Bool
               , opt_optional :: Maybe String
               , opt_args :: [String]
               }


----------------------------------------------------------------------------

myCommand :: CmdOpts -> Str -> (Str, Bool)
myCommand opts input = (BS.unlines $ reverse $ BS.lines input, True)


----------------------------------------------------------------------------
--
-- Run as a Unix command-line filter (pipe)
--

-- All file arguments concatenated
runPipe' :: (Str -> (Str, Bool)) -> Handle -> [Handle] -> IO Bool
runPipe' cmd outHandle inHandles = do
    streams <- forM inHandles BS.hGetContents
    case (cmd $ BS.concat streams) of
        (result, ret) -> do
            BS.hPutStr outHandle result
            return ret

-- One file at a time
runPipe :: (Str -> (Str, Bool)) -> Handle -> Handle -> IO Bool
runPipe cmd outHandle inHandle = do
    stream <- BS.hGetContents inHandle
    case cmd stream of
        (result, ret) -> do
            BS.hPutStr outHandle result
            return ret

runWithOptions :: CmdOpts -> IO ()
runWithOptions opts = do
    let args = opt_args opts
    let runPipeCmd = runPipe (myCommand opts) stdout
    -- ret <- mOR (return fs >>= mapM runPipeCmdPrint)
    ret <- mOR (forM args openRO >>= mapM runPipeCmd)
    if ret
    then exitSuccess
    else exitFailure
    where
        mOR = liftM (foldl (||) False)
        openRO fname
            | fname == "-"  = return stdin
            | otherwise     = openFile fname ReadMode

----------------------------------------------------------------------------
main :: IO ()
main = execParser opts >>= runWithOptions
  where
    opts = info (helper <*> parser) ( fullDesc
             <> progDesc helpdoc
            )
    parser = CmdOpts
      <$> switch (short 's'  <> long "--switch" <>
                  help "Some switch")
      <*> (optional $ strOption (
             short 'o' <> long "optional" <> metavar "OPTS" <>
             help ("Optional param") ) )
      <*> some (argument str (metavar "[FILES...]"))


-- vim: set makeprg=ghc\ %

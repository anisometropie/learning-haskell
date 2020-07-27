-- Pure code can throw exceptions, but it can only be caught in the I/O part of our code
-- but it’s recommended not to use them in pure code

-- doesFileExist :: FilePath -> IO Bool
import           System.Directory
import           System.Environment
import           System.IO

main = do (fileName:_) <- getArgs
          fileExists <- doesFileExist fileName
          if fileExists
            then do contents <- readFile fileName
                    putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"
            else do putStrLn "The file doesn't exist!"

-- with exception
import System.Environment
import System.IO
import System.IO.Error

main = toTry `catch` handler

toTry :: IO ()
toTry = do (fileName:_) <- getArgs
           contents <- readFile fileName
           putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"

handler :: IOError -> IO ()
handler e = putStrLn "Whoops, had some trouble!"

-- better handler, with type checking
handler :: IOError -> IO ()
handler e
    | isDoesNotExistError e = putStrLn "The file doesn't exist!"
    | otherwise = ioError e

-- list of predicates
-- isAlreadyExistsError
-- isDoesNotExistError
-- isAlreadyInUseError
-- isFullError
-- isEOFError
-- isIllegalOperation
-- isPermissionError
-- isUserError

handler :: IOError -> IO ()
handler e
    | isDoesNotExistError e =
      case ioeGetFileName e of Just path -> putStrLn $ "Whoops! File does not exist at: " ++ path
                               Nothing -> putStrLn "Whoops! File does not exist at unknown location!"
    | otherwise = ioError e

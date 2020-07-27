import           Data.List
import           System.Environment

main = do
  args <- getArgs
  progName <- getProgName
  putStrLn "arguments:"
  mapM putStrLn args
  putStrLn "program name:"
  putStrLn progName

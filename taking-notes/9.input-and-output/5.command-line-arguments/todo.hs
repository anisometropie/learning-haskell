import           Data.List
import           System.Directory
import           System.Environment
import           System.IO

type Action = [String] -> IO ()

dispatch :: [(String, Action)]
dispatch = [
  ("add", add),
  ("view", view),
  ("remove", remove)
  ]

-- todo add todo.txt "Spank the monkey"

main = do
  (command:args) <- getArgs
  let (Just action) = lookup command dispatch
  action args

add :: Action
add [fileName,todo] = appendFile fileName (todo ++ "\n")

view :: Action
view [fileName] = do
  contents <- readFile fileName
  let todoTasks = lines contents
      numberedTasks = zipWith (\n task -> show n ++ " — " ++ task) [0..] todoTasks
  putStrLn $ unlines numberedTasks

remove :: Action
remove [fileName,lineNumber] = do
  handle <- openFile fileName ReadMode
  (tempName, tempHandle) <- openTempFile "." "temp"
  contents <- hGetContents handle
  let todoTasks = lines contents
      newList   = delete (todoTasks !! read lineNumber) todoTasks
  hPutStr tempHandle $ unlines newList
  hClose handle
  hClose tempHandle
  removeFile fileName
  renameFile tempName fileName

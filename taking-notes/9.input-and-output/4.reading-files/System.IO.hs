import           Data.Char
import           System.IO

main = do
  handle <- openFile "girlfriend.txt" ReadMode
  contents <- hGetContents handle
  putStr contents
  hClose handle

-- openFile :: FilePath -> IOMode -> IO Handle
-- type FilePath = String
-- data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
-- the type Handle represents where the file is. it allows us to do something with the file

-- hGetContents :: Handle -> IO String
-- pretty much like getContents except getContent reads directly from standard input
-- getContents :: IO String

-- hClose :: Handle -> IO ()

-- NOTE:
-- handle == the handle used to identify the file
-- contents == the contents of the file

-----------------------------
-----------------------------

-- another way to do the same
main' = do
  withFile "girlfriend.txt" ReadMode (\handle -> do
    contents <- hGetContents handle
    putStr contents
    )

-- withFile :: FilePath -> IOMode -> (Handle -> IO r) -> IO r
-- its IO lazy
-- it’s like connecting a pipe from the file to the output
-- a file is like a stream
-- that’s why it is read line by line

-- just like hGetContents/getContents:
-- hGetLine :: Handle -> IO String
-- hPutStr :: Handle -> String -> IO ()
-- hPutStrLn :: Handle -> String -> IO ()
-- hGetChar :: Handle -> IO Char

-- putStr takes a string and return an IO () tha will print out the string to the terminal
-- hPutStr takes a handle and a string, and returns an IO () that will write the string to the file

-- even more simple
main'' = do
    contents <- readFile "girlfriend.txt"
    putStr contents

-- readFile :: FilePath -> IO String

main''' = do
  contents <- readFile "girlfriend.txt"
  writeFile "girlfriendcaps.txt" (map toUpper contents)

-- writeFile :: FilePath -> String -> IO ()

addTodos = do
  todo <- getLine
  appendFile "todo.txt" (todo ++ "\n")

settingBuffering = do
  withFile "something.txt" ReadMode (\handle -> do
    hSetBuffering handle $ BlockBuffering (Just 2048)
    contents <- hGetContents handle
    putStr contents
    )

-- hSetBuffering :: Handle -> BufferMode -> IO ()
-- data BufferMode = NoBuffering | LineBuffering | BlockBuffering (Maybe Int)
-- If it's Nothing, then the operating system determines the chunk size.
-- NoBuffering means that it will be read one character at a time.
-- NoBuffering usually sucks as a buffering mode because it has to access the disk so much.

-- hFlush can be used to flush the buffer of the file associated wit the handle.
-- line-buffering means buffer is flushed every line
-- hFlush forces a flush

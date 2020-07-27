main = do
  line <- getLine
  if null line
      then return ()
      else do
          putStrLn $ reverseWords line
          main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

-- in if blocks
-- then and else has to have the same type
-- here both are IO actions

-- return create an I/O action out of a pure value
-- return "haha" will have a type of IO String
-- return () has the type IO ()
-- it doesn’t do anything
-- we needed to have an I/O action in both then and else

-- return will not make the do block to end execution
-- it just encapsulate a value inside an I/O action
main2 = do
    return ()
    return "HAHAHA"
    line <- getLine
    return "BLAH BLAH BLAH"
    return 4
    putStrLn line

-- return is the invert of <-
main3 = do
    a <- return "hell"
    b <- return "yeah!"
    putStrLn $ a ++ " " ++ b

-- return is used either to create an I/O action that does nothing
-- or when we don’t want the do block action to have the result value of its last action.

-- putStr does the same as putStrLn but doesn’t make new line
-- putChar prints one char to the terminal

putStr' :: String -> IO ()
putStr' "" = return ()
putStr' (x:xs) = do
  putChar x
  putStr' xs

-- print will output instances of Show to the console
-- print = putstrLn . show
-- ghci uses print when we type 3 or 'a' in the console

-- getChar
-- due to buffering, reading of the characters won't actually happen until the user mashes the return key.
-- (different behavior if running in ghci)
main4 = do
  c <- getChar
  if c /= ' '
    then do
      putChar c
      main4
    else return ()

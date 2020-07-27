import           Control.Monad
import           Data.Char

-- piping stuff in unix
-- in bash
-- $ cat haiku.txt | ./capslocker
-- the output of cat is getting piped to the input of capslocker

main2 = forever $ do
    l <- getLine
    putStrLn (map toUpper l)


-- #####################
-- #### getContents ####
-- #####################

-- we use getContents instead of forever + getLine
-- getContents reads everything from the standard input until it encounters an end-of-file character
-- when reading a file, the whole file is read at once and turned into upper case

main = do
  contents <- getContents
  putStr (map toUpper contents)

import           Control.Monad

main :: IO ()
main = do
  n <- readLn
  replicateM_ n handleCase

handleCase :: IO ()
handleCase = do
  s <- getLine
  putStrLn (mixStrings s)

mixStrings :: String -> String
mixStrings ""        = ""
mixStrings (x:x':xs) = x' : x : mixStrings xs
mixStrings _         = error ""

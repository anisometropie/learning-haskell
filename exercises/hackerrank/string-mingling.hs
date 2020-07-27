main :: IO ()
main = do
  p <- getLine
  q <- getLine
  putStrLn (mixStrings p q)

mixStrings :: String -> String -> String
mixStrings "" ""         = ""
mixStrings (x:xs) (y:ys) = x : y : mixStrings xs ys
mixStrings _ _           = error ""

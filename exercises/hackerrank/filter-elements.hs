import           Control.Monad
import           Data.List

main :: IO ()
main = do
  line <- getLine
  let n = read line :: Int
  replicateM_ n handleCase

handleCase :: IO ()
handleCase = do
  count <- fmap (parseInt . last . words) getLine
  list <- fmap (map parseInt . words) getLine
  let result = filterRepetition count list
  putStrLn $ listToString (if null result then [-1] else result)

filterRepetition :: Int -> [Int] ->  [Int]
filterRepetition _ []     = []
filterRepetition n (x:xs) =
  if length (filter (x ==) xs) >= n - 1
  then x : filterRepetition n (filter (x /= ) xs)
  else [] ++ filterRepetition n xs

listToString :: [Int] -> String
listToString []     = ""
listToString [-1]   = "-1"
listToString xs     = join $ intersperse " " listOfStrings
  where listOfStrings = map show xs

parseInt :: String -> Int
parseInt s = read s

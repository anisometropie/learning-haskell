import           Control.Monad

-- https://www.hackerrank.com/challenges/functions-or-not/problem
-- https://stackoverflow.com/questions/57494084/why-does-the-type-match-on-the-next-line-but-not-on-the-same-line

main :: IO ()
main = do
  line <- getLine
  let n = read line :: Int
  replicateM_ n handleCase

handleCase :: IO ()
handleCase = do
  line <- getLine
  let size = read line :: Int
  pairs <- fmap (map parsePair) (replicateM size getLine)
  putStrLn (if checkValidFunction pairs then "YES" else "NO")

parsePair :: String -> (Int, Int)
parsePair string = toTuple $ map parseInt $ words string

toTuple :: [Int] -> (Int,Int)
toTuple [x,y] = (x,y)
toTuple _     = error "bad input"

parseInt :: String -> Int
parseInt s = read s :: Int

checkValidFunction :: [(Int, Int)] -> Bool
checkValidFunction []     = False
checkValidFunction [_]    = True
checkValidFunction (x:xs) = foldr (&&) True [ validPair x x' | x' <- xs] && checkValidFunction xs
  where validPair a b = not (fst a == fst b && snd a /= snd b)

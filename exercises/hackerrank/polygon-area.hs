import           Control.Monad

main :: IO ()
main = do
  line <- getLine
  let size = read line :: Int
  points <- fmap (map parsePair) (replicateM size getLine)
  print $ area points

area :: [(Float, Float)] -> Float
area [] = 0
area list = abs (foldr (+) 0 distances) / 2
  where distances = [ (fst x) * (snd y) - (fst y) * (snd x) | (x,y) <- listOfPairs list]

parsePair :: String -> (Float, Float)
parsePair string = toTuple $ map parseFloat $ words string

toTuple :: [Float] -> (Float,Float)
toTuple [x,y] = (x,y)
toTuple _     = error "bad input"

parseFloat :: String -> Float
parseFloat s = read s :: Float

listOfPairs :: [a] -> [(a,a)]
listOfPairs [x,y] = [(x,y)]
listOfPairs list  = (zip list $ tail list) ++ [(last list, head list)]

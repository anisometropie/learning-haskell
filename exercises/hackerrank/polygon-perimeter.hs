import           Control.Monad

main :: IO ()
main = do
  line <- getLine
  let size = read line :: Int
  points <- fmap (map parsePair) (replicateM size getLine)
  print $ perimeter points

perimeter :: [(Float, Float)] -> Float
perimeter [] = 0
perimeter list = foldr (+) 0 distances
  where distances = [ distance (fst x) (snd x) | x <- listOfPairs list]

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

distance :: (Float, Float) -> (Float, Float) -> Float
distance (x,y) (x',y') = sqrt ((y' - y) ** 2 + (x' - x) ** 2)

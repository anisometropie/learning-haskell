module Breaking (
  solve,
  breakMax,
  breakMin
) where

main = interact $ unwords . (map show) . solve . tail . parseInts

solve :: [Int] -> [Int]
solve as = [breakMax as, breakMin as]

breakMax :: [Int] -> Int
breakMax []    = 0
breakMax [x]   = 0
breakMax as = snd (foldl countTimes (minBound :: Int,-1) as)
  where countTimes (currentMax, timesBroken) n = if n > currentMax then (n,timesBroken+1) else (currentMax,timesBroken)

breakMin :: [Int] -> Int
breakMin []    = 0
breakMin [x]   = 0
breakMin as = snd $ foldl countTimes (maxBound :: Int,-1) as
  where countTimes (currentMin, timesBroken) n = if n < currentMin then (n,timesBroken+1) else (currentMin,timesBroken)

parseInts :: String -> [Int]
parseInts = map read . words

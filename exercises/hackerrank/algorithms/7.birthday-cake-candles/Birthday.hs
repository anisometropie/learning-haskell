module Birthday (
  parseInts,
  maxElementsCount
) where

main = interact $ show . maxElementsCount . tail . parseInts

parseInts :: String -> [Int]
parseInts = (map read) . words

maxElementsCount :: [Int] -> Int
maxElementsCount []      = 0
maxElementsCount [_]     = 1
maxElementsCount [n,m]   = if n == m then 2 else 1
maxElementsCount ns = let maxCandle = (maximum ns) in length $ filter (==maxCandle) ns

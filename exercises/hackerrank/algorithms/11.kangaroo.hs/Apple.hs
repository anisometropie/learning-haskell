module Apple (
  solve,
  isOnHouse
) where

main = interact $ unlines . (map show). solve . (map parseInts) . lines

parseInts :: String -> [Int]
parseInts = map read . words

solve :: [[Int]] -> [Int]
solve [house,[a,b],_,apples,oranges] = [length applesOnHouse, length orangesOnHouse]
  where absolutePosApples = map (a+) apples
        absolutePosOranges = map (b+) oranges
        applesOnHouse = filter (isOnHouse house) absolutePosApples
        orangesOnHouse = filter (isOnHouse house) absolutePosOranges

isOnHouse :: [Int] -> Int -> Bool
isOnHouse [s,t] n  = s <= n && n <= t

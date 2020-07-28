module Kangaroo (
  solve
) where

main = interact $  solve . parseInts

solve :: [Int] -> String
solve [x1,v1,x2,v2]
  | x1 == x2 = "YES"
  | x1 < x2 && v1 < v2 = "NO"
  | x1 > x2 && v1 > v2 = "NO"
  | x1 /= x2 && v1 == v2 = "NO"
  | otherwise = solve [x1+v1,v1,x2+v2,v2]

parseInts :: String -> [Int]
parseInts = map read . words

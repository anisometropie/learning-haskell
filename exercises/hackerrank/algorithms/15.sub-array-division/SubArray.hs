module SubArray
  ( solve
  , subListsOfLength
  ) where

main = interact $ show . solve . (map parseInts) . tail . lines

solve :: [[Int]] -> Int
solve [[], _] = 0
solve [squares, [d, m]] = length $ filter (== d) sums
  where
    subLists = subListsOfLength squares m
    sums = map sum subLists

subListsOfLength :: [Int] -> Int -> [[Int]]
subListsOfLength xs l =
  if length xs == l
    then [xs]
    else [take l xs] ++ subListsOfLength (tail xs) l

parseInts :: String -> [Int]
parseInts = map read . words

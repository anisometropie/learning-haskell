module Grades (
  roundGrade
) where

main = interact $ unlines . map (show . roundGrade . read) . tail . words

roundGrade :: Int -> Int
roundGrade n
  | n < 38 = n
  | n `mod` 5 == 4 = n + 1
  | n `mod` 5 == 3 = n + 2
  | otherwise = n

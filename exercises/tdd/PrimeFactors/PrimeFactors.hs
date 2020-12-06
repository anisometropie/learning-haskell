module PrimeFactors (
  solve
) where

solve :: Int -> [Int]
solve n
  | n `isDivisibleBy` 2 = 2 : solve (n `quot` 2)
  | n `isDivisibleBy` 3 = 3 : solve (n `quot` 3)
solve n = factors n 2 where
  factors curr f
    | curr == 1 = []
    | otherwise = if curr `isDivisibleBy` f then f : factors (curr `quot` f) f else factors curr (f + 1)

isDivisibleBy :: Int -> Int -> Bool
isDivisibleBy a b = a `rem` b == 0

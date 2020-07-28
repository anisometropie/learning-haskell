module Between (
  solve,
  divisors,
  multiples,
  intersect,
  isDivisibleBy
) where

main = interact $ show . length . solve . (map parseInts) . tail . lines

solve :: [[Int]] -> [Int]
solve [as, bs] = takeWhile (<=maxBs) (multiples (filter (<=maxBs) as)) `intersect` divisors bs
  where maxBs = maximum bs

parseInts :: String -> [Int]
parseInts = map read . words

divisors :: [Int] -> [Int]
divisors []     = []
divisors [a]    = filter (\n -> a `isDivisibleBy` [n]) [1..a]
divisors (a:as) = divisors [a] `intersect` divisors as

multiples :: [Int] -> [Int]
multiples [] = []
multiples as = filter (`isDivisibleBy` as) [1..]

intersect :: (Eq a) => [a] -> [a] -> [a]
intersect [] _  = []
intersect _ []  = []
intersect as bs = filter (`elem` as) bs

isDivisibleBy :: Int -> [Int] -> Bool
isDivisibleBy a bs  = foldl (\acc b -> acc && a `mod` b == 0) True bs

main = interact $ unwords . (map show) . solve . parseInts

solve :: [Int] -> [Int]
solve ns = [minimum sums, maximum sums]
  where sums = map (sumIndices ns . getIndices) [0,1,2,3,4]

getIndices :: Int -> [Int]
getIndices n = filter (/=n) [0,1,2,3,4]

sumIndices :: Num a => [a] -> [Int] -> a
sumIndices [] _      = 0
sumIndices _ []      = 0
sumIndices xs (n:ns) = (xs !! n) + sumIndices xs ns

parseInts :: String -> [Int]
parseInts = (map read) . words

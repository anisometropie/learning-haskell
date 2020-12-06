main = interact $ show . abs . diffDiagonals . tail . parseInts

diffDiagonals :: Num a => [a] -> a
diffDiagonals xs = (sumIndexes xs topLeftIndexes) - (sumIndexes xs topRightIndexes)
  where
    size = intSquareRoot $ fromIntegral $ length xs
    topLeftIndexes = take size [0,size+1..]
    topRightIndexes = take size $ iterate (+(size-1)) (size-1)

sumIndexes :: Num a => [a] -> [Int] -> a
sumIndexes [] _      = 0
sumIndexes _ []      = 0
sumIndexes xs (n:ns) = (xs !! n) + sumIndexes xs ns

parseInts :: String -> [Int]
parseInts = (map read) . words

intSquareRoot :: Int -> Int
intSquareRoot n = round $ sqrt $ fromIntegral n

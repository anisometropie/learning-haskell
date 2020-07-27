main = interact $ unlines . (map show) . solve . tail . parseInts

solve :: [Int] -> [Float]
solve ns = [fractionOf positives, fractionOf negatives, fractionOf zeros]
  where itemQuantity = length ns
        positives = filter (>0) ns
        negatives = filter (<0) ns
        zeros = filter (==0) ns
        fractionOf ms = fromIntegral (length ms) / fromIntegral itemQuantity

parseInts :: String -> [Int]
parseInts = (map read) . words

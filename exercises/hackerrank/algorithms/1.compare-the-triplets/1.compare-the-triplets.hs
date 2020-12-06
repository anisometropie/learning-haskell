main = interact $ parseResult . generateGrades. (splitAt 3) . parseInts

generateGrades = (foldl (zipWith (+)) [0,0]) . uncurry (zipWith givePoint)

givePoint :: Int -> Int -> [Int]
givePoint a b
  | a > b = [1,0]
  | b > a = [0,1]
  | otherwise = [0,0]

parseInts :: String -> [Int]
parseInts = (map read) . words

parseResult :: [Int] -> String
parseResult = unwords . (map show)

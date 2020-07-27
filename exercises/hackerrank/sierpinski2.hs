main = do
  n <- readLn :: IO Int
  putStrLn $ unlines $ solve n

base = [[if r + c >= 33 && c - r <= 31 then '1' else '_' | c <- [1..63]] | r <- [1..32]]
dropEven s = map fst $ filter snd $ zip s $ cycle [False, True]
iter s = top ++ bot where
  half = map dropEven $ dropEven s
  padding = replicate 16 '_'
  top = map (\x -> padding ++ x ++ padding) half
  bot = map (\x -> x ++ "_" ++ x) half

solve n = (iterate iter base) !! n

size :: Int
size = 6

main :: IO ()
main = do
  input <- getLine
  let n = read input :: Int
  mapM_ putStrLn (sierpinski n)
  main

sierpinski :: Int -> [String]
sierpinski n = iterate buildNextRankTriangle (simpleTriangle n) !! n

buildNextRankTriangle :: [String] -> [String]
buildNextRankTriangle triangle = buildTop triangle ++ buildBottom triangle

buildTop :: [String] -> [String]
buildTop triangle = [ side ++ s ++ side | s <- triangle]
  where side = replicate (length triangle) '_'

buildBottom :: [String] -> [String]
buildBottom triangle = [ s ++ "_" ++ s | s <- triangle]

simpleTriangle :: Int -> [String]
simpleTriangle n = map (generateLine n) [1..height]
  where height = 2 ^ (size - n)

generateLine :: Int -> Int -> String
generateLine rank n = replicate (width - n) '_' ++
                      replicate (2 * n - 1) '1' ++
                      replicate (width - n) '_'
  where width = 2 ^ (size - rank)

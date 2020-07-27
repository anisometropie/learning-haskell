import           Control.Monad

width :: Int
width = 100

height :: Int
height = 63

mainSeed :: [Int]
mainSeed = [50]

main :: IO ()
main = do
  input <- getLine
  let n = read input :: Int
  draw $ withTop (generateYCode n)

withTop :: [[Int]] -> [[Int]]
withTop xs = take height (xs ++ repeat [])


-- rank 1 -> seed [50]
generateYCode :: Int -> [[Int]]
generateYCode 0 = []
generateYCode n = let previous = generateYCode (n-1)
                      seed = (if n <= 1 then mainSeed else last previous)
                      buds = diverge seed
                      stem = generateStemCode n seed
                      size = 2 ^ (5 - n)
                  in previous ++ take (size * 2) (stem ++ iterate growBranches buds)

generateStemCode :: Int -> [Int] -> [[Int]]
generateStemCode n seed = replicate size seed
  where size = 2 ^ (5 - n)

-- grow branches sideways
growBranches :: [Int] -> [Int]
growBranches []        = []
growBranches [_]       = error "at least two branches"
growBranches (x:x':xs) = [x-1,x'+1] ++ growBranches xs

diverge :: [Int] -> [Int]
diverge []     = []
diverge [x]    = [x-1,x+1]
diverge (x:xs) = diverge [x] ++ diverge xs


draw :: [[Int]] -> IO()
draw lines = mapM_ (putStrLn . generateLine) (reverse lines)

generateLine :: [Int] -> String
generateLine [] = replicate width '_'
generateLine xs = [if n `elem` xs then '1' else '_' | n <- [1..width]]

main = interact $ unlines . solve . read

solve :: Int -> [String]
solve n = [ generateLine size | size <- [1..n]]
  where generateLine size = replicate (n-size) ' ' ++ replicate size '#'

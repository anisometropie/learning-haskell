import           Control.Monad
import           Data.List

main :: IO ()
main = do
  input <- getLine
  let inputNumber = read input :: Int
  mapM_ (putStrLn . unwords) (triangle $ inputNumber - 1)

triangle :: Int -> [[String]]
triangle inputNumber = [ [ show $ binomial k n | k <- [0..n] ] | n <- [0..inputNumber]]

binomial :: Int -> Int -> Int
binomial 0 _ = 1
binomial k n
  | k == n = 1
  | otherwise = binomial (k - 1) (n - 1) + binomial k (n - 1)

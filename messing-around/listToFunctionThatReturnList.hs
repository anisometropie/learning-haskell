import           Data.List
import           System.IO

multiplyBy :: [Int] -> (Int -> [Int])
multiplyBy [] x   = [x]
multiplyBy list x = map (* x) list

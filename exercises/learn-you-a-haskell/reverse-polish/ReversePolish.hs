module ReversePolish
  ( solve
  ) where

-- main = interact $ show . solve . (map parseInts) . tail . lines

solve :: String -> Int
solve = head . (foldl fn []) . words
  where 
    fn (x1:x2:xs) item
          | item == "+" = [x1 + x2] ++ xs
          | item == "*" = [x1 * x2] ++ xs
          | item == "-" = [x2 - x1] ++ xs
    fn xs item = read item:xs

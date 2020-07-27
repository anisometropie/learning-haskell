import           Data.List

myLast :: [a] -> a
myLast []     = error "Empty list"
myLast [x]    = x
myLast (_:xs) = myLast xs


myLength :: [a] -> Int
myLength xs = sum [1 | _ <- xs]

myLength' :: [a] -> Int
myLength' []     = 0
myLength' (_:xs) = 1 + myLength' xs

mySum :: Num a => [a] -> a
mySum []     = 0
mySum (x:xs) = x + mySum xs

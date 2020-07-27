-- if none of them works, x will match will anything
sayMe :: (Integral a) => a -> String
-- Pattern matching
-- a function will see if the input match patterns in order
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe _ = "Not between 1 and 5"

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial(n - 1)

factorial' :: (Integral a) => a -> Integer
factorial' n = product [1 .. toInteger n]

-- without pattern matching,
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- functions for triples :
first :: (a,b,c) -> a
first (x,_,_) = x

second :: (a,b,c) -> b
second (_,y,_) = y

third :: (a,b,c) -> c
third (_,_,z) = z

-- pattern matching in list Comprehension
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
sums =  [a + b | (a,b) <- xs]

-- patterns on lists
head' :: [a] -> a
head' []    = error "empty list"
head' (x:_) = x

init' :: [a] -> [a]
init' []     = error "empty list"
init' [x]    = []
init' (x:xs) = x : init' xs

length' :: (Num b) => [a] -> b
length' []     = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' []     = 0
sum' (x:xs) = x + sum' xs

someListFunction :: (Show a) => [a] -> String
someListFunction []      = "empty"
someListFunction [x]     = "only 1 element: " ++ show x
someListFunction [x,y]   = "2 elements: " ++ show x ++ " " ++ show y
someListFunction (x:y:_) = "more than 2: " ++ show x ++ " " ++ show y

-- as patterns
capital :: String -> String
capital ""          = "Empty string, whoops!"
capital whole@(x:_) = "The first letter of " ++ whole ++ " is " ++ [x]

main = do
  putStrLn "What’s your name?"
  name <- getLine
  putStrLn ("Hello " ++ name)

addMe :: Int -> Int -> Int
addMe x y = x + y

-- without specifying with types we use
sumMe x y = x + y

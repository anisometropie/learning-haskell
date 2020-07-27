
import           Data.List
import           System.IO

-- Curried functions
-- every function is curried

-- max :: Ord a => a -> a -> a
-- takes a and return a function that takes a and returns a
-- that means
-- max 100 200 == (max 100) 200
-- max 100 :: (Ord a, Num a) => a -> a

-- partially applying infix functions (sectioning an infix function,)
-- the paramater is applied to the side that is missing an operand
times4 :: (Num a) => a -> a
times4 = (4*)

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

divideTenBy :: (Floating a) => a -> a
divideTenBy = (10/)

-- exception:
value = (-4) -- means the number -4. we have to use
subtract4 = subtract 4 -- the function subtracts 4 to given parameter
-- subtract4 100 == 96

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])


-- *** Higher order functions ***
--  = return function or takes function a parameter

-- mandatory parentheses hehe
-- because -> is right-associative
-- a -> a -> a == a -> (a -> a)
-- a-> a -> a != (a -> a) -> a
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- "HAHA " ++ "HEY" == ("HAHA " ++) "HEY"
--
-- applyTwice (+3) 10
-- applyTwice (++ " HAHA") "HEY"
-- applyTwice ("HAHA " ++) "HEY"
-- applyTwice (3:) [1]


zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _          = []
zipWith' _ _ []          = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys


flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
  | f x       = x : filteredRest
  | otherwise = filteredRest
  where filteredRest = filter f xs

nonEmptyLists = filter (not . null) [[1,2,3],[],[3,4,5],[2,2],[],[],[]]

isDivisibleBy :: (Integral a) => a -> a -> Bool
b `isDivisibleBy` a = b `mod` a == 0

divisibles = filter (`isDivisibleBy` 11) [1..100000]

-- haskell doesn’t evaluate the entire list, it stops when it finds one because we just need the head
largestDivisible :: (Integral a) => a
largestDivisible = head (filter (`isDivisibleBy` 3829) [100000,99999..])

-- matter of taste
-- takeWhile (<10000) (filter odd (map (^2) [1..]))
-- takeWhile (<10000) [n^2 | n <- [1..], odd (n^2)]

--Collatz sequences
chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
  | even n = n : chain (n `div` 2)
  | odd n  = n : chain (n * 3 + 1)

numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15


-- ***** Lambads *****

-- no need for λ here !!
l' = map (\x -> 3 - x) [1,6,3,2] -- NO
l = map (3-) [1,6,3,2]

-- pattern matching in λs
-- you can only match one pattern though
ll = map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]

flip'' :: (a -> b -> c) -> b -> a -> c
flip'' f = \x y -> f y x


-- ***** Only folds and horses *****

-- sum with foldl
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs
--which can be simplified
sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> acc || y == x) False ys

--  -- map --
map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs
-- we could have used foldl, but ++ is more expensive than :
-- we generally use foldr when building new list from a list
map''' :: (a -> b) -> [a] -> [b]
map''' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- -- reverse --
-- to reverse a list, foldl is better
reverse' :: [a] -> [a]
reverse' xs = foldl (\acc x -> x : acc) [] xs
-- could have written
-- reverse' xs = foldl (flip (:)) [] xs

reverse'' :: [a] -> [a]
reverse'' xs = foldr (\x acc -> acc ++ [x]) [] xs

--foldl1 foldr1 do the same thing, but you don’t have to give a starting value.
-- they use the leftmost or rightmost value from the last as starting value.
-- can,t be called with empty lists

maximum' :: (Ord a) => [a] -> a
maximum' xs = foldl1 max xs

-- folding is just applying the same function again and again to new accumulator + new element
-- folding right [4,5,6] means doing f4 (f 5 (f 6 acc))

-- scanl scanr do the same as foldl foldr
-- but it returns a list of all accumulators

-- scanl (+) 0 [1,2,3,4] == [0,1,3,6,10]
-- scanr (+) 0 [1,2,3,4] == [10,9,7,4,0]

-- scanl1 scanr1 same as foldl1 foldr1


-- How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1
-- We use takeWhile here instead of filter because filter doesn't work on infinite lists.



-- *****   ($) function   *****
-- ($) :: (a -> b) -> a -> b
-- f $ x = f x

-- it takes a function and an element and apply the function to the element
-- succ $ 1 == 2

-- function application has really high precedence
-- $ has the lowest precedence

-- function application with space is left-associative
-- f a b c == (((f a) b) c)

-- ($) is right-associative
-- f (g x) == f $ g x
-- f (g (h x)) == f $ g $ h x

-- succ $ succ $ succ 1 == 4
-- sum (map sqrt [1..130])
-- sum $ map sqrt [1..130]
-- sqrt $ 3 + 4 + 9

-- ($) can allow function application to be used as a function
results = map ($ 3) [(4+), (10*), (^2), sqrt]



-- ***** function composition *****

allNegative = map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
allNegative' = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]

-- Function composition is right-associative
-- f . g . h == f . (g . h)


-- composition is used to write in point free style
fn x = ceiling (negate (tan (cos (max 50 x))))
fn' = ceiling . negate . tan . cos . max 50

-- to compose function that take several parameters, the only way is partially apply them to only leave on paramater missing
succMax = succ (max 3 1)
succMax' = (succ . max 3) 1

-- to simplify something with a lot of parentheses, put $ before the last parameter
-- it makes one function applied to that parameter
a = replicate 100 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
a' = replicate 100 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]

-- long chains of function composition is discouraged.
-- prefer to use let bindings to store intermediate results

oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]



-- from that video
listTimes4 = map times4 [1,2,3,4,5]

areStringEq :: [Char] -> [Char] -> Bool
areStringEq [] []         = True
areStringEq (x:xs) (y:ys) = x == y && areStringEq xs ys
areStringEq _ _           = False

mapArray :: (Int -> Int) -> [Int] -> [Int]
mapArray func []     = []
mapArray func (x:xs) = func x : mapArray func xs

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y

add3 = getAddFunc 3

numbers = map (\x -> x * 2) [1..10]

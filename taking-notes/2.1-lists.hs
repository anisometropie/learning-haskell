{-# LANGUAGE TemplateHaskell #-}

import           Data.List
import           System.IO

primes = [3,5,7,11]
-- cons operator : takes number + a list
completePrimes = 2 : primes
letters = 'a' : "bcde"
-- ++ operator takes two lists
morePrimes = primes ++ [13, 17, 19, 23, 29]
moreLetters = letters ++ ['f', 'g', 'h']

someNumbers = [1,2,3] ++ [4,5,6]

-- combine numbers into a list
a = 2 : 7 : 88 : 45 : []
b = [2,7,88,45] -- is only syntactic sugar of a

multList = [[1,2,6],[4,4,7]]

--you can compare lists
isSuperior = [3,2,1] > [0,0,0]

list = [1,2,3,4,5,6]

head list -- 1
tail list -- [2,3,4,5,6]
init list -- [1,2,3,4,5]
last list -- 6

length list -- 6
null list -- False
reverse list -- [6,5,4,3,2,1]

list !! 2
take 3 list -- [1,2,3]
drop 3 list -- [4,5,6]

minimum list -- 1
maximum list -- 6
sum list
product list

4 `elem` list -- True
2 `elem` [1..] -- True
[20,19..1]

-- Generate specific number of elements
take 10 [12,24..] -- [12,24,36,48,60,72,84,86,108,120]
take 10 $ cycle [1,2,3] -- [1,2,3,1,2,3,1,2,3,1]
take 10 $ repeat 5 -- [5,5,5,5,5,5,5,5,5,5]
replicate 10 5
take 10 $ repeat "K. Maro"

-- List Comprehension
[x * 2 | x <- [1..10]]

-- weeding out lists by predicates is also called filtering
[ x | x <- [50..100], x `mod` 7 == 3]
filter (\x -> x `mod` 7 == 3) [50..100]

[ x * 3 | x <- [1..10], x * 3 <= 10]

divisibleBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
[ [ x | x <- xs, even x ] | xs <- xxs]

sums = zipWith (+) [1,2,3,4,5] [10,20,30,40,50]

multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

fib = 1 : 1 : [a + b | (a, b) <- zip fib $ tail fib]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

-- list = [1,2,3,4,5,6]
oddNumbers = filter odd list -- [1,3,5]
successors = map succ list


-- lists of tuples. tuples have to have the same size and types
ok = [(1,2), (2,3)] -- OK
notOK = [(1,2), (1,2,3)]
notOk = [(1,2),("One",2)]

-- fst and snd will work only on pairs
fst (8,11) -- 8
snd (8,11) -- 11

-- make list of pairs
zip [1,2,3,4,5] [5,5,5,5,5]
zip [1..] ["apple", "orange", "cherry", "mango"]

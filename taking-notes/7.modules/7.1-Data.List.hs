import           Data.Function (on)
import           Data.List

a = intersperse 0 [1,2,3,4] -- [1,0,2,0,3,0,4]
b = intercalate [0,0,0] [[1,2,3], [4,5,6], [7], [8,9,10]] -- [1,2,3,0,0,0,4,5,6,0,0,0,7,0,0,0,8,9,10]
c = transpose [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[5,9,8]] -- [[1,4,7,1,5],[2,5,8,5,9],[3,6,9,9,8]]

-- foldl' and foldl1' are stricter versions of their respective lazy incarnations. When using lazy folds on really big lists, you might often get a stack overflow error. The culprit for that is that due to the lazy nature of the folds, the accumulator value isn't actually updated as the folding happens. What actually happens is that the accumulator kind of makes a promise that it will compute its value when asked to actually produce the result (also called a thunk). That happens for every intermediate accumulator and all those thunks overflow your stack. The strict folds aren't lazy buggers and actually compute the intermediate values as they go along instead of filling up your stack with thunks. So if you ever get stack overflow errors when doing lazy folds, try switching to their strict versions.

d = concat ["abc", "def", "ghi"]
-- map then concat
e = concatMap (replicate 4) [1..3] -- [1,1,1,1,2,2,2,2,3,3,3,3]

f = and [True, True, True, True] -- True
g = or [False, True, False] -- True

h = any (>=4)  [1,2,3,4] -- True
i = all (==3) [3,3,3,2] -- False

k = iterate (+1) 0 -- [0,1,2,3..]

l = splitAt 3 "heyman" -- ("hey", "man")

m = takeWhile (<10) [1..20] -- [1,2,3,4,5,6,7,8,9]
m' = takeWhile (<10000) $ map (^3) [1..]

n = dropWhile (<10) [1..20] -- [10,11,12,13,14,15,16,17,18,19,20]

-- takeWhile + dropWhile
o = span (<10) [1..20] -- ([1,2,3,4,5,6,7,8,9],[10,11,12,13,14,15,16,17,18,19,20])

p = group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7] -- [[1,1,1,1],[2,2,2,2],[3,3],[2,2,2],[5],[6],[7]]

q = inits [1,2,3,4] -- [[],[1],[1,2],[1,2,3],[1,2,3,4]]
r = tails [1,2,3,4] -- [[1,2,3,4],[2,3,4],[3,4],[4],[]]

-- search sublist in list to do as exercise
search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack =
  let nlen = length needle
  in  foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

s = "bro" `isInfixOf` "zo bro cobra" -- True
t = "zo" `isPrefixOf` "zozo" -- True
u = "pe" `isSuffixOf` "snape" -- True

v = 3 `elem` [1,2,3] -- True
w = 6 `notElem` [1,2,3] -- True

x = partition (`elem` ['A'..'Z']) "ABcdEFghiJKLmno" -- ("ABEFJKL","cdghimno")
-- not the same as span or break. see o
y = span (`elem` ['A'..'Z']) "ABcdEFghiJKLmno" -- ("AB","cdEFghiJKLmno")
z = break (`elem` ['A'..'Z']) "abcdEFghiJKLmno" -- ("abcd","EFghiJKLmno")

-- return the first element that satisfies the predicate
α = find (>=3) [1,2,3,4] -- Just 3
β = find (==0) [1,2,3,5] -- Nothing

-- find returns a Maybe a. similar to a list that can contain 0 or 1 element. no more.
γ = head (dropWhile (<1000) [1..])
-- is not safe.
-- head returns an error with an empty list.
δ = find (>=1000) [1..]
-- is safe

ε = 4 `elemIndex` [1,2,3,4,5,6] -- Just 3
ζ = 10 `elemIndex` [1,2,3,4,5,6] -- Nothing
η = ' ' `elemIndices` "Je suis le bras de la justice" -- [2,7,10,15,18,21]

θ = findIndex (\n -> n `mod` 4 == 1) [10..20] -- Just 3
ι = findIndices (\n -> n `mod` 4 == 1) [10..20] -- [3,7]

κ = zipWith3 (\x y z -> x + y + z) [1,2,3] [4,5,2,2] [2,2,3] -- [7,9,8]
λ = zip4 [2,3,3] [2,2,2] [5,5,3] [2,2,2] -- [(2,2,5,2),(3,2,5,2),(3,2,3,2)]

μ = lines "first line\nsecond line\nthird line" -- ["first line","second line","third line"]
ν = unlines ["first line","second line","third line"] -- "first line\nsecond line\nthird line\n"
ξ = words "Je suis Zasz" -- ["Je","suis","Zasz"]
ο = unwords ["Je","suis","Zasz"] -- "Je suis Zasz"

π = nub [1,2,3,4,3,2,1,2,3,4,3,2,1] -- [1,2,3,4]
ρ = delete 3 [1,2,3,4,5] -- [1,2,4,5]
σ = [1..10] \\ [2,5,9] -- [1,3,4,6,7,8,10]

τ = [1..7] `union` [5..10] -- [1,2,3,4,5,6,7,8,9,10]
υ = [1..7] `intersect` [5..10] -- [5,6,7]

-- insert an Ord in the last position <= to the next element
-- keep sorted lists sorted
φ = insert 4 [1,2,3,2,3,0,4,5,6] -- [1,2,3,2,3,0,4,4,5,6]
χ = insert 4 [1,2,3,5,6,7] -- [1,2,3,4,5,6,7]

-- length, take, drop, splitAt, !!, replicate
-- all take or return Int (retrocompatibility reasons)
-- length :: Foldable t => t a -> Int
-- take :: Int -> [a] -> [a]
-- — more generic versions exist
-- genericLength, genericTake, genericDrop, genericSplitAt, genericIndex, genericReplicate
-- genericLength :: Num i => [a] -> i
-- genericReplicate :: Integral i => i -> a -> [a]

-- nub, delete, union, intersect, group
-- have more general versions
-- nubBy, deleteBy, unionBy, intersectBy, groupBy
ψ = nubBy (\a b -> (a - b) `mod` 4 == 0) [0..100] -- [0,1,2,3]
ψ' = nubBy ((==) `on` (`mod`4)) [0..100]

values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3]
ω = groupBy (\x y -> (x > 0) == (y > 0)) values
-- [[-4.3,-2.4,-1.2],[0.4,2.3,5.9,10.5,29.1,5.3],[-2.4,-14.5],[2.9,2.3]]
-- the same thing with on
ω' = groupBy ((==) `on` (> 0)) values


-- sort, insert, maximum, minimum
-- sortBy, insertBy, maximumBy, minimumBy
-- need a function that return an ordering like
-- compare :: Ord a => a -> a -> Ordering
-- sort == sortBy compare


lists = [[1,4,5,4,4],[1,2,3],[3,5,4,3],[],[2],[2,2]]
-- will sort by lexicographic order
aa = sort lists -- [[],[1,2,3],[1,4,5,4,4],[2],[2,2],[3,5,4,3]]
ab = sortBy (compare `on` length) lists -- [[],[2],[2,2],[1,2,3],[3,5,4,3],[1,4,5,4,4]]

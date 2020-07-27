hofstadter :: (Integral a) => a -> a
hofstadter 1 = 1
hofstadter 2 = 1
hofstadter n = hofstadter (n - hofstadter (n-1)) + hofstadter (n - hofstadter (n-2))

-- 1 1 2 3 3 4 5 5 6 6

maximum' :: (Ord a) => [a] -> a
maximum' []     = error "empty list"
maximum' [x]    = x
maximum' (x:xs) = max x (maximum' xs)

replicate' :: (Num i, Eq i) => i -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n-1) x

take' :: (Num i, Eq i) => i -> [a] -> [a]
take' 0 _      = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs

reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]

repeat' :: a -> [a]
repeat' x = x : repeat' x

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _          = []
zip' _ []          = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ []     = False
elem' a (x:xs) = a == x || elem' a xs

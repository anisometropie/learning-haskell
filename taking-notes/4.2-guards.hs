-- **************
-- *** guards ***
-- **************

isOdd n
  | n `mod` 2 == 0 = False
  | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age
  | (age >= 5) && (age <=6) = "Kindergarten"
  | (age > 6) && (age <= 10) = "Elementary school"
  | otherwise = "Go to college"

rating :: Double -> Double -> String
rating hits atBats
  | avg <= 0.200 = "Terrible Batting Average"
  | avg <= 0.250 = "Average Player"
  | avg <= 0.280 = "pretty good"
  | otherwise = "You’re a Superstar"
  where avg = hits / atBats

max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b

compare' :: Ord a => a -> a -> Ordering
compare' a b
  | a > b = GT
  | a == b = EQ
  | otherwise = LT

bmiTell :: RealFloat a => a -> a -> String
bmiTell weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat    = "You're fat! Lose some weight, fatty!"
  | otherwise     = "You're a whale, congratulations!"
  where bmi = weight / height ^ 2
  -- using pattern match here too
        (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- you can define functions as well in where bindings
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstname
        (l:_) = lastname

-- where bindings are not shared between different pattern matchings
myFunction :: (Num a) => a -> a -> a -> a
myFunction a b c = s
  where s = a + b + c
myFunction a b _ = s
  where s = 1

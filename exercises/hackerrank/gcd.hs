gcd' :: Integral a => a -> a -> a
gcd' n m
  | remainder == 0 = small
  | otherwise = gcd' small remainder
  where small = min n m
        big = max n m
        remainder = big `mod` small

-- Pattern matching is just syntactic sugar for case expressions.

head' :: [a] -> a
head' []    = error "No head for empty lists!"
head' (x:_) = x

-- the above is syntactic sugar of this:
head'' :: [a] -> a
head'' xs = case xs of []    -> error "No head for empty lists!"
                       (x:_) -> x

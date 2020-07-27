head' :: [a] -> a
head' []    = error "empty list"
head' (x:_) = x

head'' :: [a] -> a
head'' xs = case xs of []    -> error "empty list"
                       (x:_) -> x

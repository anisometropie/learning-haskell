fib :: Int -> Int
fib 1 = 0
fib 2 = 1
fib n = fib (n-2) + fib (n-1)

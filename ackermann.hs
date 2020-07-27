ackermann :: (Integral a) => a -> a -> a
ackermann m n
  | m == 0 = n + 1
  | m > 0 && n == 0 = ackermann (m-1) 1
  | m > 0 && n > 0 = ackermann (m-1) (ackermann m (n-1))

width = 0.001 :: Float

-- partition :: Float -> Float -> [Float]
partition a b = [a + step * width | step <- [0..steps-1]]
  where steps = (b - a) / width

-- polynomial :: [Float] -> [Float] -> Float -> Float
polynomial as bs x = sum [a * x ** b | (a,b) <- zip as bs]

-- area :: Int -> Int -> [Int] -> [Int] -> Float
area l r a b = sum [ width * polynomial a b x | x <- partition l r ]

volume l r a b = sum [ pi * width * polynomial a b x ** 2 | x <- partition l r ]

solve l r a b = [area l r a b, volume l r a b]

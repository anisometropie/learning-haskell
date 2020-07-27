
nums = makeCouples 5 3

makeCouples a b = [(a,b), (a,-b), (-a,b), (-a,-b)]

makeDivisionString :: (Show a, Integral a) => (a -> a -> (a, a)) -> (a,a) -> String
makeDivisionString f (a,b) = show a ++ " = " ++ show b ++ "×" ++ show q ++ " + " ++ show r
  where (q,r) = f a b


main = do
  mapM_ (putStrLn . makeDivisionString quotRem)  nums
  mapM_ (putStrLn . makeDivisionString divMod)  nums

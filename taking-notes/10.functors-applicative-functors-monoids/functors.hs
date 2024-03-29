instance Functor IO where  
    fmap f action = do  
        result <- action  
        return (f result) 

-- return :: Monad m => a -> m a
-- it, odesn’t do anything but wraps a value inside a IO

main = do 
  line <- getLine   
  let line' = reverse line  
  putStrLn $ "You said " ++ line' ++ " backwards!"  

main = do 
  line <- fmap reverse getLine  
  putStrLn $ "You said " ++ line ++ " backwards!"  

main =
  do line <- fmap (intersperse '-' . reverse . map toUpper) getLine  
  putStrLn line  



-- function type (->) r a
-- aka r -> a
-- that constructor takes 2 parameters and return a function of type r -> a

instance Functor ((->) r) where  
  fmap f g = (\x -> f (g x))

-- we make « functions that take a type r as input » an instance of functon.
-- instead of mapping a list of a into a list of b
-- we’re mapping the output domain
-- we map a function (r -> a) into a function (r -> b)
-- functions are made into boxes

-- in the end it’s nothing but function composition, but in the light of functors

ghci> :t fmap (*3) (+100)  
fmap (*3) (+100) :: (Num a) => a -> a  
ghci> fmap (*3) (+100) 1  
303  
ghci> (*3) `fmap` (+100) $ 1  
303  
ghci> (*3) . (+100) $ 1  
303  
ghci> fmap (show . (*3)) (*100) 1  
"300" 

-- lifting functions
ghci> :t (*2)  
(*2) :: Num a => a -> a
ghci> :t fmap (*2)  
fmap (*2) :: (Functor f, Num a) => f a -> f a

ghci> :t replicate 3
replicate 3 :: a -> [a]
ghci> :t fmap (replicate 3)  
fmap (replicate 3) :: Functor f => f a -> f [a]

-- NEXT The second law says that composing two functions and then
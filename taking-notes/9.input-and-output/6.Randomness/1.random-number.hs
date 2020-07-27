import           System.Random

-- this function takes a random generator and returns a random value and a new random generator
-- random :: (Random a, RandomGen g) => g -> (a, g)

-- making a random generator:
-- mkStdGen :: Int -> StdGen

-- #######
-- random
-- #######
a = random (mkStdGen 200) :: (Float, StdGen)
b = random (mkStdGen 200) :: (Bool, StdGen)
c = random (mkStdGen 200) :: (Integer, StdGen)

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins g =
  let (firstCoin, g') = random g
      (secondCoin, g'') = random g'
      (thirdCoin, _) = random g''
  in (firstCoin, secondCoin, thirdCoin)

-- #######
-- randoms
-- #######
randoms' :: (Random a, RandomGen g) => g -> [a]
randoms' gen = let (value, gen') = random gen in value:randoms' gen
-- making 5 random ints
d = take 5 $ randoms (mkStdGen 11) :: [Int]

-- checking how many True and False we got in 10000 tosses
list = take 10000 $ randoms (mkStdGen 12) :: [Bool]
result = foldl add (0,0) list
  where add (t,f) b = if b then (t+1,f) else (t,f+1)

-- finiteRandoms :: (RandomGen g, Random a, Num n) => n -> g -> ([a], g)
-- finiteRandoms 0 gen = ([], gen)
-- finiteRandoms n gen =
--     let (value, newGen) = random gen
--         (restOfList, finalGen) = finiteRandoms (n-1) newGen
--     in  (value:restOfList, finalGen)


-- #######
-- randomR :: (RandomGen g, Random a) :: (a, a) -> g -> (a, g)
-- randomRs :: (Random a, RandomGen g) => (a, a) -> g -> [a]

-- e = randomR (1,6) (mkStdGen 12345)
-- f = take 1000 $ randomRs (1,6) (mkStdGen 1002)
-- g = take 10 $ randomRs ('a', 'z') (mkStdGen 91)

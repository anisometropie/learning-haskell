import           Data.List
import           System.IO

-- statically typed
-- type inference: we don’t have to tell Haskell what type is something, it can infer that on its own


-- *******************************
--  to know the type and signature
-- :t expression
-- :: means “has type of”

-- head :: [a] -> a
-- fst :: (a, b) -> a
-- map :: (a -> b) -> [a] -> [b]
-- a is a type variable
-- a can be any type
-- *******************************


-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int
-- Integer
--   unbounded whole numbers
factorial :: Integer -> Integer
factorial n = product [1..n]
-- Float
--   single precision floating point numbers
-- Double
--   the one to use
--   precision up to 11 points
bigFloat = 3.99999999999 + 0.000000000005
-- Bool
-- Char ''
--   single unicode character
-- Tuple

-- functions without parameters = definition or name.
-- declare a permanent value of a variable
always5 :: Int
always5 = 5

-- looking at the type of a function
-- a is type variable
-- (types are written in capital case)
-- Functions that have type variables are called polymorphic functions
-- :t head
head :: [a] -> a

import           Data.List
import           System.IO

-- ---------- TYPE CLASSES ----------
-- Num, Eq, Ord and Show are type classes
-- similar to java interfaces.
-- A type class is set of types which have certain operations defined for them.
-- Polymorphic functions, which work with multiple parameter types,
-- can specify the types it works with a type class

-- For example (+) works with parameters of the type Num
-- everything before => is called a class constraint
-- This says it requires a to be an instance of Num
(+) :: Num a => a -> a -> a

-- members of Eq can be tested for equality
-- pretty much all standard types belong there
-- The functions its members implement are == and /=
(==) :: (Eq a) => a -> a -> Bool

-- Ord are types that can be ordered
-- >, <, >=, <=
-- a variable of type Ordering can be GT, LT or EQ
(>) :: (Ord a) => a -> a -> Bool
compare :: Ord a => a -> a -> Ordering

-- members of Show can be represented as strings
show :: Show a => a -> String

-- members of Read can be parsed from a string
-- The read function takes a string and returns a type which is a member of Read.
read :: Read a => String -> a

read "4" -- won’t work.
-- you have to use explicit type annotations.
read "True" :: Bool
read "5" :: Float
read "5" :: Int
read "[1,2,3,4]" :: [Int]
-- or do something with the output to let it know what type it is:
read "4" + 4

-- Enum members are sequentially ordered types
-- can be used in ranges, and have successor and predecesor
-- Char, Ordering, Int, Integer, Float and Double
['a'..'e']
[LT .. GT]
[3 .. 5] -- [3,4,5]
succ 'B' -- 'C'
succ LT -- EQ
succ EQ -- GT
succ GT -- error bad argument
succ maxBound :: Int -- gives an error as well. maxBound has no successor
succ 9223372036854775807 -- will work, infered as Integer
[9223372036854775800, 9223372036854775801..] :: [Int] -- will stop at ...807

-- Bounded members have an upper and a lower bound.
minBound :: Bounded a => a
maxBound :: Bounded a => a
maxBound :: Char
maxBound :: Bool -- True
maxBound :: (Bool, Int) -- (True,2147483647)

-- Num is a numeric typeclass
-- + - / * accepts all members of Num
(+) :: Num a => a -> a -> a

-- whole number literals are polymorphic constants
-- they can be any member of Num
20 :: Num p => p
20 :: Int
20 :: Integer
20 :: Float
20 :: Double

20.1 :: Fractional p => p

-- Integral == Int & Integer
-- Floating == Float & Double

-- very useful function to turn a number back in its general type
fromIntegral :: (Integral a, Num b) => a -> b

-- ****************************************************************************
-- END OF 3. TYPES and TYPECLASSES
-- ****************************************************************************
-- ****************************************************************************
-- ****************************************************************************
-- ****************************************************************************





-- Create an Employee and add the ability to check if they are equal
data Employee = Employee { name :: String,
												   position :: String,
												   idNum :: Int
												   } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 1000}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 1001}

isSamPam = samSmith == pamMarx

-- We can print out data because of show
samSmithData = show samSmith

-- Make a type instance of the typeclass Eq and Show
data ShirtSize = S | M | L

instance Eq ShirtSize where
	S == S = True
	M == M = True
	L == L = True
	_ == _ = False

instance Show ShirtSize where
	show S = "Small"
	show M = "Medium"
	show L = "Large"

-- Check if S is in the list
smallAvail = S `elem` [S, M, L]

-- Get string value for ShirtSize
theSize = show S

-- Define a custom typeclass that checks for equality
-- a represents any type that implements the function areEqual
class MyEq a where
	areEqual :: a -> a -> Bool

-- Allow Bools to check for equality using areEqual
instance MyEq ShirtSize        where
	areEqual S S = True
	areEqual M M = True
	areEqual L L = True
	areEqual _ _ = False

newSize = areEqual M M

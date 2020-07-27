-- Type constructors take types as parameters to produce new types.

-- Maybe is a type constructor
-- Maybe String
-- Maybe Int

-- type constructor — value constructors
data Maybe a = Nothing | Just a

-- The type of Nothing is Maybe a.
-- it can act as Maybe Int, Maybe Char
-- lists are a type constructor as well
-- the empty list can act as any type of list
-- we can do [1,2,3] ++ []
-- or "abc" ++ []

-- Data.Map
-- Map k v is also a type constructor
-- k has to be part of Ord
-- however it is a convention not to add typeclass constraints in data declarations.
-- because it forces to add the same constrainst to all functions using the type
-- while adding no real benefit

-- type constructor — value constructor
data Vector a = Vector a a a deriving (Show)
data Vecint = Vecint Int Int Int deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector a b c) `vplus` (Vector α β γ) = Vector (a+α) (b+β) (c+γ)

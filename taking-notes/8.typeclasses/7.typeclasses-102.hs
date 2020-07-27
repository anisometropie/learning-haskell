-- Typeclass are Eq, Ord, Num
-- they are like interfaces
-- the define a behavior
-- comparing for equality, comparing for ordering, enumeration
-- the behavior is defined in functions and type declarations.

-- Eq is defined like this
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)


-- making our own type instances
data TrafficLight = Red | Yellow | Green
-- we didn’t derive any class instances
-- we’re going to make it an instance of Eq by hand

instance Eq TrafficLight where
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False

-- /= was defined in terms of ==, so it comes automatically
-- if Eq didn’t come with implementations of == and /= referencing each other
-- we would have to implement by hand both of them every time
-- the minimal complete definition for Eq is to implement either of those

instance Show TrafficLight where
  show Red    = "Red light"
  show Yellow = "Yellow light"
  show Green  = "Green light"

-- to make a subclass:
class (Eq a) => Num a where
-- adding a class constraint to state that a must be an instance of Eq to be part of Num

-- when dealing with type constructor (and not concrete types)
-- Maybe m is made an instance of Eq
-- m can be any type, to make Maybe m a concrete type
-- m only has to be an instance of Eq as well
instance (Eq m) => Eq (Maybe m) where
    Just x == Just y = x == y
    Nothing == Nothing = True
    _ == _ = False

-- class constraints in class declarations are used for
-- making a typeclass a subclass of another typeclass.
-- class constraints in instance declarations are used to
-- express requirements about the contents of some type.

-- javascript if Example
class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

-- a is necessary to make [a] concrete
instance YesNo [a] where
    yesno [] = False
    yesno _  = True

-- id is the identity function
instance YesNo Bool where
yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing  = False

a = yesno 3
b = yesno "haha"
c = yesno ""
d = yesno $ Just 0

-- this works now like javascript ()
yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

yesnoIf [] "YEAH!" "NO!"
yesnoIf [2,3,4] "YEAH!" "NO!"

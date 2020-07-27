data Person = Person {
  firstName :: String,
  lastName  :: String,
  age       :: Int
} deriving (Eq, Show, Read)

-- typeclasses are like interfaces. they define a behavior.
-- Person is a type instance of Eq.
-- values can be compared, it receives that behavior

snape = Person { firstName = "Severus", lastName = "Snape", age = 45 }
dumbledore = Person { firstName = "albus", lastName = "Dumbledore", age = 77 }
potter = Person { firstName = "Harry", lastName = "Potter", age = 33 }
-- we have to specify the type at the end
granger = read "Person { firstName = \"Hermione\", lastName = \"Granger\", age = 22 }" :: Person

-- deriving Eq allows one to do:
a = snape == dumbledore -- False
b = snape /= snape -- False

c = potter `elem` [snape, dumbledore, potter, granger]

d = read "Just 't'" :: Maybe Char

data War3 = Arthas | MalGanis | Antonidas deriving (Eq, Ord)

e = Arthas `compare` MalGanis -- LT
f = Antonidas > MalGanis -- True

g = Nothing < Just 100 -- True
h = Just 10 < Just 100 -- True
i = Nothing > Just (-49999) -- False


data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
  deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- Eq, Ord
j = Saturday == Sunday -- False
k = Monday `compare` Wednesday -- LT

-- Show, Read
l = show Wednesday -- "Wednesday"
m = read "Saturday" :: Day -- Saturday

-- Bounded
n = minBound :: Day -- Monday

-- Enum
o = succ Monday -- Tuesday
p = pred Thursday -- Wednesday
q = [Thursday .. Sunday]
r = [minBound .. maxBound] :: [Day]

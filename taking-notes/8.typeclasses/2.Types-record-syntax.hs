-- this syntax will create accesor functions to access each property
-- type name – value constructors
data Person = Person {
  firstName   :: String,
  lastName    :: String,
  age         :: Int,
  height      :: Float,
  phoneNumber :: String,
  flavor      :: String
} deriving (Show)

snape = Person "Severus" "Snape" 32 1.84 "0153" "Strawberry"

-- will be display as
-- Person {firstName = "Severus", lastName = "Snape", age = 32, height = 1.84, phoneNumber = "0153", flavor = "Strawberry"}

-- with this syntax, fields don’t have to be in order. But all of them must be there
dumbledore = Person {firstName = "Albus", lastName = "Dumbledore", age = 65, height = 1.90, phoneNumber = "999", flavor = "b"}

data Point = Point Float Float deriving (Show)
data Circle = Circle {
  center :: Point,
  radius :: Float
} deriving (Show)

-- all fields must be there
rond = Circle { center = Point 1 1, radius = 5}

-- but not in pattern matching
surface :: Circle -> Float
surface Circle { radius = r } = pi * r ^ 2

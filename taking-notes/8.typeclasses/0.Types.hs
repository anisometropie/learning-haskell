-- type name – value constructors
data Bool = False | True


data Shape = Circle Float Float Float | Rectangle Float Float Float Float
  deriving (Show)

-- Value constructors are functions !
-- Circle :: Float -> Float -> Float -> Shape
-- Rectangle :: Float -> Float -> Float -> Float -> Shape

surface :: Shape -> Float
surface (Circle _ _ r)          = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

a = surface $ Circle 10 20 10
b = surface $ Rectangle 0 0 100 100

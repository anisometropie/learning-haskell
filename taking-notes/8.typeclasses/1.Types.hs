-- will export all the value contsructors
-- module Shapes(
--   Type(..)
-- )
-- Will export only the two value contsructors
-- module Shapes(
--   Type(Circle, Rectangle)
-- ) where
--
-- we also can export the type only without any value constructors
-- one can use this type by using an auxiliary function
-- one can’t pattern match against the value constructors using this module
-- module Shapes(
--   Type
-- ) where

module Shapes (
  Point(..),
  Shape(..),
  surface,
  nudge
) where

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point
  deriving (Show)

-- Value constructors are functions !
-- Circle :: Float -> Float -> Float -> Shape
-- Rectangle :: Float -> Float -> Float -> Float -> Shape

surface :: Shape -> Float
surface (Circle _ r)            = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

a = surface $ Circle (Point 10 20) 10
b = surface $ Rectangle (Point 0 0) (Point 100 100)


nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))

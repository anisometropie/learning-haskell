import           Data.List
import           System.IO

data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock     = "Paper Beats Rock"
shoot Rock Scissors  = "Rock Beats Scissors"
shoot Scissors Paper = "Scissors Beat Paper"
shoot Scissors Rock  = "Scissors Loses to Rock"
shoot Paper Scissors = "Paper Loses to Scissors"
shoot Rock Paper     = "Rock Loses to Paper"

data Shape = Circle Double Double Double | Rectangle Double Double Double Double
  deriving Show

area :: Shape -> Double
area (Circle _ _ r)               = pi * r ^ 2
area (Rectangle _ _ width height) = width * height

rectangle :: Shape
rectangle = Rectangle 0 0 10 10

circleArea = area (Circle 50 50 20)
rectArea = area rectangle
rect2Area = area $ Rectangle 10 10 20 20

import Data.List
import System.IO

sumOfNums = sum [1..1000]

addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4

-- / does Fractional division
-- div does Integral division

-- prefix operator
modEx = mod 5 4
-- infix operator
modEx2 = 5 `mod` 4

negNumEx = 5 + (-4)


num9 = 9 :: Int
sqrtOf9 = sqrt(fromIntegral num9)

a = pi
b = exp 9
c = log 9
d = 9 ** 2
e = truncate 9.999
f = round 9.999
g = ceiling 9.999
h = floor 9.999

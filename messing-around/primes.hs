import           Data.List
import           Data.List.Ordered (minus, union, unionAll)

primes = 2 : 3 : minus [5,7..] (unionAll [[p*p, p*p+2*p..] | p <- tail primes])
primes2Digits = minus primes [2,3,5,7]

takeLastDigits = map (`mod` 10)

takeSuccessiveLastDigits xs = zip lastDigits (tail lastDigits)
  where lastDigits = takeLastDigits xs

unique n = nub . takeSuccessiveLastDigits . takeWhile (< n) $ primes2Digits

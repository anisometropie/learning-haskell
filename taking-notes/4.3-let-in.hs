cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea

a = let square x = x * x in (square 5, square 3, square 2)
b = let a = 100; b = 200; c = 300 in a*b*c
c = let foo="Hey "; bar = "there!" in foo ++ bar
d = (let (a,b,c) = (1,2,3) in a+b+c) * 100

-- similar to destructuring
(let (a,b,c) = (1,2,3) in a+b+c) * 100

-- We include a let inside a list comprehension much like we would a predicate,
-- only it doesn't filter the list, it only binds to names.
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]
-- bmi is visible before | and after the let bmi, to predicates as well
-- not to the (w,h) <- xs

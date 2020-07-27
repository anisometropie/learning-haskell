-- -- 3, "YEAH", (+) have types
-- -- Num p => p, String, Num a => a -> a -> a
--
-- -- types have kinds
--
-- -- :k Int
-- Int :: *
-- -- * means it is is a concrete type
-- -- values can only have types that are concrete types
-- Maybe :: * -> *
-- -- takes one concrete type and return a concrete type
-- Maybe Int :: *
--
-- Either :: * -> * -> *
--
--
--
-- Num :: * -> Constraint
-- Eq :: * -> Constraint

class Tofu t where
    tofu :: j a -> t a j

-- let’s make a type that derives this class
data Frank a b = Frank {frankField :: b a } deriving (Show)
instance Tofu Frank where
  tofu x = Frank x


  -- making this an instance of Functor:
data Barry t k p = Barry { yabba :: p, dabba :: t k }
instance Functor (Barry a b) where
    fmap f (Barry {yabba = x, dabba = y}) = Barry {yabba = f x, dabba = y}

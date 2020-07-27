class Functor f where
  fmap :: (a -> b) -> f a -> f b

-- f isn’t a concrete type here,
-- it’s a type constructor
-- f a can be [a] or Maybe a or (a,a)

instance Functor [] where
  fmap = map

instance Functor Maybe where
  fmap f (Just x) = Just (f x)
  fmap f Nothing  = Nothing

-- fmap acts like a
-- (a -> b) -> Maybe a -> Maybe b


data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

instance Functor Tree where
  fmap f EmptyTree            = EmptyTree
  fmap f (Node x tree1 tree2) = Node (f x) (fmap f tree1) (fmap f tree2)


data Either a b = Left a | Right b

instance Functor (Either a) where
  fmap f (Right x) = Right (f x)
  fmap f (Left x)  = Left x

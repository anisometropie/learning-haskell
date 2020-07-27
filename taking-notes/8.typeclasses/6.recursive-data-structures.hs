-- lists are defined recursively
-- [1,2,3] == 1:2:3:[]

-- we can define our own recursive data structures:

-- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
--
-- a = 1 `Cons` Empty
-- b = 1 `Cons` (2 `Cons` Empty)


-- defining our own infix constructor like :
infixr 5 :-:
-- fixity declaration: states how tightly the operator binds and if it’s right/left associative

data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

a = 1 :-: Empty
b = 2 :-: (3 :-: Empty)

infixr 5 .+.
(.+.) :: List a -> List a -> List a
Empty .+. ys = ys
(x :-: xs) .+. ys = x :-: (xs .+. ys)

c = a .+. b

-- implementing binary trees
-- a tree is either an empty tree or it's an element that contains some value and two trees

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node x left right
  | x < a  = Node a (treeInsert x left) right
  | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree = False
treeElem x (Node a left right)
  | x == a = True
  | x < a  = treeElem x left
  | x > a  = treeElem x right


nums = [6,2,4]
tree = foldr treeInsert EmptyTree nums

import           Data.Char
import           Data.List
import qualified Data.Map  as Map

-- Association lists, or dictionaries store key-value pairs

phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

mapGet :: (Eq k) => k -> [(k,v)] -> Maybe v
mapGet key []         = Nothing
mapGet key ((k,v):xs) = if k == key then Just v else mapGet key xs

mapGet' :: (Eq k) => k -> [(k,v)] -> Maybe v
mapGet' key = foldr (\(k,v) acc -> if k == key then Just v else acc) Nothing

-- always use Data.Map for key-value association
-- Data.Map Association lists are much faster, implemented with trees.
-- keys has to be Ord to work as a tree:
-- Map.fromList :: Ord k => [(k, a)] -> Map.Map k a

girls = Map.fromList phoneBook
b = Map.fromList [(1,'a'),(3,'b'),(3,'c'),(5,'d')] -- fromList [(1,'a'),(3,'c'),(5,'d')]

c = Map.insert 4 'z' Map.empty -- fromList [(4,'z')]
d = Map.insert 5 'y' c -- fromList [(4,'z'),(5,'y')]

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldl (\acc (k,v) -> Map.insert k v acc) Map.empty

e = Map.null Map.empty -- True
f = Map.null $ Map.fromList [(1,2), (2,7)] -- False

g = Map.size Map.empty -- 0
h = Map.size $ Map.fromList [(1,2), (2,7)] -- 2

i = Map.singleton 3 9 -- fromList [(3,9)]

j = Map.lookup "penny" girls -- Just "853-2492"

k = Map.member "penny" girls -- True
k' = Map.member 3 i -- True
k'' = Map.member 9 i -- False

l = Map.map (+1000) $ Map.fromList [(1,2),(2,7)] -- fromList [(1,1002),(2,1007)]
l' = Map.filter isUpper $ Map.fromList [(1,'a'),(2,'A'),(3,'b'),(4,'B')] -- fromList [(2,'A'),(4,'B')]

m = Map.toList $ Map.singleton 3 'Z' -- [(3,'Z')]

n = Map.keys girls -- ["betty","bonnie","lucille","patsy","penny","wendy"]
o = Map.elems girls -- ["555-2938","452-2928","205-2928","493-2928","853-2492","939-8282"]

phoneBook2 =
    [("betty","555-2938")
    ,("betty","342-2492")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("patsy","943-2929")
    ,("patsy","827-9162")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ,("penny","555-2111")
    ]

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap = Map.fromListWith (\number1 number2 -> number1 ++ ", " ++ number2)

p = Map.fromListWith max [(1,'a'), (1,'b')] -- fromList [(1,'b')]
q = Map.insertWith (+) 3 100 $ Map.fromList [(3,4),(5,103),(6,339)] -- fromList [(3,104),(5,103),(6,339)]

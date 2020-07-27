import qualified Data.Set as Set

a = Set.fromList "My life for aiur" -- fromList " Maefiloruy"
b = Set.fromList "Snape kills Dumbledore" -- fromList " DSabdeiklmnoprsu"

c = Set.intersection a b -- fromList " aeiloru"
d = Set.difference a b -- fromList "Mfy"
e = Set.union a b -- fromList " DMSabdefiklmnoprsuy"

f = Set.null a -- False
g = Set.null Set.empty -- True
h = Set.size $ Set.fromList [3,4,5,3,4,5] -- 3

i = Set.singleton 9 -- fromList [9]
j = Set.insert 4 i -- fromList [4,9]
k = Set.delete 4 $ Set.fromList [1,2,1,2,3,4,5,4] -- fromList [1,2,3,5]

set = Set.fromList [1,2,3,4,5]
l = Set.fromList [2,3,4] `Set.isSubsetOf` set -- True
m = Set.empty `Set.isSubsetOf` set -- true
m' = set `Set.isSubsetOf` set -- True
n = set `Set.isProperSubsetOf` set -- False

o = Set.filter odd $ Set.fromList [3,4,5,6,7,2,3,4] -- fromList [3,5,7]
p = Set.map (*4) $ Set.fromList [3,4,5,6,7,2,3,4] -- fromList [8,12,16,20,24,28]

-- Data.List.nub already removes duplicates
-- back using sets is going to be much faster
-- Data.List.nub will preserves order

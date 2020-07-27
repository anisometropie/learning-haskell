-- Haskell

let list = [1,2,3,4,188,10,55,27,33,20]

map succ list -- [2,3,4,5,189,11,56,28,34,21]
foldr (+) 0 list -- 343
mapM_ print list

maximum list -- 188
minimum list -- 1

filter even list -- [2,4,188,10,20]
filter odd list -- [1,3,55,27,33]
sort list -- [1,2,3,4,10,20,27,33,55,188]

sort ["z", "w", "a", "b", "x"]
-- ["a","b","w","x","z"]
reverse ["a", "b", "c", "d", "e"]
-- ["e","d","c","b","a"]

replicate 10 "A"
-- ["A","A","A","A","A","A","A","A","A","A"]
[0..9] -- [0,1,2,3,4,5,6,7,8,9,10]
['A'..'Z'] -- "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

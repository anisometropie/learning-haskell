main' = do
  contents <- getContents
  putStr (shortLinesOnly contents)

-- ##################
-- #### interact ####
-- ##################
-- this common pattern
-- (getting some string from input, transforming, and outputing the result)
-- is made easier with interact
main = interact respondPalindromes

-- example functions to use with interact
shortLinesOnly = unlines . filter (\line -> length line < 10) . lines
shortLinesOnly' = unlines . filter ((<10) . length) . lines

respondPalindromes = unlines . map giveAnswer . lines
  where giveAnswer xs = if isPalindrome xs then "palindrome" else "not a palindrome"
        isPalindrome xs = xs == reverse xs

appendHuhu s = s ++ " huhu"

-- just like getContents, will take the entire string from beginning to end-of-file
-- to give something back for each line we’re using lines / unlines
-- even though the functions transform one big string into another,
-- the program acts like it is done line by line
-- that’s because haskell is lazy

import           Control.Monad


-- ################ --
-- ####  when  ####
-- ################ --
-- when takes a Bool and an I/O action.
-- it returns this action if True
-- otherwise, returns return ()
-- equivalent to if expression then (I/O action) else return ()

main = do
  c <- getChar
  when (c /= ' ') $ do
    putChar c
    main


-- #################### --
-- ####  sequence  ####
-- #################### --
-- takes a list of I/O actions and make one I/O action that do each action in order
-- returns the results in a list
-- [IO a] -> IO [a]

main2 = do
  results <- sequence [getLine, return "3", getLine]
  print results

-- which is equivalent to

main2' = do
  a <- getLine
  b <- return "3"
  c <- getLine
  print [a,b,c]


-- ###################### --
-- #### mapM & mapM_ ####
-- ###################### --
-- a common pattern with sequence is
main3 = do
  sequence (map print [1,2,3,4])

-- mapping then sequencing is very common,
-- we have mapM and mapM_ to do the same thing
main4 = do
  mapM print [1,2,3,4]

-- mapM_ will do exactly the same thing, but will throw away the result, not displaying it in a list
main5 = do
  mapM_ print [1,2,3,4]


-- ################# --
-- #### forever ####
-- ################# --
main6 = forever $ do
  putStr "Give me some input: "
  l <- getLine
  putStrLn l

-- ###################### --
-- #### forM & forM_ ####
-- ###################### --
-- forM is literally
-- forM = flip mapM

main7 = do
  forM [1,2,3,4] print

-- it is useful to write long λ functions in a better way

main8 = do
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
        color <- getLine
        return color)
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM_ print colors

-- return color in the inside do
-- makes sure that that the action’s result is the color
-- but getLine already has it
-- we’re unpacking with the <-
-- and repacking with return
-- we could have just used getLine

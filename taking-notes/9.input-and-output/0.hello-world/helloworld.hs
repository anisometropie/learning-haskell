main :: IO (Maybe Int)
main = do
  putStrLn "Hello, what’s your name?"
  name <- getLine
  putStrLn (name ++ " you cunt!")
  return Nothing

-- each step is an I/O action.
-- do syntax combine them into one I/O action

-- the type of getLine is IO String
-- think of it like a box that contains a String
-- <- will open the box
-- <- will take the result of getLine and bind it to name
-- type fo name will be String
-- the last action cannot be bound to a name


-- if we're taking data out of an I/O action, we can only take it out when we're inside another I/O action.

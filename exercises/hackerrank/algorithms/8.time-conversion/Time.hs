module Time (
convertTime
) where

import           Data.List

main = interact $ convertTime

convertTime :: String -> String
convertTime input
  | suffix == "AM" = if "12" `isPrefixOf` time then "00" ++ drop 2 time else time
  | suffix == "PM" = if "12" `isPrefixOf` time then time else add12Hours time
  where time = take 8 input
        suffix = drop 8 input

add12Hours :: String -> String
add12Hours time = show (read hours + 12) ++ rest
  where hours = take 2 time
        rest = drop 2 time

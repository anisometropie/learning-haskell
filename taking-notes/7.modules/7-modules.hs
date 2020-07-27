-- modules in standard library
-- https://downloads.haskell.org/~ghc/latest/docs/html/libraries/

-- in ghci
-- :m + Data.List
-- :m + Data.List Data.Map

-- to import only the functions we need
import           Data.List (nub, sort)

-- import everything except nub
import           Data.List hiding (nub)


-- to deal with name clashes
-- Qualified imports
import qualified Data.Map
-- so we can use Data.Map.filter function

import qualified Data.Map  as M
-- to simply do M.filter

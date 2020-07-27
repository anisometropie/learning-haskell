import qualified Data.Map as Map

-- type keyword doesn’t create something new. (unlike the data keyword)
-- it creates a synonym of an existing type
-- type String = [Char]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name,PhoneNumber)]

phoneBook :: PhoneBook
phoneBook =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

-- type synonyms can be parameterized:
type AssocList k v = [(k,v)]

getValue :: (Eq k) => k -> AssocList k v -> Maybe v
getValue _ []             = Nothing
getValue key ((k,v):rest) = if key == k then Just v else getValue key rest

type PhoneBook' = AssocList Name PhoneNumber

phoneBook2 :: PhoneBook'
phoneBook2 =
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

-- type contsructors can be partially applied too
-- type IntMap v = Map Int v

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerMap :: LockerMap
lockerMap = Map.fromList [
  (1,(Taken, "382910")),
  (2,(Taken, "382910")),
  (3,(Free, "983010")),
  (4,(Free, "139040")),
  (5,(Taken, "000000")),
  (6,(Taken, "382910"))
  ]

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber lm =
  case Map.lookup lockerNumber lm of
    Nothing -> Left ("Locker number " ++ show lockerNumber ++ "doesn’t exist!")
    Just (state, code) -> if state == Taken
      then Left ("Locker " ++ show lockerNumber ++ " is already taken!")
      else Right code

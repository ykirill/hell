{-# LANGUAGE ViewPatterns, NamedFieldPuns, RecordWildCards #-}

module Chapter2.DataTypes where
import Data.Char

{- Clients -}
data Client = GovOrg     String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving (Show)

data Person = Person String String Gender
            deriving (Show)

data Gender = Male | Female | Unknown deriving (Show)

-- TOTAL FUNCTIONS
-- Long version
clientName :: Client -> String
clientName client = case client of
           GovOrg name                                -> name
           Company name _ _ _                         -> name
           Individual (Person firstName lastName _) _ -> firstName ++ " " ++ lastName

-- Short version
clientName' :: Client -> String
clientName' (GovOrg name) = name
clientName' (Company name _ _ _) = name
clientName' (Individual (Person firstName lastName _) _) = firstName ++ " " ++ lastName

-- PARTIAL FUNCTION
companyName :: Client -> Maybe String
companyName (Company name _ _ _) = Just name
companyName _ = Nothing

responsibility :: Client -> String
responsibility (Company _ _ _ r) = r
responsibility _ = "Unknown"

specialClient :: Client -> Bool
specialClient (clientName -> "John Doe") = True
specialClient (responsibility -> "CEO") = True
specialClient _ = False

{- TimeMachines -}
data TimeMachine = TimeMachine String Integer String Type Double
                 deriving (Show)

data Type = Future | Past | Both deriving (Show)

{- Using "Records" as data structure -}
data ClientR = GovOrgR   { clientRName :: String }
             | CompanyR { clientRName :: String
                        , companyId :: Integer
                        , person :: PersonR
                        , duty :: String }
             | IndividualR { person :: PersonR, agree :: Bool }
             deriving (Show)

data PersonR = PersonR { firstName :: String
                       , lastName :: String
                       } deriving (Show)

{- Work if "NamedFieldPuns"-}
greet :: ClientR -> String
-- greet IndividualR { person = PersonR { firstName } } = "Hi, " ++ firstName
-- greet CompanyR { clientRName } = "Hello, " ++ clientRName
-- greet GovOrgR { } = "Welcome"
{- Work if "RecordWildCards"-}
greet IndividualR { person = PersonR { .. } } = "Hi, " ++ firstName
greet CompanyR { .. } = "Hello, " ++ clientRName
greet GovOrgR { } = "Welcome"

nameInCapitals :: PersonR -> PersonR
nameInCapitals p@(PersonR { firstName = initial:rest }) =
        let newName = (toUpper initial):rest
        in p { firstName = newName }
nameInCapitals p@(PersonR { firstName = "" }) = p

data TimeMachineR = TimeMachineR { manufacture :: String
                                 , model :: Integer
                                 , title :: String
                                 , machineType :: Type
                                 , price :: Double
                                 } deriving (Show)

func :: [TimeMachineR] -> Integer -> [TimeMachineR]
func [] _ = []
func (machine:machines) discount =
    let mf = manufacture machine
        m = model machine
        t = title machine
        mt = machineType machine
        p = price machine
        newPrice = p - (p * ((fromInteger discount) * 0.01))
    in (TimeMachineR mf m t mt newPrice):(func machines discount)

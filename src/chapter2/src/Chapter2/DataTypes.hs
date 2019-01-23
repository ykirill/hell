{-# LANGUAGE ViewPatterns, NamedFieldPuns, RecordWildCards #-}

module Chapter2.DataTypes where

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


{- TimeMachines -}
data TimeMachine = TimeMachine String Integer String Type Double
                 deriving (Show)

data Type = Future | Past | Both deriving (Show)

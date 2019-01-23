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

-- Long version
clientName :: Client -> Maybe String
clientName client = case client of
           GovOrg name                                -> Just name
           Company name _ _ _                         -> Just name
           Individual (Person firstName lastName _) _ -> Just (firstName ++ " " ++ lastName)

-- Short version
clientName' :: Client -> Maybe String
clientName' (GovOrg name)                                = Just name
clientName' (Company name _ _ _)                         = Just name
clientName' (Individual (Person firstName lastName _) _) = Just (firstName ++ " " ++ lastName)

{- TimeMachines -}
data TimeMachine = TimeMachine String Integer String Type Double
                 deriving (Show)

data Type = Future | Past | Both deriving (Show)

module Chapter2.DataTypes where

data Client = GovOrg     String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving (Show)

data Person = Person String String
            deriving (Show)

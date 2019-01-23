module Chapter2.DataTypes where

data Client = GovOrg     String
            | Company    String Integer String String
            | Individual String String Bool
            deriving (Show)
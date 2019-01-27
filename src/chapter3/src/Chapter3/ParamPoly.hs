module Chapter3.ParamPoly where

maybeString :: Maybe t -> String
maybeString (Just _)  = "Just"
maybeString (Nothing) = "Nothing"

data Client i = GovOrg  { clientId :: i, clientName :: String }
              | Company { clientId :: i, clientName :: String
                         , person :: Person, duty :: String }
              | Individual { clientId :: i, person :: Person
                            , agree :: Bool }
              deriving Show

data Person = Person { firstName:: String
                      , lastName :: String
                      , gender :: Gender }
                      deriving Show

data Gender = Male | Female | Unknown deriving Show

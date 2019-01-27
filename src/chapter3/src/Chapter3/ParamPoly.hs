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

-- Exercise 3.1
-- Begin
swarpTriple :: (c,a,b) -> (a,b,c)
swarpTriple (x,y,z) = (y,z,x)

-- duplicate :: a -> (a,a)
-- duplicate x = (x,x)

nothing :: p -> Maybe a
nothing _ = Nothing

index :: [a] -> [(Integer, a)]
index []     = []
index [x]    = [(0,x)]
index (x:xs) = let indexed@((n,_):_) = index xs
               in (n+1,x):indexed

maybeA :: [a] -> Char
maybeA [] = 'a'
-- End

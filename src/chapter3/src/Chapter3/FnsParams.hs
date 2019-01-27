{-# LANGUAGE LambdaCase #-}

module Chapter3.FnsParams where

import Chapter3.ParamPoly

map' :: (a -> b) -> [a] -> [b]
map' _ []     = []
map' f (x:xs) = (f x):(map' f xs)

apply3f2 :: (Integer -> Integer) -> Integer -> Integer
apply3f2 f x = 3 * f (x + 2)

equalTupples :: [(Integer, Integer)] -> [Bool]
equalTupples t = map (\(x,y) -> (x == y)) t

sayHello :: [String] -> [String]
-- sayHello names = map' (\name -> case name of
--                                     "Kirill" -> "Hello, " ++ name
--                                     _        -> "Welcome, " ++ name
--                       ) names
-- With LambdaCase pragma:
sayHello names = map' (\case "Kirill" -> "Hi!"
                             name     -> "Welcome, " ++ name
                      ) names

-- clojure
multiplyByN :: Integer -> (Integer -> Integer)
multiplyByN n = \x -> x*n

-- Exercise 3.2
-- Begin
filterOnes :: [Integer] -> [Integer]
filterOnes []   = []
filterOnes list = filter (\x -> x == 1) list

filterANumber :: [Integer] -> Integer -> [Integer]
filterANumber [] _   = []
filterANumber list n = filter (\x -> x == n) list

filterNot :: (a -> Bool) -> [a] -> [a]
filterNot _ []           = []
filterNot predicate list = filter (\x -> not (predicate x)) list

isGovOrg :: (Client n) -> Bool
isGovOrg GovOrg { } = True
isGovOrg _          = False

filterGovOrgs :: [(Client n)] -> [(Client n)]
filterGovOrgs []      = []
filterGovOrgs clients = filter isGovOrg clients

filterGovOrgs' :: [(Client n)] -> [(Client n)]
filterGovOrgs' []      = []
filterGovOrgs' clients = filter (\case GovOrg {} -> True
                                       _         -> False
                                ) clients
-- End

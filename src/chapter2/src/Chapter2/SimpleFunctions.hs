module Chapter2.SimpleFunctions where

firstOrEmpty :: [ String ] -> String
firstOrEmpty list = if not (null list) then head list else "empty"

(+++) :: [a] -> [a] -> [a]
-- First version.
-- list1 +++ list2 = if null list1
--                   then list2
--                   else (head list1) : (tail list1 +++ list2)
-- Second version.
-- list1 +++ list2 = case list1 of
--                   []   -> list2
--                   x:xs -> x:(xs +++ list2)
-- Third version.
[]     +++ list2 = list2
(x:xs) +++ list2 = x:(xs +++ list2)

reverse' :: [a] -> [a]
-- reverse' list = if null list
--                 then []
--                 else reverse' (tail list) +++ [head list]
reverse' [] = []
reverse' (x:xs) = reverse' xs +++ [x]

maxmin :: [Integer] -> (Integer, Integer)
-- maxmin list = if null (tail list)
--               then (head list, head list)
--               else ( if (head list) > fst (maxmin (tail list))
--                      then head list
--                      else fst (maxmin (tail list))
--                    , if (head list) < fst (maxmin (tail list))
--                      then head list
--                      else fst (maxmin (tail list))
--                    )
--
-- maxmin' :: [Integer] -> (Integer, Integer)
-- maxmin' list = let h = head list
--                in if null (tail list)
--                   then (h, h)
--                   else ( if h > t_max then h else t_max
--                        , if h < t_min then h else t_min )
--                        where t = maxmin' (tail list)
--                              t_max = fst t
--                              t_min = snd t
maxmin [x]    = (x,x)
maxmin (x:xs) = ( if x > max then x else max
                , if x < min then x else min
                ) where (max, min) = maxmin xs

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibonacci' :: Integer -> Maybe Integer
-- fibonacci' n = if n < 0
--                then Nothing
--                else case n of
--                        0 -> Just 0
--                        1 -> Just 1
--                        n -> let Just f1 = fibonacci' (n-1)
--                                 Just f2 = fibonacci' (n-2)
--                             in Just (f1 + f2)
fibonacci' n | n < 0     = Nothing
fibonacci' 0             = Just 0
fibonacci' 1             = Just 1
fibonacci' n | otherwise = let (Just f1, Just f2) = (fibonacci' (n-1), fibonacci' (n-2))
                           in Just (f1 + f2)

sorted :: [Integer] -> Bool
sorted []           = True
sorted [_]          = True
-- sorted (x:y:zs) = x < y && sorted (y:zs)
sorted (x: r@(y:_)) = x < y && sorted r

binom :: Integer -> Integer -> Integer
binom _ 0 = 1
binom x y | x == y = 1
binom n k = (binom (n-1) (k-1)) + (binom (n-1) k)

multipleOf :: Integer -> Integer -> Bool
multipleOf x y = (mod x y) == 0

specialMultiples :: Integer -> String
-- specialMultiples n | multipleOf n 2 = show n ++ " is multiple of 2"
-- specialMultiples n | multipleOf n 3 = show n ++ " is multiple of 3"
-- specialMultiples n | multipleOf n 5 = show n ++ " is multiple of 5"
-- specialMultiples n | otherwise      = show n ++ " is a beautiful number"
specialMultiples n
    | multipleOf n 2 = show n ++ " is multiple of 2"
    | multipleOf n 3 = show n ++ " is multiple of 3"
    | multipleOf n 5 = show n ++ " is multiple of 5"
    | otherwise      = show n ++ " is a beautiful number"

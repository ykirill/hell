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
reverse' list = if null list
                then []
                else reverse' (tail list) +++ [head list]

maxmin :: [Integer] -> (Integer, Integer)
maxmin list = if null (tail list)
              then (head list, head list)
              else ( if (head list) > fst (maxmin (tail list))
                     then head list
                     else fst (maxmin (tail list))
                   , if (head list) < fst (maxmin (tail list))
                     then head list
                     else fst (maxmin (tail list))
                   )

maxmin' :: [Integer] -> (Integer, Integer)
maxmin' list = let h = head list
               in if null (tail list)
                  then (h, h)
                  else ( if h > t_max then h else t_max
                       , if h < t_min then h else t_min )
                       where t = maxmin' (tail list)
                             t_max = fst t
                             t_min = snd t

fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

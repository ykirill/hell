module Chapter2.Section2.Example where

firstOrEmpty :: [String] -> String
firstOrEmpty list = if not (null list)
                    then head list
                    else "empty"

(+++) ::  [a] -> [a] -> [a]
lst1 +++ lst2 = if null lst1
                then lst2
                else head lst1 : (tail lst1 +++ lst2)

reverse2 :: [t] -> [t]
reverse2 lst = if null lst
                then []
                else reverse2 (tail lst) +++ [head lst]

maxmin1 :: Ord b => [b] -> (b, b)
maxmin1 list = if null (tail list)
              then (head list, head list)
              else ( if head list > fst (maxmin1 (tail list))
                     then head list
                     else fst (maxmin1 (tail list))
                   , if head list < snd (maxmin1 (tail list))
                     then head list
                     else snd (maxmin1 (tail list))
                   )

maxmin2 :: Ord b => [b] -> (b, b)
maxmin2 list = let h = head list in
               if null (tail list) then (h, h)
               else ( if h > t_max then h else t_max
                    , if h < t_min then h else t_min )
                    where t = maxmin2 (tail list)
                          t_max = fst t
                          t_min = snd t

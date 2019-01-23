module Chapter2.SimpleFunctions where

firstOrEmpty :: [ String ] -> String
firstOrEmpty list = if not (null list) then head list else "empty"

(+++) :: [a] -> [a] -> [a]
list1 +++ list2 = if null list1
                  then list2
                  else (head list1) : (tail list1 +++ list2)

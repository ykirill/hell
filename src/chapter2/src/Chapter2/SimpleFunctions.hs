module Chapter2.SimpleFunctions where

firstOrEmpty :: [ String ] -> String
firstOrEmpty list = if not (null list) then head list else "empty"

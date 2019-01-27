module Chapter3.ParamPoly where

maybeString :: Maybe t -> String
maybeString (Just _)  = "Just"
maybeString (Nothing) = "Nothing"

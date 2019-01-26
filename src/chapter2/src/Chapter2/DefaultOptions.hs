module Chapter2.DefaultOptions where

data ConnType = TCP | UDP deriving (Show)
data UseProxy = NoProxy | Proxy String deriving (Show)
data TimeOut = NoTimeOut | TimeOut Integer deriving (Show)

data Connection = Connection deriving (Show)

connect :: String -> ConnType -> Integer -> UseProxy -> Bool -> Bool -> TimeOut -> Connection
connect _ _ _ _ _ _ _ = undefined

connectUrl :: String -> Connection
connectUrl url = connect url TCP 0 NoProxy False False NoTimeOut

data ConnOptions = ConnOptions { connType      :: ConnType
                               , connSpeed     :: Integer
                               , connProxy     :: UseProxy
                               , connCaching   :: Bool
                               , connKeepAlive :: Bool
                               , connTimeOut   :: TimeOut
                               } deriving (Show)

connect' :: String -> ConnOptions -> Connection
connect' _ _ = undefined

connDefault :: ConnOptions
connDefault = ConnOptions TCP 0 NoProxy False False NoTimeOut

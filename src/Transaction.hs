{-# LANGUAGE DeriveGeneric #-}

module Transaction where

import Data.Aeson
import GHC.Generics

data Transaction = Transaction
  { sender :: String
  , recipient :: String
  , amount :: Integer
  } deriving (Show, Generic)


instance ToJSON Transaction
instance FromJSON Transaction

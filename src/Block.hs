{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Block where

import Crypto.Hash
import Data.Aeson
import Data.Time
import GHC.Generics
import Transaction

type Timestamp = UTCTime
type Proof = Integer
type Hash = Integer -- TODO: use cryptonite 0.25

data Block = Block
  { block_index :: Integer
  , timestamp :: Timestamp
  , transactions :: [Transaction]
  , proof :: Proof
  , previous_hash :: Hash
  } deriving (Show, Generic)

instance ToJSON Block
instance FromJSON Block

hash :: Block -> Hash
hash block = 1
  where b = encode block
        c = hashWith SHA256 b

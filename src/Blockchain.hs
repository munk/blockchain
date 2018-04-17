module Blockchain where


import Block
import Transaction


data Blockchain = BC
  { chain :: [Block]
  , transactions :: [Transaction]
  }


data NewBlock = B Timestamp Proof


blockChain :: Timestamp -> Blockchain
blockChain ts = BC [block] []
  where block = Block 1 ts [] 100 1


newBlock :: Blockchain -> NewBlock -> Blockchain
newBlock this (B ts p) = newBlock' this prev_hash p ts
  where (bl, _) = case this of (BC b t) -> (b, t)
        prev_hash = previous_hash (last bl)


newBlock' :: Blockchain -> Hash -> Proof -> Timestamp -> Blockchain
newBlock' this prev_hash new_proof ts = BC new_block_list []
  where (bl, tl) = case this of (BC b t) -> (b, t)
        new_block_list = bl ++ [block]
        block = Block next_index ts tl new_proof prev_hash
        next_index = nextBlockIndex this


nextBlockIndex :: Blockchain -> Integer
nextBlockIndex (BC bl _) = fromIntegral $ length bl + 1


newTransaction :: Blockchain -> Transaction -> Blockchain
newTransaction (BC bl t) tx = BC bl (t ++ [tx])

module Lib where

import Data.Time
import Blockchain
import Block (Proof)

initBlockchain :: IO Blockchain
initBlockchain = fmap blockChain ts
  where ts = getCurrentTime

initBlock :: Proof -> IO NewBlock
initBlock proof = do
  ts <- getCurrentTime
  return $ B ts proof

addBlock :: IO Blockchain -> IO NewBlock -> IO Blockchain
addBlock io_chain io_block = do
  chain <- io_chain
  block <- io_block
  return $ newBlock chain block


someFunc :: IO ()
someFunc = putStrLn "someFunc"

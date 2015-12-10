{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Exception

import qualified Data.Text.Lazy as Text

import Network

import Thrift
import Thrift.Server
import Thrift.Types ()
import Thrift.Transport.Handle
import Thrift.Protocol.Binary

import qualified ArithmService
import ArithmService_Types
import ArithmService_Iface

import ArithmService_Impl

acc s = do
    (h, _, _) <- accept s
    let p = BinaryProtocol h
    return (p, p)

main = runThreadedServer acc
                         ArithmService_Impl
                         ArithmService.process
                         $ PortNumber 9050

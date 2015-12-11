module Main where

import qualified Network as N

import Thrift
import Thrift.Protocol.Binary
import Thrift.Server

import qualified Piphia
import Piphia_Impl

mkProto sock = do
    (h, _, _) <- N.accept sock
    let proto = BinaryProtocol h
    return (proto, proto)

main = do
    runThreadedServer mkProto Piphia_Impl Piphia.process $ N.PortNumber 9050

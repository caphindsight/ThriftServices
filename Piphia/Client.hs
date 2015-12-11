{-# LANGUAGE BangPatterns, ScopedTypeVariables #-}

module Main where

import Control.Exception (catch)

import qualified Data.Vector as V
import qualified Data.Text.Lazy as T

import qualified Network as N

import System.IO (hFlush, stdout)

import Thrift
import Thrift.Transport.Handle
import Thrift.Protocol.Binary

import Piphia_Types
import qualified Piphia_Client as Cl

ask q f = do
    putStr q
    hFlush stdout
    ln <- getLine
    return $ f ln

main = do
    !h <- N.connectTo "localhost" $ N.PortNumber 9050
    putStrLn "Connected to piphiad!"

    (n :: Int) <- ask "How many choices do you have? : " read
    choices <- sequence [ask ("Choice #" ++ show i ++ ": ") T.pack | i <- [1..n]]

    let proto = BinaryProtocol h

    catch
        (do
            choice <- Cl.makePrediction (proto, proto) $ V.fromList choices
            putStrLn $ "Piphia says: " ++ T.unpack choice)

        (\(e :: EmptyOptionsGivenException) -> do
            putStrLn "Ohohohohoho")


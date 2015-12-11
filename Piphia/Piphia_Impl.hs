module Piphia_Impl where

import Control.Exception (throw)

import qualified Data.Vector as V

import System.Random (randomIO)

import Piphia_Types
import Piphia_Iface

data Piphia_Impl = Piphia_Impl
instance Piphia_Iface Piphia_Impl where
    makePrediction _ opts = do
        q <- randomIO :: IO Int
        let n = V.length opts
        if n /= 0
            then do
                let prediction = (V.!) opts ((abs q) `rem` n)
                putStrLn $ show (V.toList opts) ++ " -> " ++ show prediction
                return prediction
            else throw EmptyOptionsGivenException

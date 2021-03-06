{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-missing-fields #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-----------------------------------------------------------------
-- Autogenerated by Thrift Compiler (0.9.3)                      --
--                                                             --
-- DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING --
-----------------------------------------------------------------

module BackdoorService where
import Prelude (($), (.), (>>=), (==), (++))
import qualified Prelude as P
import qualified Control.Exception as X
import qualified Control.Monad as M ( liftM, ap, when )
import Data.Functor ( (<$>) )
import qualified Data.ByteString.Lazy as LBS
import qualified Data.Hashable as H
import qualified Data.Int as I
import qualified Data.Maybe as M (catMaybes)
import qualified Data.Text.Lazy.Encoding as E ( decodeUtf8, encodeUtf8 )
import qualified Data.Text.Lazy as LT
import qualified GHC.Generics as G (Generic)
import qualified Data.Typeable as TY ( Typeable )
import qualified Data.HashMap.Strict as Map
import qualified Data.HashSet as Set
import qualified Data.Vector as Vector
import qualified Test.QuickCheck.Arbitrary as QC ( Arbitrary(..) )
import qualified Test.QuickCheck as QC ( elements )

import qualified Thrift as T
import qualified Thrift.Types as T
import qualified Thrift.Arbitraries as T


import BackdoorService_Types
import qualified BackdoorService_Iface as Iface
-- HELPER FUNCTIONS AND STRUCTURES --

data Exec_args = Exec_args  { exec_args_program :: LT.Text
  , exec_args_arguments :: (Vector.Vector LT.Text)
  , exec_args_stdin :: LT.Text
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Exec_args where
  hashWithSalt salt record = salt   `H.hashWithSalt` exec_args_program record   `H.hashWithSalt` exec_args_arguments record   `H.hashWithSalt` exec_args_stdin record  
instance QC.Arbitrary Exec_args where 
  arbitrary = M.liftM Exec_args (QC.arbitrary)
          `M.ap`(QC.arbitrary)
          `M.ap`(QC.arbitrary)
  shrink obj | obj == default_Exec_args = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Exec_args{exec_args_program = exec_args_program obj} then P.Nothing else P.Just $ default_Exec_args{exec_args_program = exec_args_program obj}
    , if obj == default_Exec_args{exec_args_arguments = exec_args_arguments obj} then P.Nothing else P.Just $ default_Exec_args{exec_args_arguments = exec_args_arguments obj}
    , if obj == default_Exec_args{exec_args_stdin = exec_args_stdin obj} then P.Nothing else P.Just $ default_Exec_args{exec_args_stdin = exec_args_stdin obj}
    ]
from_Exec_args :: Exec_args -> T.ThriftVal
from_Exec_args record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v10 -> P.Just (1, ("program",T.TString $ E.encodeUtf8 _v10))) $ exec_args_program record
  , (\_v10 -> P.Just (2, ("arguments",T.TList T.T_STRING $ P.map (\_v12 -> T.TString $ E.encodeUtf8 _v12) $ Vector.toList _v10))) $ exec_args_arguments record
  , (\_v10 -> P.Just (3, ("stdin",T.TString $ E.encodeUtf8 _v10))) $ exec_args_stdin record
  ]
write_Exec_args :: (T.Protocol p, T.Transport t) => p t -> Exec_args -> P.IO ()
write_Exec_args oprot record = T.writeVal oprot $ from_Exec_args record
encode_Exec_args :: (T.Protocol p, T.Transport t) => p t -> Exec_args -> LBS.ByteString
encode_Exec_args oprot record = T.serializeVal oprot $ from_Exec_args record
to_Exec_args :: T.ThriftVal -> Exec_args
to_Exec_args (T.TStruct fields) = Exec_args{
  exec_args_program = P.maybe (exec_args_program default_Exec_args) (\(_,_val14) -> (case _val14 of {T.TString _val15 -> E.decodeUtf8 _val15; _ -> P.error "wrong type"})) (Map.lookup (1) fields),
  exec_args_arguments = P.maybe (exec_args_arguments default_Exec_args) (\(_,_val14) -> (case _val14 of {T.TList _ _val16 -> (Vector.fromList $ P.map (\_v17 -> (case _v17 of {T.TString _val18 -> E.decodeUtf8 _val18; _ -> P.error "wrong type"})) _val16); _ -> P.error "wrong type"})) (Map.lookup (2) fields),
  exec_args_stdin = P.maybe (exec_args_stdin default_Exec_args) (\(_,_val14) -> (case _val14 of {T.TString _val19 -> E.decodeUtf8 _val19; _ -> P.error "wrong type"})) (Map.lookup (3) fields)
  }
to_Exec_args _ = P.error "not a struct"
read_Exec_args :: (T.Transport t, T.Protocol p) => p t -> P.IO Exec_args
read_Exec_args iprot = to_Exec_args <$> T.readVal iprot (T.T_STRUCT typemap_Exec_args)
decode_Exec_args :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Exec_args
decode_Exec_args iprot bs = to_Exec_args $ T.deserializeVal iprot (T.T_STRUCT typemap_Exec_args) bs
typemap_Exec_args :: T.TypeMap
typemap_Exec_args = Map.fromList [(1,("program",T.T_STRING)),(2,("arguments",(T.T_LIST T.T_STRING))),(3,("stdin",T.T_STRING))]
default_Exec_args :: Exec_args
default_Exec_args = Exec_args{
  exec_args_program = "",
  exec_args_arguments = Vector.empty,
  exec_args_stdin = ""}
data Exec_result = Exec_result  { exec_result_success :: ExecResponse
  } deriving (P.Show,P.Eq,G.Generic,TY.Typeable)
instance H.Hashable Exec_result where
  hashWithSalt salt record = salt   `H.hashWithSalt` exec_result_success record  
instance QC.Arbitrary Exec_result where 
  arbitrary = M.liftM Exec_result (QC.arbitrary)
  shrink obj | obj == default_Exec_result = []
             | P.otherwise = M.catMaybes
    [ if obj == default_Exec_result{exec_result_success = exec_result_success obj} then P.Nothing else P.Just $ default_Exec_result{exec_result_success = exec_result_success obj}
    ]
from_Exec_result :: Exec_result -> T.ThriftVal
from_Exec_result record = T.TStruct $ Map.fromList $ M.catMaybes
  [ (\_v22 -> P.Just (0, ("success",from_ExecResponse _v22))) $ exec_result_success record
  ]
write_Exec_result :: (T.Protocol p, T.Transport t) => p t -> Exec_result -> P.IO ()
write_Exec_result oprot record = T.writeVal oprot $ from_Exec_result record
encode_Exec_result :: (T.Protocol p, T.Transport t) => p t -> Exec_result -> LBS.ByteString
encode_Exec_result oprot record = T.serializeVal oprot $ from_Exec_result record
to_Exec_result :: T.ThriftVal -> Exec_result
to_Exec_result (T.TStruct fields) = Exec_result{
  exec_result_success = P.maybe (exec_result_success default_Exec_result) (\(_,_val24) -> (case _val24 of {T.TStruct _val25 -> (to_ExecResponse (T.TStruct _val25)); _ -> P.error "wrong type"})) (Map.lookup (0) fields)
  }
to_Exec_result _ = P.error "not a struct"
read_Exec_result :: (T.Transport t, T.Protocol p) => p t -> P.IO Exec_result
read_Exec_result iprot = to_Exec_result <$> T.readVal iprot (T.T_STRUCT typemap_Exec_result)
decode_Exec_result :: (T.Protocol p, T.Transport t) => p t -> LBS.ByteString -> Exec_result
decode_Exec_result iprot bs = to_Exec_result $ T.deserializeVal iprot (T.T_STRUCT typemap_Exec_result) bs
typemap_Exec_result :: T.TypeMap
typemap_Exec_result = Map.fromList [(0,("success",(T.T_STRUCT typemap_ExecResponse)))]
default_Exec_result :: Exec_result
default_Exec_result = Exec_result{
  exec_result_success = default_ExecResponse}
process_exec (seqid, iprot, oprot, handler) = do
  args <- read_Exec_args iprot
  (X.catch
    (do
      val <- Iface.exec handler (exec_args_program args) (exec_args_arguments args) (exec_args_stdin args)
      let res = default_Exec_result{exec_result_success = val}
      T.writeMessageBegin oprot ("Exec", T.M_REPLY, seqid)
      write_Exec_result oprot res
      T.writeMessageEnd oprot
      T.tFlush (T.getTransport oprot))
    ((\_ -> do
      T.writeMessageBegin oprot ("Exec", T.M_EXCEPTION, seqid)
      T.writeAppExn oprot (T.AppExn T.AE_UNKNOWN "")
      T.writeMessageEnd oprot
      T.tFlush (T.getTransport oprot)) :: X.SomeException -> P.IO ()))
proc_ handler (iprot,oprot) (name,typ,seqid) = case name of
  "Exec" -> process_exec (seqid,iprot,oprot,handler)
  _ -> do
    _ <- T.readVal iprot (T.T_STRUCT Map.empty)
    T.writeMessageBegin oprot (name,T.M_EXCEPTION,seqid)
    T.writeAppExn oprot (T.AppExn T.AE_UNKNOWN_METHOD ("Unknown function " ++ LT.unpack name))
    T.writeMessageEnd oprot
    T.tFlush (T.getTransport oprot)
process handler (iprot, oprot) = do
  (name, typ, seqid) <- T.readMessageBegin iprot
  proc_ handler (iprot,oprot) (name,typ,seqid)
  T.readMessageEnd iprot
  P.return P.True

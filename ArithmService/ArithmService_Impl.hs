module ArithmService_Impl where
import ArithmService_Iface
import ArithmService_Types
import Control.Exception

data ArithmService_Impl = ArithmService_Impl
instance ArithmService_Iface ArithmService_Impl where
    calc _ ADD a b = return $ a + b
    calc _ SUB a b = return $ a - b
    calc _ MUL a b = return $ a * b
    calc _ DIV a b
      | b == 0     = throw DivizionByZeroException
      | otherwise  = return $ a `div` b
    calc _ REM a b
      | b == 0     = throw DivizionByZeroException
      | otherwise  = return $ a `mod` b



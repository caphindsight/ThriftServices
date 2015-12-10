enum ArithmOp {
    ADD, SUB, MUL, DIV, REM
}

exception DivizionByZeroException {}

service ArithmService {
    i32 Calc(1: ArithmOp op, 2: i32 a, 3: i32 b)
        throws (1: DivizionByZeroException ouch);
}

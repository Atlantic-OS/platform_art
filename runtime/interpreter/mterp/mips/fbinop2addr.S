    /*
     * Generic 32-bit "/2addr" binary operation.  Provide an "instr"
     * that specifies an instruction that performs "fv0 = fa0 op fa1".
     * This could be an MIPS instruction or a function call.
     *
     * For: add-float/2addr, sub-float/2addr, mul-float/2addr,
     *      div-float/2addr, rem-float/2addr
     */
    /* binop/2addr vA, vB */
    GET_OPA4(rOBJ)                         #  rOBJ <- A+
    GET_OPB(a3)                            #  a3 <- B
    GET_VREG_F(fa0, rOBJ)
    GET_VREG_F(fa1, a3)
    FETCH_ADVANCE_INST(1)                  #  advance rPC, load rINST

    $instr
    GET_INST_OPCODE(t0)                    #  extract opcode from rINST
    SET_VREG_F_GOTO(fv0, rOBJ, t0)         #  vA <- result

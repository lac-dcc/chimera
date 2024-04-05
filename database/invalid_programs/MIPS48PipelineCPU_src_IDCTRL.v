`include "marco.h"
`include "opcode.h"

module IDCTRL(IR,CMPOut,PCSel, CMPOp, NPCOp, EXTOp, RS_ESel, Flush);

    input  [`i32]   IR;
    input       CMPOut;
    output [1:0] PCSel;
    output [2:0] CMPOp;
    output       NPCOp;
    output       EXTOp;
    output       RS_ESel;
    output       Flush;

    DECODE IDDECODE(.IR(IR));

    assign CMPOp = (IR[`op] == `BEQ ) ? 3'b000 :
                   (IR[`op] == `BNQ ) ? 3'b001 :
                   (IR[`op] == `BLEZ) ? 3'b010 :
                   (IR[`op] == `BGTZ) ? 3'b011 :
                   ((IR[`op] == `BLTZ) && 
                    (IR[`rt] == 'h0 ))? 3'b100 :
                   ((IR[`op] == `BGEZ) &&
                    (IR[`rt] == 'h1 ))? 3'b101 :
                                        3'bxxx ;
    assign NPCOp = (IDDECODE.branch) ? `NPCOPB :
                   (IDDECODE.jump  ) ? `NPCOPJ :
                                       'bx     ;
    assign EXTOp = IDDECODE.sign_extend;
    
    // MUX RS_EMUX(
    //     .in_0(MFRSD.Q), other IR
    //     .in_1(SA),      cal_r_withSA
    //     .A(RS_ESel)
    // );
    assign RS_ESel = IDDECODE.cal_r_withSA;

    // MUX3 PCMUX(
    //     .in_0(ADD4),    other IR
    //     .in_1(npc),     branch(&&CMPOut==1),J,JAL
    //     .in_2(MFRSD.Q), JALR,JR
    //     .A(PCSel)
    // );
    assign PCSel = ( IDDECODE.jr ) ? 2 :
                   ( IDDECODE.J    ||
                     IDDECODE.JAL  ||
                     ( IDDECODE.branch && 
                       CMPOut ))   ? 1 :
                                     0 ;
    assign Flush = (PCSel == 1)||(PCSel == 2);

endmodule

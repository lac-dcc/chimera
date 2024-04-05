`include "marco.h"
`include "opcode.h"

module WBCTRL(IR, LDEXTOp, LDEXTBE,RFWe,A3Sel,WDSel);
    
    input [`i32] IR     ;
    output           LDEXTOp;
    output [3:0]     LDEXTBE;
    output           RFWe   ;
    output [1:0]     A3Sel  ;
    output [1:0]     WDSel  ;

    
    DECODE WBDECODE(.IR(IR));
    assign {LDEXTU,LDEXTBE} = 
            (IR[`op] == `LB ) ? 5'b1_1000 :
            (IR[`op] == `LBU) ? 5'b0_1000 :
            (IR[`op] == `LH ) ? 5'b1_1100 :
            (IR[`op] == `LHU) ? 5'b0_1100 :
            (IR[`op] == `LW ) ? 5'b1_1111 :
                                5'bx_xxxx ;

    assign RFWe  = !( WBDECODE.branch ||
                      WBDECODE.st     ||
                      WBDECODE.ju     );
    
    /**
     *  .in_0(IR_W[`rt]),     cal_i,ld,LUI(rt)
     *  .in_1(IR_W[`rd]),     other IR(rd)
     *  .in_2(5'b11111),      JAL($ra)
     */
    assign A3Sel  = ( IR[`op] == `JAL ) ? 2 :
                    ( WBDECODE.cal_i ||
                      WBDECODE.LUI   ||
                      WBDECODE.ld     ) ? 0 :
                                          1 ;
    /**
     * .in_0(LDEXT.out)   ld(DR@W)
     * .in_1(AO_W)        other IR
     * .in_2(PC4_W)       JAL,JALR
     */
    assign WDSel = ( WBDECODE.jl ) ? 2 :
                   ( WBDECODE.ld ) ? 0 :
                                     1 ;

    assign LDEXTOp = (( IR[`op] == `LB  ) || ( IR[`op] == `LH  ) || ( IR[`op] == `LW )) ? 1 :
                     (( IR[`op] == `LBU ) || ( IR[`op] == `LHU ))                       ? 0 :
                                                                                         'bz; 

endmodule

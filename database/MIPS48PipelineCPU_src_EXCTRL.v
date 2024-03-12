`include "opcode.h"
`include "marco.h"

module EXCTRL(IR,ALUBSel,AOSel,ALUOp,MULOp);
    
    input [`i32] IR;
    output      ALUBSel;
    output [1:0]  AOSel;
    output [3:0]  ALUOp;
    output [1:0]  MULOp;
   
    /**
     * .in_0(EXT_E),   cal_i,ld,st,LUI
     * .in_1(MFRTE.Q), other IR
     * .A(ALUBSel)
     */
    assign ALUBSel = (IR[`op] > 7) ? 0 : 1;
    
    /**
     *  .in_0(ALU.C),         other IR
     *  .in_1(MULTIPLIER.HI), mfhi
     *  .in_2(MULTIPLIER.LO), mflo
     *  .A(AOSel)
     */
    assign AOSel   = ((IR[`op] == `R_type) && (IR[`funct] == `MFLO)) ? 2 :
                     ((IR[`op] == `R_type) && (IR[`funct] == `MFHI)) ? 1 :
                                                                       0 ;
    /**
     * 2'b00 signed   * mult
     * 2'b01 unsigned * multu
     * 2'b10 signed   / div
     * 2'b11 unsigned / divu
     */
    assign MULOp   = (IR[`op] == `R_type)  ? (
                    (IR[`funct] == `MULT ) ? 2'b00 :
                    (IR[`funct] == `MULTU) ? 2'b01 :
                    (IR[`funct] == `DIV  ) ? 2'b10 :
                    (IR[`funct] == `DIVU ) ? 2'b11 :
                                             2'bzz)
                                           : 2'bzz ;
    /**
     * 4'b0000(+)     : ADD/ADDU/ADDI/ADDIU/ld/st
     * 4'b0001(-)     : SUB/SUBU
     * 4'b0010(&)     : AND/ANDI
     * 4'b0011(|)     : OR/ORI
     * 4'b0100(^)     : XOR/XORI
     * 4'b0101(~|)    : NOR 
     * 4'b0110(RT<<RS): SLLV/SLL
     * 4'b0111(RT>>RS): SRLV/SRL
     * 4'b1000($signed(RT)>>>RS):SRAV/SRA
     * 4'b1001(RD=($signed(RS)<$signed(RT))? 1:0):SLT/SLTI
     * 4'b1010(RD=(RS<RT)? 1:0):SLTU/SLTIU
     * 4'b1011(RT<<16):LUI .
     */
    assign ALUOp = (IR[`op] == `R_type) ? (
                        (IR[`funct] == `ADD ) ? 4'b0000 :
                        (IR[`funct] == `ADDU) ? 4'b0000 :
                        (IR[`funct] == `SUB ) ? 4'b0001 :
                        (IR[`funct] == `SUBU) ? 4'b0001 :
                        (IR[`funct] == `AND ) ? 4'b0010 :
                        (IR[`funct] == `OR  ) ? 4'b0011 :
                        (IR[`funct] == `XOR ) ? 4'b0100 : 
                        (IR[`funct] == `NOR ) ? 4'b0101 :
                        (IR[`funct] == `SLL ) ? 4'b0110 :
                        (IR[`funct] == `SLLV) ? 4'b0110 : 
                        (IR[`funct] == `SRL ) ? 4'b0111 :
                        (IR[`funct] == `SRLV) ? 4'b0111 :
                        (IR[`funct] == `SRA ) ? 4'b1000 : 
                        (IR[`funct] == `SRAV) ? 4'b1000 :
                        (IR[`funct] == `SLT ) ? 4'b1001 :
                        (IR[`funct] == `SLTU) ? 4'b1010 :
                                                4'bxxxx
                    ) : (
                        (IR[`op] == `ADDI ) ? 4'b0000 :
                        (IR[`op] == `ADDIU) ? 4'b0000 :
                        (IR[`op] >= `LB   ) ? 4'b0000 :
                        (IR[`op] == `ANDI ) ? 4'b0010 :
                        (IR[`op] == `ORI  ) ? 4'b0011 :
                        (IR[`op] == `XORI ) ? 4'b0100 :
                        (IR[`op] == `SLTI ) ? 4'b1001 :
                        (IR[`op] == `SLTIU) ? 4'b1010 :
                        (IR[`op] == `LUI  ) ? 4'b1011 :
                                              4'bxxxx 
                    );
endmodule 

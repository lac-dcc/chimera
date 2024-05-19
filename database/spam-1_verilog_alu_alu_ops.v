// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef ALU_OPS_V
`define ALU_OPS_V

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

`timescale 1ns/1ns
`define toALUOP(OPNAME) alu_ops::OP_``OPNAME``

package alu_ops;

    localparam [4:0] OP_0=0; // NOT NEEDED  USE RAM_DIRECT_EQ_IMMED8
    localparam [4:0] OP_A=1; 
    localparam [4:0] OP_B=2;
    localparam [4:0] OP_NEGATE_A=3;  
    localparam [4:0] OP_NEGATE_B=4;  
    localparam [4:0] OP_BA_DIV_10=5; // Divide BINARY (NOT BCD)  value A by 10 using B as a carry in remainder (=A+(B*256)/10), if B>9 then remainder was illegal and result is 0 and overflow is set 
    localparam [4:0] OP_BA_MOD_10=6; // Mod BINARY (NOT BCD)  value A by 10 using B as a carry in remainder (=A+(B*256)%10), if B>9 then remainder was illegal and result is 0 and overflow is set
    localparam [4:0] OP_B_PLUS_1=7; // needed for X=RAM+1  & doesn't carry in ---- CONSIDER RAM ON BUS A!!!!

    localparam [4:0] OP_B_MINUS_1=8; // needed for X=RAM-1, no carry in ---- CONSIDER RAM ON BUS A!!!!
    localparam [4:0] OP_A_PLUS_B=9;
    localparam [4:0] OP_A_MINUS_B=10;
    localparam [4:0] OP_B_MINUS_A=11;
    localparam [4:0] OP_A_MINUS_B_SIGNEDMAG=12;
    localparam [4:0] OP_A_PLUS_B_PLUS_C=13;
    localparam [4:0] OP_A_MINUS_B_MINUS_C=14;
    localparam [4:0] OP_B_MINUS_A_MINUS_C=15;

    localparam [4:0] OP_A_TIMES_B_LO=16;
    localparam [4:0] OP_A_TIMES_B_HI=17;
    localparam [4:0] OP_A_DIV_B=18; // doesn't use carry remainer in as not enought ALU inputs, sets Overflow if div by zero
    localparam [4:0] OP_A_MOD_B=19; // doesn't use carry remainer in as not enought ALU inputs, sets Overflow if div by zero
    localparam [4:0] OP_A_LSL_B=20; // C <- A <- 0
    localparam [4:0] OP_A_LSR_B=21; // logical shift right - simple bit wise
    localparam [4:0] OP_A_ASR_B=22; // arith shift right - preserves top bit and fills with top bit as shift right   nb. same as "CMP #80/ROR A" on 6502
    localparam [4:0] OP_A_RLC_B=23; // Z80 RLC RotateLeftCircular http://z80-heaven.wikidot.com/instructions-set:rlc rather than https://www.masswerk.at/6502/6502_instruction_set.html#ROL as we don't have a carry in to the ROM or external logic

    localparam [4:0] OP_A_RRC_B=24; // Z80 RRC RotateRightCircular rather than https://www.masswerk.at/6502/6502_instruction_set.html#ROR
    localparam [4:0] OP_A_AND_B=25;
    localparam [4:0] OP_A_OR_B=26;  
    localparam [4:0] OP_A_XOR_B=27; // NB XOR can can also synthesise NOT A by setting B to 0xff 
    localparam [4:0] OP_A_NAND_B=28;  
    localparam [4:0] OP_NOT_B=29;  // if NOT_A is need then use A XOR 0xff
    localparam [4:0] OP_A_PLUS_B_BCD=30;  // NOT CARRY IN
    localparam [4:0] OP_A_MINUS_B_BCD=31;  // NOT CARRY IN , SETS NEGATIVE BIT IF B>A


    // returning a bitset is needed when using strobe to print
    typedef reg[13*8:1] OpName;

    function OpName aluopNameR; input [4:0] opcode;
        OpName ret;
        begin
            case(opcode)
                 0 : aluopNameR =    "0";
                 1 : aluopNameR =    "A";
                 2 : aluopNameR =    "B";
                 3 : aluopNameR =    "-A";
                 4 : aluopNameR =    "-B";
                 5 : aluopNameR =    "AB DIV 10";
                 6 : aluopNameR =    "AB MOD 10";
                 7 : aluopNameR =    "B+1";

                 8 : aluopNameR =    "B-1";
                 9 : aluopNameR =    "A+B";   // CarryIn not considered
                10 : aluopNameR =    "A-B";   // CarryIn not considered
                11 : aluopNameR =    "B-A";   // CarryIn not considered
                12 : aluopNameR =    "A-B signedmag"; // CarryIn not considered
                13 : aluopNameR =    "A+B+1"; // If CarryIn=N then this op is automatically updated to A+B
                14 : aluopNameR =    "A-B-1"; // If CarryIn=N then this op is automatically updated to A-B
                15 : aluopNameR =    "B-A-1"; // If CarryIn=N then this op is automatically updated to B-A

                16 : aluopNameR =    "A*B LO";
                17 : aluopNameR =    "A*B HI";
                18 : aluopNameR =    "A DIV B";
                19 : aluopNameR =    "A MOD B";
                20 : aluopNameR =    "A LSL B";
                21 : aluopNameR =    "A LSR B";
                22 : aluopNameR =    "A ASR B" ;
                23 : aluopNameR =    "A RLC B";

                24 : aluopNameR =    "A RRC B";
                25 : aluopNameR =    "A AND B";
                26 : aluopNameR =    "A OR B";
                27 : aluopNameR =    "A XOR B"; 
                28 : aluopNameR =    "A NAND B";
                29 : aluopNameR =    "NOT B";
                30 : aluopNameR =    "A+B BCD";
                31 : aluopNameR =    "A-B BCD";
                default: begin
                    $sformat(ret,"??unknown(%b)",opcode);
                    aluopNameR = ret;
                end
            endcase
        end
    endfunction
    
    function string aluopName; input [4:0] opcode;
        string ret;
        begin
            $sformat(ret,"%-1s",aluopNameR(opcode));
            aluopName = ret;
        end
    endfunction

endpackage


`endif

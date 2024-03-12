`define _DEFINES_V_

//-------------------------ALU Operation-------------------------
`define ADD_EXE 4'd0
`define ADDU_EXE 4'd1
`define SUB_EXE 4'd2
`define SUBU_EXE 4'd3
`define AND_EXE 4'd4
`define OR_EXE 4'd5
`define XOR_EXE 4'd6
`define NOR_EXE 4'd7
`define SLL_EXE 4'd8
`define SRL_EXE 4'd9
`define SRA_EXE 4'd10
`define SLT_EXE 4'd11
`define SLTU_EXE 4'd12


//-------------------------HI_LO Operation-------------------------
`define NOP_FOR_HI_LO   4'd0
`define MULT_OP         4'd1
`define MULTU_OP        4'd2
`define DIV_OP          4'd3
`define DIVU_OP         4'd4
`define MFHI_OP         4'd5
`define MFLO_OP         4'd6
`define MTHI_OP         4'd7
`define MTLO_OP         4'd8


//-------------------------DM_EXT Operation-------------------------
`define NOP_FOR_DM_EXT  3'd0
`define LB_EXT          3'd1
`define LBU_EXT         3'd2
`define LH_EXT          3'd3
`define LHU_EXT         3'd4
`define LW_EXT          3'd5

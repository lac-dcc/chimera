`ifndef FPU_COMMON_V
`define FPU_COMMON_V

`include "fpu_config.v"
`include "macros.vh"

`define NFPR               32
`define FPRID_WIDTH        `ceilLog2(`NFPR)

`define FPR_WIDTH       64
`define FPR_REC_WIDTH  (64+1)
`define SP_REC_WIDTH   (32+1)

`define FSR_WIDTH (`FPU_EXC_WIDTH+`FPU_RM_WIDTH)
`define FSR_EXC   `FPU_EXC_WIDTH-1:0
`define FSR_RM    `FPU_EXC_WIDTH+`FPU_RM_WIDTH-1:`FPU_EXC_WIDTH

`define FPU_RM_DYN  3'd7

`define FPU_RM_SUPPORTED(rm) ((rm) == {1'b0,`round_nearest_even} || \
                              (rm) == {1'b0,`round_minMag} || \
                              (rm) == {1'b0,`round_min} || \
                              (rm) == {1'b0,`round_max})

`define FPU_EXC_WIDTH 5
`define FPU_RM_WIDTH  3


`define PRECISION_S     1'b0
`define PRECISION_D     1'b1
`define PRECISION_WIDTH 1'b1

`define FPU_CMD_X          6'b000000
`define FPU_CMD_ADD        6'b000000
`define FPU_CMD_SUB        6'b000001
`define FPU_CMD_MUL        6'b000010
`define FPU_CMD_DIV        6'b000011
`define FPU_CMD_SQRT       6'b000100
`define FPU_CMD_SGNINJ     6'b000101
`define FPU_CMD_SGNINJN    6'b000110
`define FPU_CMD_SGNMUL     6'b000111
`define FPU_CMD_TRUNC_L    6'b001000
`define FPU_CMD_TRUNCU_L   6'b001001
`define FPU_CMD_TRUNC_W    6'b001010
`define FPU_CMD_TRUNCU_W   6'b001011
`define FPU_CMD_CVT_L      6'b001100
`define FPU_CMD_CVTU_L     6'b001101
`define FPU_CMD_CVT_W      6'b001110
`define FPU_CMD_CVTU_W     6'b001111
`define FPU_CMD_CVT_S      (6'b010000 + `PRECISION_S)
`define FPU_CMD_CVT_D      (6'b010000 + `PRECISION_D)
`define FPU_CMD_C_EQ       6'b010101
`define FPU_CMD_C_LT       6'b010110
`define FPU_CMD_C_LE       6'b010111
`define FPU_CMD_MIN        6'b011000
`define FPU_CMD_MAX        6'b011001
`define FPU_CMD_MF         6'b011100
`define FPU_CMD_MFFSR      6'b011101
`define FPU_CMD_MT         6'b011110
`define FPU_CMD_MTFSR      6'b011111
`define FPU_CMD_MADD       6'b100100
`define FPU_CMD_MSUB       6'b100101
`define FPU_CMD_NMSUB      6'b100110
`define FPU_CMD_NMADD      6'b100111
`define FPU_CMD_LD         6'b111000
`define FPU_CMD_ST         6'b111001
`define FPU_CMD_WIDTH      6

`define FPU_PIPE_ID_WIDTH `ceilLog2(`FPU_NPIPES)

`endif

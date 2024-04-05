`include "vuVXU-B8-Config.vh"

// IDs of the various pipelines
`define FPU_PIPE_X         3'dx
`define FPU_PIPE_FMA_S     3'd0
`define FPU_PIPE_FMA_D     3'd1
`define FPU_PIPE_INT_FLOAT 3'd2
`define FPU_PIPE_CVT_S_D   3'd3
`define FPU_PIPE_MOVE      3'd4
`define FPU_NPIPES         5

// keep this in sync with FPU_PIPE_DEPTH below!!
`define FPU_MAX_PIPE_DEPTH (2**`ceilLog2(`FPU_PIPE_DEPTH(`FPU_PIPE_FMA_D)))

`define FPU_PIPE_DEPTH_FMA_S     `FMA_STAGES // S & D pipes shared with VXU
`define FPU_PIPE_DEPTH_FMA_D     `FMA_STAGES
`define FPU_PIPE_DEPTH_INT_FLOAT 3'd2
`define FPU_PIPE_DEPTH_CVT_S_D   3'd2
`define FPU_PIPE_DEPTH_MOVE      3'd1

// depths of the various pipelines
`define FPU_PIPE_DEPTH(i) ( \
          (i) == `FPU_PIPE_FMA_S     ? `FPU_PIPE_DEPTH_FMA_S     : \
          (i) == `FPU_PIPE_FMA_D     ? `FPU_PIPE_DEPTH_FMA_D     : \
          (i) == `FPU_PIPE_INT_FLOAT ? `FPU_PIPE_DEPTH_INT_FLOAT : \
          (i) == `FPU_PIPE_CVT_S_D   ? `FPU_PIPE_DEPTH_CVT_S_D   : \
          (i) == `FPU_PIPE_MOVE      ? `FPU_PIPE_DEPTH_MOVE      : \
        3'dx)

`define FPU_PIPE_DEPTH_FLOAT_INT `FPU_PIPE_DEPTH_INT_FLOAT

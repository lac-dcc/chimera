`timescale 1ns/1ps
`ifdef FPGA
	`include "log.vh"
`endif
module mux
#(
// ******************************************************************
// PARAMETERS
// ******************************************************************
    parameter integer DATA_WIDTH  = 16,
    parameter integer NUM_DATA    = 16,
    parameter integer SHUFFLE_DATA_WIDTH = DATA_WIDTH * NUM_DATA,
    parameter integer CTRL_WIDTH         = `C_LOG_2 (NUM_DATA)
// ******************************************************************
) (
// ******************************************************************
// IO
// ******************************************************************
    input  wire [SHUFFLE_DATA_WIDTH-1:0]    DATA_IN,
    input  wire [CTRL_WIDTH        -1:0]    CTRL_IN,
    output wire [DATA_WIDTH        -1:0]    DATA_OUT
// ******************************************************************
);

// ******************************************************************
// LOCALPARAMS
// ******************************************************************
    
    
    localparam integer SHUFFLE_CTRL_WIDTH = CTRL_WIDTH * NUM_DATA;
// ******************************************************************
  `ifdef FPGA
    genvar i;
    generate
        for (i=0; i<NUM_DATA; i=i+1)
        begin : MUX
            assign DATA_OUT = (CTRL_IN == i) ? DATA_IN[i*DATA_WIDTH+:DATA_WIDTH] : {DATA_WIDTH{1'bz}};
        end
    endgenerate
  `else
    assign DATA_OUT = DATA_IN[CTRL_IN*DATA_WIDTH+:DATA_WIDTH];
  `endif

endmodule

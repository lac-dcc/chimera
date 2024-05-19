// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
`ifdef FPGA
	`include "log.vh"
`endif
module shifter
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
    input  wire                             ACLK,
    input  wire                             ARESETN,
    input  wire                             RD_EN,
    input  wire [SHUFFLE_DATA_WIDTH-1:0]    DATA_IN,
    input  wire [CTRL_WIDTH        -1:0]    CTRL_IN,
    output wire [SHUFFLE_DATA_WIDTH-1:0]    DATA_OUT
// ******************************************************************
);

// ******************************************************************
// Localparams
// ******************************************************************
    
// ******************************************************************

// ******************************************************************
// Local wires and regs
// ******************************************************************
    genvar i;
    wire [SHUFFLE_DATA_WIDTH-1:0]    data_in_r;
    wire [CTRL_WIDTH        -1:0]    ctrl_in_r;
    wire [SHUFFLE_DATA_WIDTH-1:0]    data_out;
// ******************************************************************

// ******************************************************************
// Register
// ******************************************************************
    register #(
        .LEN        ( SHUFFLE_DATA_WIDTH    )
    ) data_in_register (
        .clk        ( ACLK                  ),
        .reset      ( !ARESETN              ),
        .wrEn       ( RD_EN                 ),
        .dataIn     ( DATA_IN               ),
        .dataOut    ( data_in_r             )
    );

    register #(
        .LEN        ( CTRL_WIDTH            )
    ) ctrl_in_register (
        .clk        ( ACLK                  ),
        .reset      ( !ARESETN              ),
        .wrEn       ( RD_EN                 ),
        .dataIn     ( CTRL_IN               ),
        .dataOut    ( ctrl_in_r             )
    );

    assign DATA_OUT = data_out;

// ******************************************************************

// ******************************************************************
// Mux instances
// ******************************************************************
generate
for (i=0; i<NUM_DATA; i=i+1)
begin : INST_MUXES

    wire [SHUFFLE_DATA_WIDTH   -1 : 0] mux_data_in;
    wire [DATA_WIDTH           -1 : 0] mux_data_out;
    wire [CTRL_WIDTH           -1 : 0] mux_ctrl_in;

    wire [SHUFFLE_DATA_WIDTH*2 -1 : 0] tmp;

    assign mux_ctrl_in = ctrl_in_r;
    assign tmp = {data_in_r, data_in_r} >> (i*DATA_WIDTH);
    assign mux_data_in = tmp;
    assign data_out [i*DATA_WIDTH+:DATA_WIDTH] = mux_data_out;

    mux #(
        .DATA_WIDTH     ( DATA_WIDTH    ),
        .NUM_DATA       ( NUM_DATA      )
    ) mux_shuffle (
        .DATA_IN        ( mux_data_in   ),
        .CTRL_IN        ( mux_ctrl_in   ),
        .DATA_OUT       ( mux_data_out  )
    );

end
endgenerate
// ******************************************************************

endmodule

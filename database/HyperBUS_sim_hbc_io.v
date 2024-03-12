`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:04 08/10/2018 
// Design Name: 
// Module Name:    hbc_io 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hbc_io(
    input RWDS_o,
    output RWDS_i,
    input RWDS_de,
    inout RWDS,
    input [7:0] DQ_o,
    output [7:0] DQ_i,
    input DQ_de,
    inout [7:0] DQ
    );

assign DQ = DQ_de?DQ_o:8'hZZ;
assign RWDS = RWDS_de?RWDS_o:1'bZ;
assign RWDS_i = RWDS;
assign DQ_i = DQ;

endmodule

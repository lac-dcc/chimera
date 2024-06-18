// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2023 12:24:08 PM
// Design Name: 
// Module Name: register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module register(clock, reset, d, q, ld);
    parameter XLEN = 32;
    parameter reset_val = 0;
    parameter sync_reset = "FALSE";
    
    input clock;
    input reset;
    input [XLEN-1:0] d;
    output[XLEN-1:0] q;
    input ld;
    
    reg [XLEN-1:0] q;

    generate
    if ( sync_reset == "TRUE" ) begin
        always @(posedge clock) begin
            if ( reset ) q <= reset_val;
            else if ( ld ) q <= d;
        end
    end else begin
        always @(posedge clock or posedge reset) begin
            if ( reset ) q <= reset_val;
            else if ( ld ) q <= d;
        end
    end
    endgenerate
endmodule

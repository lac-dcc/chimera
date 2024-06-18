// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/01/13 12:53:40
// Design Name: 
// Module Name: bypath
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


module bypath(
input wire [31:0]   reg_data,
input wire [31:0]   ex_mem_data,
input wire [31:0]   mem_wb_data,
input wire [1:0]    sel,
output wire [31:0]  out
    );
    
    /* the bypass is a 3-1 MUX */
    assign out = OUT(reg_data, ex_mem_data, mem_wb_data, sel);
    
    function [31:0] OUT;
    input [31:0]    a;
    input [31:0]    b;
    input [31:0]    c;
    input [1:0]     sel;
    begin
        case( sel )
        2'b00: OUT = a;
        2'b10: OUT = b;
        2'b01: OUT = c;
        default: OUT = a;
        endcase
    end
    endfunction
    
endmodule

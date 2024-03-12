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


module bypath2(
input wire [31:0]   reg_data,
input wire [31:0]   ex_mem_data,
input wire [31:0]   mem_wb_data,
input wire [31:0]   immediate,
input wire          ALUSrc_flag,
input wire [1:0]    sel,
output wire [31:0]  out
    );
    
    /* the bypass is a 3-1 MUX */
    assign out = OUT(reg_data, ex_mem_data, mem_wb_data, immediate, ALUSrc_flag, sel);
    
    function [31:0] OUT;
    input [31:0]    a;
    input [31:0]    b;
    input [31:0]    c;
    input [31:0]    d;
    input           flag;
    input [1:0]     sel;
    begin
       case(  {flag, sel})
        3'b100: OUT = d;
        3'b101: OUT = d;
        3'b110: OUT = d;
        3'b111: OUT = d;
        3'b000: OUT = a;
        3'b010: OUT = b;
        3'b001: OUT = c;
        default: OUT = a;
       endcase
    end
    endfunction
    
endmodule

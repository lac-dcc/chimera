`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 19:31:00
// Design Name: 
// Module Name: Mux2_32bits
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


module Mux2_32bits(
    input choice,
    input [31:0] in0,
    input [31:0] in1,
    output [31:0] out
    );
    
    assign out = (choice==0) ? in0 : in1;
    
endmodule

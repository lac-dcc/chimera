`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/12 16:59:42
// Design Name: 
// Module Name: Mux2_5bits
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


module Mux2_5bits(
    input choice,
    input [4:0] in0,
    input [4:0] in1,
    output [4:0] out
    );
    
    assign out = (choice==0) ? in0 : in1;
    
endmodule

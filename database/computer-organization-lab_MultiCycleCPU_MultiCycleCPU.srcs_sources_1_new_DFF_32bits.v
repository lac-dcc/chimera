`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/11 20:07:17
// Design Name: 
// Module Name: DFF_32bits
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


module DFF_32bits(
    input clk,
    input Reset,
    input [31:0] in,
    output reg [31:0] out
    );
    
    always @(posedge clk/* or negedge Reset*/) begin
        //if(Reset==0) out <= 0;
        /*else*/ out <= in;
    end
    
endmodule

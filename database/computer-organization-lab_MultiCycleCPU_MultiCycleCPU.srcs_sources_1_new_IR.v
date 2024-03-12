`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/13 16:52:35
// Design Name: 
// Module Name: IR
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


module IR(
    input clk,
    input IRWre,
    input [31:0] insIn,
    output reg [31:0] insOut
    );
    
    always @(negedge clk) begin
        /*if(IRWre==1)*/ insOut <= insIn;
       /* else insOut <= insOut;*/
    end
    
endmodule

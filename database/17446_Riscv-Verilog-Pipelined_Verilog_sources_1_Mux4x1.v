// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2024 03:43:28 PM
// Design Name: 
// Module Name: Mux4x1
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


module Mux4x1 #(parameter n=32)( input[n-1:0] a, b, x, y, input [1:0] s, output reg [n-1:0] c);

always @(*) begin
    case(s)
        2'b00: c = a;
        2'b01: c = b;   //Mem Hazard
        2'b10: c = x;   //Ex hazard
        2'b11: c = y;
    endcase
end

endmodule

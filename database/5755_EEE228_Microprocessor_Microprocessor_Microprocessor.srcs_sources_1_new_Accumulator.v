// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2024 15:10:22
// Design Name: 
// Module Name: Accumulator
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


module Accumulator(
    input reset,
    input [7:0] alu_result,
    output reg [7:0] acc=8'b0
);

always @(alu_result or posedge reset) begin
    if (reset) begin
        acc = 8'b0;
    end
    else begin
        acc = alu_result;
    end
end

endmodule


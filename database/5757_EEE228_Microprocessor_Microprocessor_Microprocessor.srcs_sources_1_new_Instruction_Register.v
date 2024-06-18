// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2024 16:11:16
// Design Name: 
// Module Name: Instruction_Register
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


module Instruction_Register(
    input [3:0] instructionIn,
    input update,
    output reg [3:0] instructionOut = 4'b1111
);

always @(update) begin
    instructionOut <= instructionIn;
end

endmodule


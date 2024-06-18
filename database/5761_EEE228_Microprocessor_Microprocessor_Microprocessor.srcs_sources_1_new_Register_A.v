// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2024 15:36:01
// Design Name: 
// Module Name: Register_A
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


module Register_A(
    input wire A0,
    input wire A1,
    input wire A2,
    input wire A3,
    input wire loadA,
    output reg [7:0] regA
);

always @(posedge loadA) begin
    regA[0] <= A0;
    regA[1] <= A1;
    regA[2] <= A2;
    regA[3] <= A3;
    regA[4] <= 0;
    regA[5] <= 0;
    regA[6] <= 0;
    regA[7] <= 0;
end

endmodule
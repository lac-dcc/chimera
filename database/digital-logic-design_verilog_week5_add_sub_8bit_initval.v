// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 10:55:05 PM
// Design Name: 
// Module Name: add_sub_8bit_initval
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


module add_sub_8bit_initval
(
input [7:0] in0_i,
input [7:0] in1_i,
input op_i,
input clk,
output [7:0] result_o
);

// only works on SRAM based FPGAs
reg [7:0] result = 8'b00000000;

always @(posedge clk) begin

    if (op_i == 1'b0) begin
        result <= in0_i + in1_i;
    end
    else begin
        result <= in0_i - in1_i;
    end        

end

assign result_o = result; 

endmodule
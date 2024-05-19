// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2022 12:09:14 AM
// Design Name: 
// Module Name: add_sub_8bit_sync
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


module add_sub_8bit_sync
(
input [7:0] in0_i,
input [7:0] in1_i,
input op_i,
input clk,
input rst_n,
output [7:0] result_o
);

reg [7:0] result;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        result <= 8'b00000000;
    end
    else begin
        if (op_i == 1'b0) begin
            result <= in0_i + in1_i;
        end
        else begin
            result <= in0_i - in1_i;
        end        
    end

end

assign result_o = result; 

endmodule
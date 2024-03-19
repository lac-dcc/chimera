`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2022 11:13:51 PM
// Design Name: 
// Module Name: add_sub_8bit
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


module add_sub_8bit
(
input [7:0] in0_i,
input [7:0] in1_i,
input op_i,
output [7:0] result_o
);

reg [7:0] result;

always @(in0_i, in1_i, op_i) begin
    if (op_i == 1'b0) begin
        result = in0_i + in1_i;
    end
    else begin
        result = in0_i - in1_i;
    end
end

assign result_o = result; 

endmodule
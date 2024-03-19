`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2022 12:06:59 AM
// Design Name: 
// Module Name: half_adder_behav
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


module half_adder_behav
(
input wire a_i,
input wire b_i,
output reg s_o,
output reg cout_o
);

always @(a_i,b_i) begin
    {cout_o,s_o} = a_i + b_i;
end

endmodule
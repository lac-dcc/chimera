`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 12:33:10 AM
// Design Name: 
// Module Name: reg4
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


module reg4
(
input [3:0] d_i,
input rst_n,
input clk,
output [3:0] q_o
);

reg [3:0] q;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        q <= 4'b0000;
    end
    else begin
        q <= d_i;
    end
end

assign q_o = q;

endmodule
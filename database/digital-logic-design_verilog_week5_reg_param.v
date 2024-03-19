`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2022 12:44:07 AM
// Design Name: 
// Module Name: reg_param
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


module reg_param
#(
parameter N=32
)
(
input [N-1:0] d_i,
input rst_n,
input clk,
output [N-1:0] q_o
);

reg [N-1:0] q;

always @(posedge clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        q <= {N{1'b0}};
    end
    else begin
        q <= d_i;
    end
end

assign q_o = q;

endmodule
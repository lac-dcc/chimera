`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 11:39:31 PM
// Design Name: 
// Module Name: d_ff_rst
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


module d_ff_rst
(
input d_i,
input rst_n,    // Active-low reset
input clk,
output q_o
);

reg q;

// always@(posedge clk) begin // Synchronous reset
always@(posedge clk, negedge rst_n) begin   // Asynchronous reset
    if (rst_n == 1'b0) begin
        q <= 1'b0;
    end
    else begin
        q <= d_i;    
    end    
end

assign q_o = q;

endmodule
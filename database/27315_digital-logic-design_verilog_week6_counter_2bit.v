// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2022 11:39:34 PM
// Design Name: 
// Module Name: counter_2bit
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


module counter_2bit
(
input clk,
input rst_n,
output [1:0] count_o
);

reg [1:0] count;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        count <= 2'b00;
    end else begin
        count <= count + 1;
    end
end

assign count_o = count;

endmodule
// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2022 11:14:26 PM
// Design Name: 
// Module Name: fsm_mealy_3always
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


module fsm_mealy_3always
(
input x_i,
input rst_n,
input clk,
output y_o
);

reg y;
reg A_reg, B_reg, A_next, B_next;

// always block #1 for assigning D to Q
always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        A_reg <= 1'b0;
        B_reg <= 1'b0;
    end
    else begin
        A_reg <= A_next;
        B_reg <= B_next;
    end
end

// always block #2 for evaluating next state
always @(*) begin
    A_next = (A_reg & x_i) | (B_reg & x_i);
    B_next = (!A_reg & x_i);
end

// always block #3 for evaluating output
always @(*) begin
    y = (A_reg | B_reg) & !x_i;
end

assign y_o = y;

endmodule
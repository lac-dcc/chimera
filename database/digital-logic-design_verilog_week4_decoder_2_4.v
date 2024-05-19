// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2022 11:35:31 PM
// Design Name: 
// Module Name: decoder_2_4
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


module decoder_2_4
(
input [1:0] a_i,
output [3:0] d_o
);


assign d_o =    (a_i == 2'b00) ? 4'b0001 :
                (a_i == 2'b01) ? 4'b0010 :
                (a_i == 2'b10) ? 4'b0100 :
                                 4'b1000;


endmodule
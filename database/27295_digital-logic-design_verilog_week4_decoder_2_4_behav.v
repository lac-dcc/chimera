// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2022 11:07:00 PM
// Design Name: 
// Module Name: decoder_2_4_behav
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


module decoder_2_4_behav
(
input [1:0] a_i,
output [3:0] d_o
);

reg [3:0] d;

always @(a_i) begin
    case (a_i)
        2'b00   : d = 4'b0001;  
        2'b01   : d = 4'b0010;  
        2'b10   : d = 4'b0100;  
        default : d = 4'b1000;
    endcase
end

assign d_o = d;

endmodule
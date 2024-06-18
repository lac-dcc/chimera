// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2022 11:41:56 PM
// Design Name: 
// Module Name: tb_decoder_2_4
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


module tb_decoder_2_4;

reg [1:0] a_i;
wire [3:0] d_o;

decoder_2_4 DUT
(
.a_i (a_i),
.d_o (d_o)
);

initial begin
a_i = 2'b00;
#10;
a_i = 2'b01;
#10;
a_i = 2'b10;
#10;
a_i = 2'b11;
#10;
$finish;
end

endmodule
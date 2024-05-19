// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2022 12:43:23 AM
// Design Name: 
// Module Name: ornek2
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


module ornek2
(
input x,
input y,
input z,
output F2
);

wire x_not;
wire y_not;
wire and1_out;
wire and2_out;
wire and3_out;

not G1 (x_not,x);
not G2 (y_not,y);
and G3 (and1_out,x_not,y_not,z);
and G4 (and2_out,x_not,y,z);
and G5 (and3_out,x,y_not);
or G6 (F2,and1_out,and2_out,and3_out);

endmodule
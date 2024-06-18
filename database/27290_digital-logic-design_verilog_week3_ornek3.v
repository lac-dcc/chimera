// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2022 12:49:57 AM
// Design Name: 
// Module Name: ornek3
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


module ornek3
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

not G1 (x_not,x);
not G2 (y_not,y);
and G3 (and1_out,x,y_not);
and G4 (and2_out,x_not,z);
or G5 (F2,and1_out,and2_out);

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2022 12:25:23 AM
// Design Name: 
// Module Name: ornek1
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


module ornek1
(
input x,
input y,
input z,
output F1
);

wire y_not;
wire y_not_and_z;

not G1 (y_not,y);
and G2 (y_not_and_z,y_not,z);
or G3 (F1,x,y_not_and_z);

endmodule
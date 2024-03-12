`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/25 00:04:48
// Design Name: 
// Module Name: JOIN
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


module JOIN(
input [27:0] a,
input [3:0] b,
output [31:0] s
    );
    assign s[31:28]=b;
    assign s[27:0]=a;
endmodule
 

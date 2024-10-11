// This program was cloned from: https://github.com/lvyitian/public_personal_files
// License: Creative Commons Zero v1.0 Universal

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 12:27:21 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
input in0,
input in1,
input c,
output out,
output co
    );
    assign out=in0 ^ in1 ^ c;
    assign co=in0 & in1 | in0 & c | in1 & c;
endmodule

// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 10:01:44 AM
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(value, extended);
    parameter VLEN = 12;
    parameter XLEN = 32;
    
    input [VLEN - 1:0] value;
    output[XLEN - 1:0] extended;
    
    assign extended = {{XLEN - VLEN{value[VLEN - 1]}}, value};
endmodule

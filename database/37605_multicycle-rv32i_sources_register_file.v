// This program was cloned from: https://github.com/jrbuchanan02/multicycle-rv32i
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2023 01:30:12 PM
// Design Name: 
// Module Name: register_file
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


module register_file(clock, reset, reg_w, reg_1, reg_2, write, wdata, rs1, rs2);
    parameter XLEN = 32;
    
    input clock;
    input reset;
    input [4:0] reg_w;
    input [4:0] reg_1;
    input [4:0] reg_2;
    input write;
    input [XLEN-1:0] wdata;
    output[XLEN-1:0] rs1, rs2;
    
    reg [XLEN-1:0] registers[31:1];
    always @(posedge clock) begin
        if ( write ) registers[reg_w] <= wdata;
    end
    
    assign rs1 = reg_1 == 0 ? 0 : registers[reg_1];
    assign rs2 = reg_2 == 0 ? 0 : registers[reg_2];
endmodule

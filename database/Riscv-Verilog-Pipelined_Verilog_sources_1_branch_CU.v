// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 01:14:13 AM
// Design Name: 
// Module Name: branch_CU
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


module branch_CU (
    input [2:0] branch_type,
    input branch, cf, zf, sf,
    output reg branch_condition

);

reg beq, bne, blt, bge, bltu, bgeu;

    
always @ (*) begin
beq =  branch & (branch_type == 3'b000) & zf;
bne =  branch & (branch_type == 3'b001) & ~zf;
blt =  branch & (branch_type == 3'b100) & sf;
bge =  branch & (branch_type == 3'b101) & ~sf;
bltu = branch & (branch_type == 3'b110) & ~cf;
bgeu = branch & (branch_type == 3'b111) & cf;

case(branch_type)
    3'b000: branch_condition = beq;
    3'b001: branch_condition = bne;
    3'b100: branch_condition = blt;
    3'b101: branch_condition = bge;
    3'b110: branch_condition = bltu;
    3'b111: branch_condition = bgeu;
    default: branch_condition = 0;

endcase


end





endmodule

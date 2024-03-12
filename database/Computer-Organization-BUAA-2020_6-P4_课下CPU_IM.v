`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:28 11/17/2020 
// Design Name: 
// Module Name:    IM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define IMSIZE 1024

module IM(
    input [31:0] PC,
    output [31:0] instr
    );
	reg[31:0] ImMem[ `IMSIZE -1:0];
	integer i;
	initial begin
		for (i = 0; i < `IMSIZE; i = i + 1) begin
			ImMem[i] = 32'h0;
		end
		$readmemh("code.txt", ImMem);
	end
	
	assign instr = ImMem[PC[11:2]];


endmodule

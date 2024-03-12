`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:01 11/23/2018 
// Design Name: 
// Module Name:    im 
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
module im(
    input [31:0] PC,
    output[31:0] instruction
    );

	reg[31:0] im[0:4095];
	initial begin
		$readmemh("code.txt",im); 
		$readmemh("code_handler.txt",im,1120,2047);
	end
	
	wire[31:0] pc=PC-32'h00003000;
	assign instruction = im[pc[13:2]];
	
endmodule

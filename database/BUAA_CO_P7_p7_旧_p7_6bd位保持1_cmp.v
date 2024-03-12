`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:38 11/23/2018 
// Design Name: 
// Module Name:    cmp 
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
module cmp(
    input [31:0] D1,
    input [31:0] D2,
    output Equal,
	 output more,
	 output less
    );

	assign Equal = (D1==D2) ? 1'b1 : 1'b0;
	assign more = ($signed(D1)>0) ? 1'b1 : 1'b0;
	assign less = ($signed(D1)<0) ? 1'b1 : 1'b0;
	
endmodule

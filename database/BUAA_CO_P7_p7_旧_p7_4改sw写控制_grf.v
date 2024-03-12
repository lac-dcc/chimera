`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:24 11/23/2018 
// Design Name: 
// Module Name:    grf 
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
module grf(
    input clk,
    input reset,
	 input RegWrite,
    input [4:0] RA1,
    input [4:0] RA2,
    input [4:0] WA,
    input [31:0] WD,
	 input [31:0] PC,
    output [31:0] RD1,
    output [31:0] RD2
    );

	reg[31:0] register[31:0];
	integer i;
	initial begin
		for(i=0;i<32;i=i+1) begin
			register[i] <= 0;
		end
	end
	
	assign RD1 = register[RA1];
	assign RD2 = register[RA2];

	always@(posedge clk) begin
		if(reset) begin
			for(i=0;i<32;i=i+1) begin
				register[i] <= 0;
			end
		end
		else begin
			if(RegWrite&&WA!=5'b00000) begin 
				register[WA] <= WD;
				//$display("@%h: $%d <= %h", PC, WA,WD);
				$display("%d@%h: $%d <= %h",$time,PC,WA,WD);
			end
		end
	end
endmodule

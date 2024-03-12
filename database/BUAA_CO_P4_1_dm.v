`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:15 11/15/2018 
// Design Name: 
// Module Name:    dm 
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
module dm(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] MemAddr,
    input [31:0] WD,
	 input [31:0] PC,
    output [31:0] RD
    );

	reg[31:0] dm[0:1023];
	integer i;
	initial begin
		for(i=0;i<1024;i=i+1) begin  //1024
			dm[i]<=0;
		end
	end
	
	assign RD = MemRead ? dm[MemAddr[11:2]] : 0;
	
	always@(posedge clk) begin
		if(reset) begin
			for(i=0;i<1024;i=i+1) begin//1024
				dm[i]<=0;
			end
		end
		else begin
			if(MemWrite) begin
				dm[MemAddr[11:2]] <= WD;
				$display("@%h: *%h <= %h",PC, MemAddr,WD);
			end
		end
	end
endmodule

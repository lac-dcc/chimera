`timescale 1ns / 1ps

module PC(clk,reset,stall,IRQ,eret_M,NPC,PC);
//interface
	input clk;
	input reset;
	input stall;
	input IRQ;
	input eret_M;
	
	input [31:0] NPC;
	
	output reg [31:0] PC;

//initial address
	parameter init_addr=32'h0000_3000,
			  exc_handler_addr=32'h0000_4180;

	/*
	initial
		begin
			PC=init_addr;
		end
	*/
		
	always @(posedge clk)
		begin
			if(reset)PC<=init_addr;
			else if(eret_M)PC<=NPC;
			else if(IRQ)PC<=exc_handler_addr;
			else if(stall)PC<=PC;
			else PC<=NPC;
		end
	
endmodule

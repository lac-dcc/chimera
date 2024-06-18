// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`timescale 1ns / 1ps

module RF(clk,reset,RFWe,Ins,A3,RF_WD,WPC,RD1,RD2);
//interface
	input clk;
	input reset;
	
	input RFWe;
	
	input [31:0] Ins;
	input [4:0] A3;
	input [31:0] RF_WD;
	
	input [31:0] WPC;
	
	output [31:0] RD1;
	output [31:0] RD2;

//sequential logic
	reg [31:0] RFMem[0:31];
	
	wire [4:0] A1,A2;

	integer i;
	
	/*
	initial
		begin
			i=0;
			while(i<32)
				begin
					RFMem[i]=0;	//RFMem can be modified inside function
					i=i+1;
				end
		end
	*/

	assign A1=Ins[25:21],
		   A2=Ins[20:16];
	
	assign RD1=RFMem[A1];
	assign RD2=RFMem[A2];

	always @(posedge clk)
		begin
			RFMem[A3]<=RFMem[A3];
			if(reset)
				begin
					i=0;
					while(i<32)
						begin
							RFMem[i]<=0;	//RFMem can be modified inside function
							i=i+1;
						end
				end
			else if(RFWe&&A3!=0)
				begin
					RFMem[A3]<=RF_WD;
					//$display("%d@%h: $%d <= %h", $time, WPC, A3,RF_WD);
				end
		end
		
endmodule

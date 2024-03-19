`timescale 1ns / 1ps
module HazardDetector(MemRead_MEM,Rs_ID,Rt_ID,Rt_EX,Stall,Reset);
	input MemRead_MEM,Reset;
	input [4:0] Rs_ID,Rt_ID,Rt_EX;
	output Stall;
	reg Stall;
	
	always @(MemRead_MEM,Rs_ID,Rt_ID,Rt_EX,Reset) begin
		if (Reset == 0) begin
			if (MemRead_MEM == 1 && (Rs_ID == Rt_EX || Rt_ID == Rt_EX)) begin // hazard detected
				Stall <= 1;
			end else begin // hazard not detected
				Stall <= 0;
			end
		end else begin
			Stall <= 1;
		end
	end
	
	
endmodule
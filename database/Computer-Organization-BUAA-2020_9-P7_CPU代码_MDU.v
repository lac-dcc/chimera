`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:20:19 12/14/2020 
// Design Name: 
// Module Name:    MDU 
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
`define MULU	3'b000
`define MUL		3'b001
`define DIVU	3'b010
`define DIV		3'b011


module MDU(
    input clk,
    input reset,
	input IntReq,
	
    input [31:0] A,
    input [31:0] B,
	
    input start,
	
    input [2:0] MDUOp,
    input HIWrite,
    input LOWrite,
	
    output reg [31:0] HI,
    output reg [31:0] LO,
    output busy	// tell hzd busy here
    );
	
	reg [31:0] HITmp, LOTmp;
	reg [3:0] cnt;
	
	always @(posedge clk) begin
		if(reset) begin
			HI = 0;
			LO = 0;
			HITmp = 0;
			LOTmp = 0;
			cnt = 0;
		end
		else if(start) begin
			case (MDUOp)
				`MULU : begin
					{HITmp, LOTmp} <= A * B;
					cnt <= 5;
				end
				`MUL : begin
					{HITmp, LOTmp} <= $signed(A) * $signed(B);
					cnt <= 5;
				end
				`DIVU : begin
					LOTmp <= A / B;
					HITmp <= A % B;
					cnt <= 10;
				end
				`DIV : begin
					LOTmp <= $signed(A) / $signed(B);
					HITmp <= $signed(A) % $signed(B);
					cnt <= 10;
				end
			endcase
		end
		else if(HIWrite) HI <= A;
		else if(LOWrite) LO <= A;
		if(reset == 0 && start == 0 && cnt != 0) cnt <= cnt -1;
	end
	assign busy = (cnt != 0);
	
	always@(negedge busy) begin
		HI <= HITmp;
		LO <= LOTmp;
	end

endmodule

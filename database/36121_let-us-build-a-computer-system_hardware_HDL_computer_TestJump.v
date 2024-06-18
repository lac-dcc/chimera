// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:47:52 08/22/2023
// Design Name:   hCPU
// Module Name:   /home/ise/HDL/computer/TestJump.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestJump;
	localparam T = 20;

	// Inputs
	reg [15:0] inM;
	reg [15:0] instruction;
	reg reset;
	reg clock;

	// Outputs
	wire [15:0] outM;
	wire writeM;
	wire [15:0] addressM;
	wire [15:0] pc;

	// Instantiate the Unit Under Test (UUT)
	hCPU uut (
		.inM(inM), 
		.instruction(instruction), 
		.reset(reset), 
		.clock(clock), 
		.outM(outM), 
		.writeM(writeM), 
		.addressM(addressM), 
		.pc(pc)
	);
	
	
	
	always begin
		clock = 1'b0;
		#(T/2);
		
		clock = 1'b1;
		#(T/2);
	end

	initial begin
		// Initialize Inputs
		inM = 0;
		instruction = 16'b1110101010111000;
		reset = 1;

		@(negedge clock);
		
		// no jump
		inM = 16'b0000000011111111;
		instruction = 16'b1111110000000000;
		
		@(negedge clock);
		if (pc != 16'b1) begin
			$display("no jump fail.");
			$finish;
		end
		
		// JGT > 0
		inM = 16'b0000000000000111;
		instruction = 16'b1111110000100001;
		
		@(negedge clock);
		if (pc != 16'b111) begin
			$display("JGT test fail.");
			$finish;
		end
		
		// JGT = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100001;
		
		@(negedge clock);
		if (pc != 16'b1000) begin
			$display("JGT test fail.");
			$finish;
		end
		
		// JGT < 0
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100001;
		
		@(negedge clock);
		if (pc != 16'b1001) begin
			$display("JGT test fail.");
			$finish;
		end
		
		// JEQ > 0
		inM = 16'b0000000000000001;
		instruction = 16'b1111110000100010;
		
		@(negedge clock);
		if (pc != 16'b1010) begin
			$display("JEQ test fail.");
			$finish;
		end
		
		// JEQ = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100010;
		
		@(negedge clock);
		if (pc != 16'b0) begin
			$display("JEQ test fail.");
			$finish;
		end
		
		// JEQ < 0
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100010;
		
		@(negedge clock);
		if (pc != 16'b1) begin
			$display("JEQ test fail.");
			$finish;
		end
		
		// JGE > 0
		inM = 16'b0000000000000001;
		instruction = 16'b1111110000100011;
		
		@(negedge clock);
		if (pc != 16'b1) begin
			$display("JGE test fail.");
			$finish;
		end
		
		// JGE = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100011;
		
		@(negedge clock);
		if (pc != 16'b0) begin
			$display("JGE test fail.");
			$finish;
		end
		
		// JGE < 0 
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100011;
		
		@(negedge clock);
		if (pc != 16'b1) begin
			$display("JGE test fail.");
			$finish;
		end
		
		// JLT > 0
		inM = 16'b0000000000000001;
		instruction = 16'b1111110000100100;
		
		@(negedge clock);
		if (pc != 16'b10) begin
			$display("JLT test fail.");
			$finish;
		end
		
		// JLT = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100100;
		
		@(negedge clock);
		if (pc != 16'b11) begin
			$display("JLT test fail.");
			$finish;
		end
		
		// JLT < 0
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100100;
		
		@(negedge clock);
		if (pc != 16'b1000000000000000) begin
			$display("JLT test fail.");
			$finish;
		end
		
		// JNE > 0
		inM = 16'b0000000000000001;
		instruction = 16'b1111110000100101;
		
		@(negedge clock);
		if (pc != 16'b1) begin
			$display("JNE test fail.");
			$finish;
		end
		
		// JNE = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100101;
		
		@(negedge clock);
		if (pc != 16'b10) begin
			$display("JNE test fail.");
			$finish;
		end
		
		// JNE < 0
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100101;
		
		@(negedge clock);
		if (pc != 16'b1000000000000000) begin
			$display("JNE test fail.");
			$finish;
		end
		
		// JLE > 0
		inM = 16'b0000000000000001;
		instruction = 16'b1111110000100110;
		
		@(negedge clock);
		if (pc != 16'b1000000000000001) begin
			$display("JLE test fail.");
			$finish;
		end
		
		// JLE = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100110;
		
		@(negedge clock);
		if (pc != 16'b0) begin
			$display("JLE test fail.");
			$finish;
		end
		
		// JLE < 0
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100110;
		
		@(negedge clock);
		if (pc != 16'b1000000000000000) begin
			$display("JLE test fail.");
			$finish;
		end
		
		// JMP > 0
		inM = 16'b0000000000000001;
		instruction = 16'b1111110000100111;
		
		@(negedge clock);
		if (pc != 16'b1) begin
			$display("JMP test fail.");
			$finish;
		end
		
		// JMP = 0
		inM = 16'b0000000000000000;
		instruction = 16'b1111110000100111;
		
		@(negedge clock);
		if (pc != 16'b0) begin
			$display("JMP test fail.");
			$finish;
		end
		
		// JMP < 0
		inM = 16'b1000000000000000;
		instruction = 16'b1111110000100111;
		
		@(negedge clock);
		if (pc != 16'b1000000000000000) begin
			$display("JMP test fail.");
			$finish;
		end
	end
      
endmodule


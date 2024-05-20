// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hCPU.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:43:39 08/16/2023
// Design Name:   hCPU
// Module Name:   /home/ise/HDL/computer/TesthCPU.v
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

module TesthCPU;
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
		// test 0
		inM = 16'b1;
		instruction = 16'b1110101010111000;
		reset = 1;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test 0 fail.");
			$finish;
		end
		
		// test 1
		inM = 16'b0;
		instruction = 16'b1110111111111000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test 1 fail.");
			$finish;
		end
		
		// test -1
		inM = 16'b0;
		instruction = 16'b1110111010111000;
		reset = 0;
		
		@(negedge clock);
		if (!(outM == 16'b1111111111111111 && writeM == 16'b1)) begin
			$display("test -1 fail.");
			$finish;
		end
		
		// test D
		inM = 16'b0;
		instruction = 16'b1110001100111000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1111111111111111 && writeM == 16'b1)) begin
			$display("test D fail.");
			$finish;
		end
		
		// test A
		inM = 16'b0;
		instruction = 16'b1110110000111000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1111111111111111 && writeM == 16'b1)) begin
			$display("test A fail.");
			$finish;
		end
		
		// test !D
		inM = 16'b0;
		instruction = 16'b1110001101001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test !D fail.");
			$finish;
		end
		
		// test !A
		inM = 16'b0;
		instruction = 16'b1110110001001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test !D fail.");
			$finish;
		end
		
		// test -D
		inM = 16'b0;
		instruction = 16'b1110001111011000;
		reset =0;
		@(negedge clock);
		
		// test D
		inM = 16'b0;
		instruction = 16'b1110001100001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test -D fail.");
			$finish;
		end
		
		// test -A
		inM = 16'b0;
		instruction = 16'b1110110011101000;
		reset =0;
		@(negedge clock);
		
		// test A
		inM = 16'b0;
		instruction = 16'b1110110000001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test -A fail.");
			$finish;
		end
		
		// test D+1
		inM = 16'b0;
		instruction = 16'b1110011111011000;
		reset =0;
		@(negedge clock);
		
		// test D
		inM = 16'b0;
		instruction = 16'b1110001100001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b10 && writeM == 16'b1)) begin
			$display("test D+1 fail.");
			$finish;
		end
		
		// test A+1
		inM = 16'b0;
		instruction = 16'b1110110111101000;
		reset =0;
		@(negedge clock);
		
		// test A
		inM = 16'b0;
		instruction = 16'b1110110000001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b10 && writeM == 16'b1)) begin
			$display("test A+1 fail.");
			$finish;
		end
		
		// test D - 1
		inM = 16'b0;
		instruction = 16'b1110001110011000;
		reset =0;
		@(negedge clock);
		
		// test D
		inM = 16'b0;
		instruction = 16'b1110001100001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test D-1 fail.");
			$finish;
		end
		
		// test A - 1
		inM = 16'b0;
		instruction = 16'b1110110010101000;
		reset =0;
		@(negedge clock);
		
		// test A
		inM = 16'b0;
		instruction = 16'b1110110000001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test A-1 fail.");
			$finish;
		end
		
		// test D + A
		inM = 16'b0;
		instruction = 16'b1110000010001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b10 && writeM == 16'b1)) begin
			$display("test D+A fail.");
			$finish;
		end
		
		// test D - A
		inM = 16'b0;
		instruction = 16'b1110010011001000;
		reset =0;
		@(negedge clock);
		
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test D-A fail.");
			$finish;
		end
		
		// test A - D
		inM = 16'b0;
		instruction = 16'b1110000111001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test A-D fail.");
			$finish;
		end
		
		// test D & A
		inM = 16'b0;
		instruction = 16'b1110000000001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test D&A fail.");
			$finish;
		end
		
		// test D | A
		inM = 16'b0;
		instruction = 16'b1110010101001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test D|A fail.");
			$finish;
		end
		
		// test M
		inM = 16'b100;
		instruction = 16'b1111110000001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b100 && writeM == 16'b1)) begin
			$display("test M fail.");
			$finish;
		end
		
		// test !M
		inM = 16'b100;
		instruction = 16'b1111110001001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1111111111111011 && writeM == 16'b1)) begin
			$display("test !M fail.");
			$finish;
		end
		
		// test -M
		inM = 16'b1111111111111111;
		instruction = 16'b1111110011001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test -M fail.");
			$finish;
		end
		
		// test M + 1
		inM = 16'b1;
		instruction = 16'b1111110111001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b10 && writeM == 16'b1)) begin
			$display("test M+1 fail.");
			$finish;
		end
		
		// test M - 1
		inM = 16'b1;
		instruction = 16'b1111110010001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test M-1 fail.");
			$finish;
		end
		
		// test D+M
		inM = 16'b1;
		instruction = 16'b1111000010001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b10 && writeM == 16'b1)) begin
			$display("test D+M fail.");
			$finish;
		end
		
		// test D-M
		inM = 16'b1;
		instruction = 16'b1111010011001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test D-M fail.");
			$finish;
		end
		
		// test M-D
		inM = 16'b1;
		instruction = 16'b1111000111001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b0 && writeM == 16'b1)) begin
			$display("test M-D fail.");
			$finish;
		end
		
		// test D&M
		inM = 16'b1;
		instruction = 16'b1111000000001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test D&A fail.");
			$finish;
		end
		
		// test D|M
		inM = 16'b1;
		instruction = 16'b1111010101001000;
		reset =0;
		
		@(negedge clock);
		if (!(outM == 16'b1 && writeM == 16'b1)) begin
			$display("test D|A fail.");
			$finish;
		end
	end
endmodule


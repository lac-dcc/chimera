// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:22:34 08/16/2023
// Design Name:   hPC
// Module Name:   /home/ise/HDL/sequential-logic/TesthPC.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hPC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthPC;
	localparam T = 20;

	// Inputs
	reg [15:0] in;
	reg load;
	reg inc;
	reg reset;
	reg clock;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hPC uut (
		.in(in), 
		.load(load), 
		.inc(inc), 
		.reset(reset), 
		.clock(clock), 
		.out(out)
	);
	
	always begin
		clock = 1'b1;
		#(T/2);
		
		clock = 1'b0;
		#(T/2);
	end

	initial begin
		// case 1
		in = 0;
		load = 0;
		inc = 0;
		reset = 0;
		
		@(negedge clock);
		if (out != 0) begin
			$display("Test case 1 fail.");
			$finish;
		end
	
		// case 2
		in = 1;
		load = 1;
		inc = 0;
		reset = 0;
		
		@(negedge clock);
		if (out != 1) begin
			$display("Test case 2 fail.");
			$finish;
		end
		
		// case 3
		in = 0;
		load = 0;
		inc = 1;
		reset = 0;
		@(negedge clock);
		if (out != 2'b10) begin
			$display("Test case 3 fail.");
			$finish;
		end
		
		// case 4
		in = 0;
		load = 0;
		inc = 0;
		reset = 1;
		@(negedge clock);
		if (out != 0) begin 
			$display("Test case 4 fail.");
			$finish;
		end
		
		$display("Test cases all success.");
	end
      
endmodule


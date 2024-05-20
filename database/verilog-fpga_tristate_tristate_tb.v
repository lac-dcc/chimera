// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240414

`timescale 1ns/1ns

`default_nettype none
module TriState_tb();
	
	// Variables
	reg In;
	reg Enable;
	wire Out;
	
	// Variable dump
	initial begin
		$dumpfile("tristate.vcd");
		$dumpvars(0, TriState_tb);
	end
	
	// Instantiate device under test
	TriState DUT(
		.DataIn(In),
		.OutputEnable(Enable),
		.DataOut(Out)
	);
	
	// Test sequence
	initial begin
		$display("===== START =====");
		
		#10;
		In     = 0;
		Enable = 0;
		
		#10;
		In     = 0;
		Enable = 1;
		
		#10;
		In     = 1;
		Enable = 1;
		
		#10;
		In     = 0;
		Enable = 1;
		
		#10;
		In     = 1;
		Enable = 1;
		
		#10;
		In     = 1;
		Enable = 0;
		
		#10;
		In     = 0;
		Enable = 0;
		
		#10;
		
		$display("====== END ======");
		$finish;
	end

endmodule

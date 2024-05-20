// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240414

`timescale 1ns/1ns

`default_nettype none
module top_tb();
	
	// Variables
	reg In;
	reg Enable;
	wire Out;
	
	// Variable dump
	initial begin
		$dumpfile("top.vcd");
		$dumpvars(0, top_tb);
	end
	
	// Instantiate device under test	
	top DUT(
		.TopIn(In),
		.TopEnable(Enable),
		.TopOut(Out)
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

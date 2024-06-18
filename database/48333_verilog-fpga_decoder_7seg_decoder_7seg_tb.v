// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns	// time-unit, precision

`default_nettype none
module Decoder7seg_tb();
	
	// Signals
	reg				Enable = 1'b0;
	reg		[3:0]	Data;
	wire	[6:0]	Segments;
	integer			i;
	
	// Variable dump
	initial begin
		$dumpfile("decoder_7seg.vcd");
		$dumpvars(0, DUT);
	end
	
	// Test sequence
	initial begin
		$timeformat(-9, 3, "ns", 10);
		$display("===== START =====");
		$display("      Time  i Data Segments");
		$monitor("%t %2d %b %b", $realtime, i, Data, Segments);
		
		#5 Enable <= 1'b1;
		for(i=0; i<=15; i=i+1) begin
			#1; Data <= i;
		end
		#5 Enable <= 1'b0;
		
		#5 $display("====== END ======");
		$finish;
	end
	
	// Instantiate device under test
	Decoder7seg #(
		.COMMON_CATHODE(1)
	) DUT(
		.Enable_i(Enable),
		.Data_i(Data),
		.Segments_o(Segments)
	);

endmodule

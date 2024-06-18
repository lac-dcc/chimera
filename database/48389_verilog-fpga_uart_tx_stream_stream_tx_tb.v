// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns  // time-unit, precision

`default_nettype none
module StreamTx_tb();

	parameter CLOCK_HZ	          = 1_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset  = 1'b0;
	reg Button = 1'b0;
	wire Tx;
	
	// Instantiate device under test
	StreamTx #(
		.CLOCK_HZ(CLOCK_HZ)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Button_i(Button),
		.Busy_o(),
		.Tx_o(Tx)
	);
	
	// Variable dump
	initial begin
		$dumpfile("stream_tx.vcd");
		$dumpvars(0, StreamTx_tb);
	end

	// Test sequence
	integer i;
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		
		@(posedge Clock);
		Reset <= 1'b1;
		repeat(10) @(posedge Clock);
		
		Button <= 1'b1;
		@(posedge Clock);
		Button <= 1'b0;
		repeat(500) @(posedge Clock);
		
		Button <= 1'b1;
		@(posedge Clock);
		Button <= 1'b0;
		repeat(500) @(posedge Clock);

		
		$display("====== END ======");
		$finish;
	end

endmodule
`default_nettype wire

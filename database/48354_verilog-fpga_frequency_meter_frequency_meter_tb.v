// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231124

`timescale 1ns/1ns

`default_nettype none
module FrequencyMeter_tb();
	
	// Configuration
	parameter CLOCK_HZ       = 2_000_000;
	parameter TEST_SIGNAL_HZ = 123456;
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#(1_000_000_000.0 / (2 * CLOCK_HZ));
		Clock = !Clock;
	end
	
	// Test signal generator
	reg TestSignal = 1'b0;
	always begin
		#(1_000_000_000.0 / (2 * TEST_SIGNAL_HZ));
		TestSignal = !TestSignal;
	end
	
	// Variable dump
	initial begin
		$dumpfile("frequency_meter.vcd");
		$dumpvars(0, FrequencyMeter_tb);
	end
	
	// Instantiate device under test
	FrequencyMeter #(
		.CLOCK_HZ(CLOCK_HZ)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.SignalAsync_i(TestSignal),
		.Cathodes_o(),
		.Segments_o()
	);
	
	reg Reset = 0;
	
	// Test sequence
	initial begin
		$timeformat(-9, 3, "ns", 10);
		$display("===== START =====");
		$display("Test freq: %0d", TEST_SIGNAL_HZ);
		
		@(posedge Clock);
		Reset = 1'b1;
		
		@(posedge DUT.DoubleDabble_inst.Done_o)
		
		repeat(100)
			@(posedge Clock);
		
		$display("Result:    %0H", DUT.Decimal);
		
		$display("====== END ======");
		$finish;
	end

endmodule

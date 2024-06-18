// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230722

`timescale 1ns/1ns	// time-unit, precision
`default_nettype none
module DisplayMultiplex_tb();

	parameter CLOCK_HZ       = 10_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	parameter DIGITS = 8;
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Signals
	reg						Reset			= 1'b0;
	reg		[4*DIGITS-1:0]	Data			= 'h0000BEEF;	// Change displayed number here
	reg		[  DIGITS-1:0]	DecimalPoints	= 'b00000001;
	wire	[  DIGITS-1:0]	Cathodes;
	wire	[         7:0]	Segments;
	
	// Instantiate device under test
	DisplayMultiplex #(
		.CLOCK_HZ(CLOCK_HZ),
		.SWITCH_PERIOD_US(1),
		.DIGITS(DIGITS)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Data_i(Data),
		.DecimalPoints_i(DecimalPoints),
		.Cathodes_o(Cathodes),
		.Segments_o(Segments)
	);
	
	// Variable dump
	wire SegmentDecimal = DUT.DecimalPoints_i[DUT.Selector];
	initial begin
		$dumpfile("display_multiplex.vcd");
		$dumpvars(0, DisplayMultiplex_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 0, "us", 10);
		$display("===== START =====");
		$display("CLOCK_HZ = %9d", DUT.CLOCK_HZ);
		$display("DELAY    = %9d", DUT.StrobeGenerator0.DELAY);
		$display("WIDTH    = %9d", DUT.StrobeGenerator0.WIDTH);
		$display("Data     =  %H", Data);
		
		#10 Reset = 1'b1; #9;
		
		$display("      time\tSel\tData\tVisible");
		repeat(20) begin
			@(posedge DUT.SwitchCathode_o);
			$display("%t\t%d\t%H\t%d", 
				$realtime, 
				DUT.Selector, 
				DUT.TempData, 
				DUT.Enable
			);
		end
		
		#100;
		
		$display("====== END ======");
		#1 $finish;
	end

endmodule
`default_nettype wire

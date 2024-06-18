// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230419

`timescale 1ns/1ns	// time-unit, precision
`default_nettype none

module LCD_tb();
	
	parameter CLOCK_HZ	= 1_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg        Reset  = 1'b0;
	reg  [7:0] Digit3 = 8'b00000000;
	reg  [7:0] Digit2 = 8'b00000000;
	reg  [7:0] Digit1 = 8'b00010000;
	reg  [7:0] Digit0 = 8'b00000000;
	wire [3:0] ComPWM;
	wire [7:0] SegPWM;
	
	// Instantiate device under test
	LCD #(
		.CLOCK_HZ(CLOCK_HZ),
		.CHANGE_COM_US(50)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Digit3_i(Digit3),
		.Digit2_i(Digit2),
		.Digit1_i(Digit1),
		.Digit0_i(Digit0),
		.ComPWM_o(ComPWM),
		.SegPWM_o(SegPWM)
	);
	
	// Variable dump
	initial begin
		$dumpfile("lcd.vcd");
		$dumpvars(0, LCD_tb);
		$dumpvars(2, DUT.ComAnalog[0]);
		$dumpvars(2, DUT.ComAnalog[1]);
		$dumpvars(2, DUT.ComAnalog[2]);
		$dumpvars(2, DUT.ComAnalog[3]);
		$dumpvars(2, DUT.SegAnalog[0]);
		$dumpvars(2, DUT.SegAnalog[1]);
		$dumpvars(2, DUT.SegAnalog[2]);
		$dumpvars(2, DUT.SegAnalog[3]);
		$dumpvars(2, DUT.SegAnalog[4]);
		$dumpvars(2, DUT.SegAnalog[5]);
		$dumpvars(2, DUT.SegAnalog[6]);
		$dumpvars(2, DUT.SegAnalog[7]);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		$display("CLOCK_HZ = %9d", CLOCK_HZ);

		#1 Reset = 1'b1;

		$display("      time C0 C1 C2 C3 S0 S1 S2 S3 S4 S5 S6 S7");	
		$monitor("%t  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d  %d", 
				$realtime, 
				DUT.ComAnalog[0],
				DUT.ComAnalog[1],
				DUT.ComAnalog[2],
				DUT.ComAnalog[3],
				DUT.SegAnalog[0],
				DUT.SegAnalog[1],
				DUT.SegAnalog[2],
				DUT.SegAnalog[3],
				DUT.SegAnalog[4],
				DUT.SegAnalog[5],
				DUT.SegAnalog[6],
				DUT.SegAnalog[7],
			);

		// Wait through all eight states
		repeat(8) begin
			@(posedge DUT.ChangeState);
		end
		
		#1 $display("===== END =====");
		#1 $finish;
	end

endmodule
`default_nettype wire

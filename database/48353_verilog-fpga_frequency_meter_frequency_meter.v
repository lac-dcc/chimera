// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240205

`default_nettype none

module FrequencyMeter #(
	parameter CLOCK_HZ = 25_000_000
)(
	input wire Clock,				// Pin 20
	input wire Reset,				// Pin 17
	input wire SignalAsync_i,		// Pin 75
	output wire [7:0] Cathodes_o,	// Pin 40 41 42 43 45 47 51 52
	output wire [7:0] Segments_o	// Pin 39 38 37 36 35 34 30 29
);

	// Synchronize the signal with FPGA clock domain
	wire SignalSync;
	
	Synchronizer #(
		.WIDTH(1)
	) Synchronizer_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Async_i(SignalAsync_i),
		.Sync_o(SignalSync)
	);
	
	// Detect rising edge of the signal
	wire SignalEdge;
	
	EdgeDetector EdgeDetector_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Signal_i(SignalSync),
		.RisingEdge_o(SignalEdge),
		.FallingEdge_o()
	);
	
	// Measure 1 second period
	wire OneSecondStrobe;
	
	StrobeGenerator #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(1_000_000)
	) StrobeGenerator_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(1'b1),
		.Strobe_o(OneSecondStrobe)
	);
	
	// Counter to count detected edges in 1 second periods
	reg [25:0] Counter;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			Counter <= 0;
		else if(OneSecondStrobe)
			Counter <= 0;
		else if(SignalEdge)
			Counter <= Counter + 1'b1;
	end
	
	// Convert counter value to BCD code
	wire [31:0] Decimal;
	
	DoubleDabble #(
		.INPUT_BITS(26),
		.OUTPUT_DIGITS(8)
	) DoubleDabble_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(OneSecondStrobe),
		.Busy_o(),
		.Done_o(),
		.Binary_i(Counter),
		.BCD_o(Decimal)
	);
	
	// Display instance
	DisplayMultiplex #(
		.CLOCK_HZ(CLOCK_HZ),
		.SWITCH_PERIOD_US(1000),
		.DIGITS(8)
	) DisplayMultiplex_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Data_i(Decimal),
		.DecimalPoints_i(8'b00000000),
		.Cathodes_o(Cathodes_o),
		.Segments_o(Segments_o),
		.SwitchCathode_o()
	);	
	
endmodule

`default_nettype wire

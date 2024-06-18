// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231225

`default_nettype none

module top #(
	parameter CLOCK_HZ = 25_000_000
)(
	input wire Clock,				// Pin 20
	input wire Reset,				// Pin 17
	input wire EncoderA_i,			// Pin 68
	input wire EncoderB_i,			// Pin 67
	output wire [7:0] Cathodes_o,	// Pin 40 41 42 43 45 47 51 52
	output wire [7:0] Segments_o	// Pin 39 38 37 36 35 34 30 29
);

	// Encoder instance
	wire Increment;
	wire Decrement;
	
	Encoder Encoder_inst(
		.Clock(Clock),
		.Reset(Reset),
		.AsyncA_i(EncoderA_i),
		.AsyncB_i(EncoderB_i),
		.AsyncS_i(1'b1),
		.Increment_o(Increment),
		.Decrement_o(Decrement),
		.ButtonPress_o(),
		.ButtonRelease_o(),
		.ButtonState_o()		
	);
	
	// Up/down counter, range 0...9999 decimal
	reg [15:0] Counter;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Counter <= 0;
		end else if(Increment) begin
			if(Counter == 16'd9999)
				Counter <= 16'd0;
			else
				Counter <= Counter + 1'b1;
		end else if(Decrement) begin
			if(Counter == 16'd0)
				Counter <= 16'd9999;
			else
				Counter <= Counter - 1'b1;
		end
	end
	
	// One tick delay
	reg ConversionStart;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			ConversionStart <= 0;
		end else begin
			ConversionStart <= Increment | Decrement;
		end
	end
	
	// Binary to BCD converter
	wire [15:0] Decimal;
	
	DoubleDabble #(
		.INPUT_BITS(16),
		.OUTPUT_DIGITS(4)
	) DoubleDabble_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(ConversionStart),
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
		.Data_i({Decimal, Counter}),
		.DecimalPoints_i(8'b00010000),
		.Cathodes_o(Cathodes_o),
		.Segments_o(Segments_o),
		.SwitchCathode_o()
	);	
	
endmodule

`default_nettype wire

///////////////////////////////////////////////////////////////////////////////
// LPfilter.v
//
// 7/7/11
// David Leibrandt
//
//	Low pass filter module.
//
// Implements a discrete first order IIR filter.  The goal is minimum latency.
// This design has 2 clock cycles of latency and can run at up to 100 MHz clock speed.
// It costs 8 DSP slices.
//
// Note that this design does not include the b1 coefficient, so it can only be
// a low pass filter.  It costs less DSP slices than the general IIRfilter1stOrder.
//
// a1_in and b0_in are the IIR filter taps
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module LPfilter(
   input  wire												clk_in,
	input  wire												on_in,
	input  wire signed	[34:0]						a1_in,
	input  wire signed	[34:0]						b0_in,
	input  wire signed	[SIGNAL_IN_SIZE-1:0]		signal_in,
   output reg  signed	[SIGNAL_OUT_SIZE-1:0]	signal_out
);

// Parameters
parameter SIGNAL_IN_SIZE = 16;	// size of signal_in in bits (<= 32)
parameter SIGNAL_OUT_SIZE = 16;	// size of signal_out in bits (>= SIGNAL_IN_SIZE, <= 32)

reg signed [34:0] y;
reg signed [69:0] b0x1;
always @(posedge clk_in) begin
	if (on_in) begin
		b0x1 <= b0_in*(signal_in <<< (32 - SIGNAL_IN_SIZE));
		y <= (a1_in*y + b0x1) >>> 32;
	end else begin
		b0x1 <= 70'b0;
		y <= 35'b0;
	end
end

wire [SIGNAL_OUT_SIZE-1:0] signal_in_shifted;
assign signal_in_shifted = (SIGNAL_IN_SIZE < SIGNAL_OUT_SIZE) ? (signal_in <<< (SIGNAL_OUT_SIZE - SIGNAL_IN_SIZE)) : (signal_in >>> (SIGNAL_IN_SIZE - SIGNAL_OUT_SIZE));

always @(posedge clk_in) begin
	signal_out <= on_in ? y[31:32-SIGNAL_OUT_SIZE] : signal_in_shifted;
end

endmodule

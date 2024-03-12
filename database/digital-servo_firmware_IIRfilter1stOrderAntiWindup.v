///////////////////////////////////////////////////////////////////////////////
// IIRfilter1stOrderAntiWindup.v
//
// 5/18/11
// David Leibrandt
//
//	First order IIR filter module.  Includes hold and anti-windup features.
//
// Implements a discrete first order IIR filter.  The goal is minimum latency.
// This design has 2 clock cycles of latency and can run at up to 100 MHz clock speed.
// It costs 12 DSP slices.
//
// a0 = 2^A0_SHIFT, a1_in, b0_in, and b1_in are the IIR filter taps
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module IIRfilter1stOrderAntiWindup(
   input  wire											clk_in,
	input  wire											on_in,
	input  wire signed	[34:0]					a1_in,
	input  wire signed	[34:0]					b0_in,
	input  wire signed	[34:0]					b1_in,
	input  wire				[1:0]						railed_in,
	input  wire											hold_in,
	input  wire signed  [SIGNAL_IN_SIZE+1:0]	signal_in,
   output reg  signed  [SIGNAL_OUT_SIZE+1:0]	signal_out
);

// Parameters
parameter SIGNAL_IN_SIZE = 16;	// size of signal_in in bits (<= 32)
parameter SIGNAL_OUT_SIZE = 16;	// size of signal_out in bits (<= 32)
parameter A0_SHIFT = 26; // a0 = 2^A0_SHIFT

reg  signed [34:0] y;
reg  signed [69:0] b1x0, b0x1;

wire signed [34:0] yNew;
assign yNew = (a1_in*y + b0x1) >>> A0_SHIFT;

always @(posedge clk_in) begin
	if (on_in) begin
		b1x0 <= b1_in*(signal_in <<< (32 - SIGNAL_IN_SIZE));
		b0x1 <= b0_in*(signal_in <<< (32 - SIGNAL_IN_SIZE)) + b1x0;
		if ( (hold_in) ||
			  (railed_in[0] && ($signed(yNew[33:32-SIGNAL_OUT_SIZE]) < signal_out)) ||
			  (railed_in[1] && ($signed(yNew[33:32-SIGNAL_OUT_SIZE]) > signal_out)) )
			y <= y;
		else
			y <= yNew;
	end else begin
		b1x0 <= 70'b0;
		b0x1 <= 70'b0;
		y <= 35'b0;
	end
end

always @(posedge clk_in) begin
	signal_out <= y[33:32-SIGNAL_OUT_SIZE];
end

endmodule

///////////////////////////////////////////////////////////////////////////////
// Limit.v
//
// 7/6/11
// David Leibrandt
//
//	Limit module.
//
// Limits the signal to be between minval_in and maxval_in.
// This design has one clock cycle of latency.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module Limit(
   input  wire												clk_in,
	input  wire signed	[15:0]						minval_in,
	input  wire signed	[15:0]						maxval_in,
	input  wire												center_when_railed_in,
	input  wire signed	[SIGNAL_IN_SIZE+3:0]		signal_in,
   output reg				[1:0]							railed_out,
	output reg												clear_out,
	output reg  signed	[SIGNAL_OUT_SIZE-1:0]	signal_out
);

// Parameters
parameter SIGNAL_IN_SIZE = 16;	// size of signal_in in bits (<= 32)
parameter SIGNAL_OUT_SIZE = 16;	// size of signal_out in bits (<= SIGNAL_IN_SIZE, <= 32)

always @(posedge clk_in) begin
	if ($signed(signal_in[SIGNAL_IN_SIZE+3:SIGNAL_IN_SIZE-16]) > $signed({maxval_in[15], maxval_in[15], maxval_in[15], maxval_in[15], maxval_in})) begin
		signal_out <= maxval_in <<< (SIGNAL_OUT_SIZE - 16);
		railed_out <= 2'b10;
	end else if ($signed(signal_in[SIGNAL_IN_SIZE+3:SIGNAL_IN_SIZE-16]) < $signed({minval_in[15], minval_in[15], minval_in[15], minval_in[15], minval_in})) begin
		signal_out <= minval_in <<< (SIGNAL_OUT_SIZE - 16);
		railed_out <= 2'b01;
	end else begin
		signal_out <= signal_in[SIGNAL_IN_SIZE-1:SIGNAL_IN_SIZE-SIGNAL_OUT_SIZE];
		railed_out <= 2'b00;
	end
end

always @(posedge clk_in) begin
	if (center_when_railed_in && (railed_out[0] || railed_out[1]))
		clear_out <= 1'b1;
	else
		clear_out <= 1'b0;
end

endmodule

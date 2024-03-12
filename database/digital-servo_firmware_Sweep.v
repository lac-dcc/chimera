///////////////////////////////////////////////////////////////////////////////
// Sweep.v
//
// 6/30/11
// David Leibrandt
//
//	Sweep module.
//
// Generates a triangle wave sweep.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module Sweep(
   input  wire												clk_in,
	input	 wire						   					on_in,
	input  wire signed	[15:0]						minval_in,
	input	 wire signed	[15:0]						maxval_in,
	input	 wire				[31:0]						stepsize_in,
   output reg  signed	[SIGNAL_OUT_SIZE+1:0]	signal_out
);

// Parameters
parameter SIGNAL_OUT_SIZE = 16;	// size of signal_out in bits (<= 32)

// State machine definitions
localparam  GOINGUP 		= 1'b0;
localparam  GOINGDOWN	= 1'b1;

// State
reg						state_f;
reg signed	[33:0]	current_val_f, next_val_f;

// State machine
always @(posedge clk_in) begin
	if (on_in) begin
		if (state_f == GOINGUP)
			next_val_f <= next_val_f + stepsize_in;
		else
			next_val_f <= next_val_f - stepsize_in;
		
		if (next_val_f > $signed({maxval_in[15], maxval_in[15], maxval_in, 16'b0})) begin
			current_val_f <= {maxval_in[15], maxval_in[15], maxval_in, 16'b0};
			state_f <= GOINGDOWN;
		end else	if (next_val_f < $signed({minval_in[15], minval_in[15], minval_in, 16'b0})) begin
			current_val_f <= {minval_in[15], minval_in[15], minval_in, 16'b0};
			state_f <= GOINGUP;
		end else
			current_val_f <= next_val_f;
	end else begin
		current_val_f <= 34'b0;
		next_val_f <= 34'b0;
		state_f <= GOINGUP;
	end
	signal_out <= current_val_f[33:32-SIGNAL_OUT_SIZE];
end

endmodule

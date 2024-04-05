///////////////////////////////////////////////////////////////////////////////
// Relock.v
//
// 7/5/11
// David Leibrandt
//
//	Relock module.
//
// Generates a triangle wave sweep of increasing amplitude if signal_in is not between minval_in and maxval_in.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module Relock(
   input  wire												clk_in,
	input	 wire						   					on_in,
	input  wire signed	[15:0]						minval_in,
	input  wire signed	[15:0]						maxval_in,
	input  wire				[31:0]						stepsize_in,
	input  wire signed	[15:0]						signal_in,
   input  wire				[1:0]							railed_in,
	input  wire						   					hold_in,
   output wire						   					hold_out,
	output reg												clear_out,
   output wire signed	[SIGNAL_OUT_SIZE+1:0]	signal_out
);

// Parameters
parameter SIGNAL_OUT_SIZE = 16;	// size of signal_out in bits (<= 32)

// Are we locked?
reg locked_f;
always @(posedge clk_in) begin
	if (((minval_in < signal_in) && (signal_in < maxval_in)) || !on_in) begin
		locked_f <= 1'b1;
		clear_out <= 1'b0;
	end else begin
		locked_f <= 1'b0;
		if (locked_f && (railed_in[0] || railed_in[1]))
			clear_out <= 1'b1; // if we just became unlocked and we're railed, send the signal to reset the loop filter integrators
		else
			clear_out <= 1'b0;
	end
end

assign hold_out = (on_in && (!locked_f));

// State machine definitions
localparam  ZERO			= 2'b00;
localparam  GOINGUP 		= 2'b01;
localparam  GOINGDOWN	= 2'b10;

// State
reg			[1:0]		state_f;
reg signed	[41:0]	current_val_f, sweep_amplitude_f;

// State machine
always @(posedge clk_in) begin
	if (on_in) begin
		if (hold_in == 1'b0) begin
			if (state_f == GOINGUP)
				current_val_f <= current_val_f + $signed(stepsize_in);
			else if (state_f == GOINGDOWN)
				current_val_f <= current_val_f - $signed(stepsize_in);
			else
				current_val_f <= 42'b0;
			
			if (locked_f) begin	// if we're locked, go towards zero
				sweep_amplitude_f <= 42'b0;
				if (current_val_f > $signed(stepsize_in))
					state_f <= GOINGDOWN;
				else if (current_val_f < -$signed(stepsize_in))
					state_f <= GOINGUP;
				else
					state_f <= ZERO;
			end else begin			// otherwise, implement a sweep of increasing amplitude
				if (state_f == ZERO) begin
					state_f <= GOINGUP;
				end else if ((current_val_f > sweep_amplitude_f) || railed_in[1]) begin
					state_f <= GOINGDOWN;
					if (state_f == GOINGUP) begin // increase the sweep amplitude every time we transition from GOINGUP to GOINGDOWN
						if (sweep_amplitude_f == 42'b0)
							sweep_amplitude_f <= sweep_amplitude_f + $signed(stepsize_in << 8);
						else if (sweep_amplitude_f < 42'h10000000000)
							sweep_amplitude_f <= (sweep_amplitude_f <<< 1);
						else
							sweep_amplitude_f <= 42'h10000000000;
					end
				end else if ((current_val_f < -sweep_amplitude_f) || railed_in[0]) begin
					state_f <= GOINGUP;
				end
			end
		end
	end else begin
		current_val_f <= 42'b0;
		sweep_amplitude_f <= 42'b0;
		state_f <= ZERO;
	end
end

assign signal_out = current_val_f[41:40-SIGNAL_OUT_SIZE];

endmodule

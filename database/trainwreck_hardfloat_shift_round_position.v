//
// shift_round_position -- Logarithmic stage for rounding at a
// programmable bit position.
// Author: Brian Richards, 11/11/2010
//
// Inputs:
//  do_shift:        If 1, shift and pad inputs with ones.
//  in               Initially masked significand.
//  in_round_bits    Initially right-shifted significand.
//  in_sticky        Initial value of the sticky bit (extra LSBS != 1).
// Outputs:
//  out              Conditionally updated significand (trailing ones).
//  out_round_bits   Conditionally shifted significand (leading zeros).
//  out_sticky       Updated sticky bit.

module shift_round_position(do_shift, in, in_round_bits, in_sticky,
							out, out_round_bits, out_sticky);
	parameter DATA_WIDTH = 32;
	parameter SHIFT_BITS = 16;

	input                   do_shift;
	input  [DATA_WIDTH-1:0] in;             // The LSB is 1/2 digit.
	input  [DATA_WIDTH-1:0] in_round_bits;
	input                   in_sticky;
	output [DATA_WIDTH-1:0] out;
	output [DATA_WIDTH-1:0] out_round_bits;
	output                  out_sticky;

	wire                    zero_lsbs;

// Conditionally pad the right SHIFT_BITS bits with ones.
assign out = do_shift ? {in[DATA_WIDTH-1:SHIFT_BITS],{SHIFT_BITS{1'b1}}} : in;

// The round bits are a conditionally right-shifted version of the input bits.
assign out_round_bits =
	do_shift ? {{SHIFT_BITS{1'b0}},in[DATA_WIDTH-1:SHIFT_BITS]} :
	           in_round_bits;

assign zero_lsbs = in_round_bits[SHIFT_BITS-1:0] != {SHIFT_BITS{1'b0}};
assign out_sticky = do_shift ? (zero_lsbs || in_sticky) : in_sticky;

endmodule

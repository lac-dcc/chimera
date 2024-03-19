//
//
//
module shift_right_track_lsbs(do_shift, in, in_lsb, out, out_lsb);
	parameter DATA_WIDTH = 32;
	parameter SHIFT_BITS = 16;

	input                   do_shift;
	input  [DATA_WIDTH-1:0] in;
	input                   in_lsb;
	output [DATA_WIDTH-1:0] out;
	output                  out_lsb;

// Conditionally shift by SHIFT_BITS.
assign out = do_shift ? {{SHIFT_BITS{1'b0}}, in[DATA_WIDTH-1:SHIFT_BITS]} : in;

// Track the highest dropped LSB, and OR the remaining LSBs.
assign out_lsb = do_shift ? (in_lsb || (in[SHIFT_BITS-1:0] != 0)) : in_lsb;

endmodule

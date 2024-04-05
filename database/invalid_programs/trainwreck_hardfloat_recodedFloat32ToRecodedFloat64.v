//
// recodedFloat32ToRecodedFloat64( in, out );
// Author: Brian Richards, 11/8/2010
//

`include "fpu_recoded.vh"

module recodedFloat32ToRecodedFloat64( in, out, exceptionFlags);
	parameter  IN_EXP_BITS  = 9;
	parameter  IN_SIG_BITS  = 23;
	parameter  OUT_EXP_BITS = 12;
	parameter  OUT_SIG_BITS = 52;

	localparam IN_BITS      = IN_EXP_BITS + IN_SIG_BITS + 1;
	localparam OUT_BITS     = OUT_EXP_BITS + OUT_SIG_BITS + 1;

    input  [IN_BITS-1:0]      in;
    output [OUT_BITS-1:0]     out;
	output [4:0]              exceptionFlags;

	wire                      sign;
	wire   [IN_EXP_BITS-1:0]  exponent_in;
	wire   [2:0]              exponent_code;
	wire                      is_signaling_nan;
	wire   [IN_SIG_BITS-1:0]  sig_in;

	wire   [OUT_EXP_BITS-1:0] exponent_extended;

assign sign             = in[IN_BITS-1];
assign exponent_in      = in[IN_BITS-2:IN_SIG_BITS];
assign exponent_code    = exponent_in[IN_EXP_BITS-1:IN_EXP_BITS-3];
assign is_signaling_nan = exponent_code == 3'b111 && in[IN_SIG_BITS-1] == 1'b0;
assign sig_in           = in[IN_SIG_BITS-1:0];

assign exponent_extended =
	(exponent_code == 3'b000) ? 12'b0 :
	(exponent_code == 3'b001) ? {4'b0111, exponent_in[IN_EXP_BITS-2:0]} :
	(exponent_code == 3'b010) ? {4'b0111, exponent_in[IN_EXP_BITS-2:0]} :
	(exponent_code == 3'b011) ? {4'b0111, exponent_in[IN_EXP_BITS-2:0]} :
	(exponent_code == 3'b100) ? {4'b1000, exponent_in[IN_EXP_BITS-2:0]} :
	(exponent_code == 3'b101) ? {4'b1000, exponent_in[IN_EXP_BITS-2:0]} :
	(exponent_code == 3'b110) ? 12'b110000000000 :
	(exponent_code == 3'b111) ? 12'b111000000000 :
	12'bx;

assign out = {sign,
		exponent_extended,
		is_signaling_nan ? 1'b1 : sig_in[IN_SIG_BITS-1],
		sig_in[IN_SIG_BITS-2:0],
		{OUT_SIG_BITS-IN_SIG_BITS{1'b0}}};

assign exceptionFlags = {is_signaling_nan, 4'b0};

endmodule

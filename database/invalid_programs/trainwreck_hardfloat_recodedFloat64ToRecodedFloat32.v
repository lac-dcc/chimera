//
// recodedFloat64ToRecodedFloat32( in, out );
// Author: Brian Richards, 11/8/2010
//

`include "fpu_recoded.vh"
`include "macros.vh"

`define max_f32_exp       12'h87f
`define min_f32_exp       12'h76a
`define underflow_f32_exp 12'h782
`define max_subnormal_exp 12'h781 // -127, 23.1 digits, round_shift = 0
`define min_subnormal_exp 12'h76a // -150,  0.1 digits, round_shift = 23

module recodedFloat64ToRecodedFloat32( in, roundingMode, out, exceptionFlags);
	parameter IN_SIG_BITS  = 52;
	parameter OUT_SIG_BITS = 23;
	parameter SHIFT_WIDTH  = OUT_SIG_BITS+1;
	parameter STAGES       = `ceilLog2(OUT_SIG_BITS);

    input  [64:0]  in;
	input  [1:0]   roundingMode;
    output [32:0]  out;
	output [4:0]   exceptionFlags;

	wire                     sign;
	wire   [11:0]            exponent_in;
	wire   [51:0]            sig_in;

	wire                     exponentUnderflow;
	wire                     exponentOverflow;
	wire                     exponentIsSubnormal;
	wire                     exponentInRange;
	wire                     exponentSpecial;
	wire                     isNaN;
	wire                     isInvalidNaN;
	wire                     flagUnderflow;
	wire                     flagOverflow;

	wire   [STAGES-1:0]      round_position;

	// Arrays for storing intermediate values between rounding stages.
	wire   [SHIFT_WIDTH-1:0] sig_masked_vector  [STAGES:0];
	wire   [SHIFT_WIDTH-1:0] sig_shifted_vector [STAGES:0];
	wire                     sig_sticky_vector  [STAGES:0];

	wire   [2:0]             roundBits;
	wire		             roundInexact;
	wire                     roundEvenOffset;
	wire                     roundOffset;

	wire   [23:0]            sig_pre_round;
	wire   [23:0]			 sig_round;
    wire   [11:0]            exp_round;

	wire   [8:0]             exponent_out;
	wire   [22:0]            sig_out;

// Break the input f64 into fields:
assign sign           = in[64];
assign exponent_in    = in[63:52];
assign sig_in         = in[51:0];

// Determine the type of float from the coded exponent bits:
assign exponentIsSubnormal = (exponent_in >= `min_subnormal_exp &&
							    exponent_in <= `max_subnormal_exp);
assign exponentSpecial     = (exponent_in[11:9] == 3'b000
					         || exponent_in[11:10] == 2'b11);
assign isNaN               = (exponent_in[11:9] == 3'b111);
assign isInvalidNaN        = isNaN && sig_in[51] != 1'b1;
assign exponentUnderflow   = (exponent_in < `min_f32_exp && !exponentSpecial);
assign exponentOverflow    = (exponent_in > `max_f32_exp && !exponentSpecial);
assign exponentInRange     = (!exponentUnderflow && !exponentOverflow);

// For the recoded float representation, the significand must be
// rounded to bit positions that depend on the exponent.
wire [26:0] tmp0;
assign {tmp0, round_position} =
	exponentIsSubnormal ? `max_subnormal_exp + 1 - exponent_in :
	{STAGES{1'b0}};

// Normally, round off to most-significant 23 bits [51:29], and track
// half-digit in bit 28 and remaining sticky bits.
assign sig_masked_vector[0]  = sig_in[51:28];
assign sig_shifted_vector[0] = sig_in[51:28];
assign sig_sticky_vector[0]  = (sig_in[27:0] != 28'b0);

// Construct a logarithmic array of round/shift stages to round subnormal
// significands depending on the exponent.
genvar i;
generate
	for (i=0; i < STAGES; i=i+1) begin:ROUND
		shift_round_position #(SHIFT_WIDTH, 1 << i) round_stage(
			.do_shift      (round_position[i]),
			.in            (sig_masked_vector[i]),
			.in_round_bits (sig_shifted_vector[i]),
			.in_sticky     (sig_sticky_vector[i]),
			.out           (sig_masked_vector[i+1]),
			.out_round_bits(sig_shifted_vector[i+1]),
			.out_sticky    (sig_sticky_vector[i+1])
		);
	end
endgenerate

assign roundBits = {sig_shifted_vector[STAGES][1:0],sig_sticky_vector[STAGES]};
assign roundInexact = (roundBits[1:0] != 2'b0 && !exponentSpecial);
// Determine the rounding increment, based on the rounding mode.
assign roundEvenOffset = (roundBits[1:0] == 2'b11 || roundBits[2:1] == 2'b11);
assign roundOffset =
	roundingMode == `round_nearest_even ?  roundEvenOffset :
	roundingMode == `round_minMag       ?  1'b0 :
	roundingMode == `round_min          ?  sign & roundInexact ? 1'b1 : 1'b0 :
	roundingMode == `round_max          ? ~sign & roundInexact ? 1'b1 : 1'b0 :
	1'bx;

// Round the significand, and increment the exponent if the
// significand overflows.
assign sig_pre_round = {1'b0, sig_masked_vector[STAGES][SHIFT_WIDTH-1:1]};
assign sig_round = sig_pre_round + roundOffset;
assign exp_round = exponent_in - (sig_round[23] ? 12'h6ff : 12'h700);

// Assemble the recoded f32 exponent.
wire [2:0] tmp1;
assign {tmp1,exponent_out} =
	exponentSpecial ? {exponent_in[11:9], 6'b0} :
	exponentInRange ?  exp_round[8:0] :
	exponentOverflow ? 9'h180 :
	12'b0;

// Assemble the recoded f32 significand.
assign sig_out =
	exponentSpecial ? {isInvalidNaN || sig_in[51], sig_in[50:29]} :
	exponentInRange ? sig_round[22:0] :
	23'b0;

assign out = {sign, exponent_out, sig_out[22:0]};

// Assemble the exception flags vector.
assign flagUnderflow  = exponentUnderflow
					   || exponentIsSubnormal && roundInexact;
assign flagOverflow   = exponentOverflow
					   || exponent_in == `max_f32_exp && sig_round[23];
assign exceptionFlags = {isInvalidNaN, 1'b0, flagOverflow, flagUnderflow,
						 roundInexact | exponentOverflow | exponentUnderflow};

endmodule

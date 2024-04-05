`include "fpu_recoded.vh"
`include "macros.vh"

//
// recodedFloat64ToAny( in, out );
// Author: Brian Richards, 10/21/2010
//

module recodedFloat64ToAny( in, roundingMode, typeOp, out, exceptionFlags);
	parameter INT_WIDTH = 64;
	parameter SHIFT_WIDTH = INT_WIDTH + 1; // Save one fraction bit.
	parameter STAGES = `ceilLog2(SHIFT_WIDTH);
	parameter SIG_WIDTH = 52;
	parameter EXP_WIDTH = 12; // Recoded float has one more exponent bit.
	parameter EXP_OFFSET = 12'h800; // Recoded offset=2048 (IEEE offset=1023)
	parameter FLOAT_WIDTH = SIG_WIDTH + EXP_WIDTH + 1;

    input  [FLOAT_WIDTH-1:0] in;
	input  [1:0]             roundingMode;
	input  [1:0]             typeOp;
    output [INT_WIDTH-1:0]   out;
	output [4:0]             exceptionFlags;

	wire                     isMaxNegFloat;
	wire   [EXP_WIDTH-1:0]   maxExponent;
	wire   [FLOAT_WIDTH-1:0] maxNegFloat;
	wire                     sign;
	wire   [EXP_WIDTH-1:0]   exponent;
	wire                     isValidExp;
	wire                     isRoundToZero;
	wire                     isValidUnsigned;
	wire                     isValidSigned;
	wire                     isValidShift;
	wire                     isValid;
	wire                     isTiny;
	wire                     isZeroOrOne;
	wire   [INT_WIDTH-1:0]   maxInteger;
	wire   [INT_WIDTH-1:0]   minInteger;

	wire   [STAGES-1:0]      shift_count;

	// Arrays for storing intermediate values between generated shift units.
	wire   [SHIFT_WIDTH-1:0] shift_vector [STAGES:0];
	wire                     lsb_vector   [STAGES:0];
	wire   [2:0]             lsbs;

	wire   [SHIFT_WIDTH:0]   absolute_int;
	wire   [INT_WIDTH:0]     absolute_round;
	wire   [INT_WIDTH:0]     signed_int;

	wire                     roundExact;
	wire                     roundOffset;

// For the Recoded Float:
//  shift_count Exponent  Recoded Exponent      IEEE Exponent
//                (zero)   12'b000---------      11'b00000000000
//   32           2^-1     12'b011111111111      11'b01111111110 (Can round up to 1)
//   31, msb=1    2^0      12'b100000000000      11'b01111111111
//   30           2^1      12'b100000000001      11'b10000000000
//   29           2^2      12'b100000000010      11'b10000000001
//     ...
//   1            2^30     12'b100000011110      11'b10000011101
//   0			  2^31     12'b100000011111      11'b10000011110
//

assign sign = in[FLOAT_WIDTH-1];
assign exponent = in[FLOAT_WIDTH-2:SIG_WIDTH];

// The signed conversion is valid if:
// Input < 2^63 || Input == -2^63

assign isTiny      = (exponent < EXP_OFFSET-1);
assign isZeroOrOne = (exponent == EXP_OFFSET-1);

assign maxExponent = EXP_OFFSET + (
	(typeOp == `type_uint32) ? 12'd32 :
	(typeOp == `type_int32)  ? 12'd31 :
	(typeOp == `type_uint64) ? 12'd64 :
	(typeOp == `type_int64)  ? 12'd63 :
	12'bx);
assign maxNegFloat = {1'b1, maxExponent[11:0], {SIG_WIDTH{1'b0}}};
assign isMaxNegFloat =
	(typeOp == `type_uint32) ? 1'b0 :
	(typeOp == `type_int32)  ? (in == maxNegFloat) :
	(typeOp == `type_uint64) ? 1'b0 :
	(typeOp == `type_int64)  ? (in == maxNegFloat) :
	1'bx;

assign maxInteger =
	(typeOp == `type_uint32) ? 64'h00000000ffffffff :
	(typeOp == `type_int32)  ? 64'h000000007fffffff :
	(typeOp == `type_uint64) ? 64'hffffffffffffffff :
	(typeOp == `type_int64)  ? 64'h7fffffffffffffff :
	64'bx;
assign minInteger =
	(typeOp == `type_uint32) ? 64'h00000000ffffffff :
	(typeOp == `type_int32)  ? 64'hffffffff80000000 :
	(typeOp == `type_uint64) ? 64'hffffffffffffffff :
	(typeOp == `type_int64)  ? 64'h8000000000000000 :
	64'bx;

// Calculate the shift count:
assign isValidShift = (exponent[11:6] == 6'b100000 || isZeroOrOne);
assign shift_count =
	(exponent[11:6] == 6'b100000) ? {1'b0,~exponent[5:0]} :
	isZeroOrOne ? 7'b1000000 :
	7'b0;

//assign shift_count = {isZeroOrOne ? 1'b1 : 1'b0,
//                     (exponent[11:6] == 6'b100000) ?
//							EXP_OFFSET+63-exponent[5:0] : 6'b0};

// Construct the initial 64- bit unsigned integer with
// leading 1 digit at the MSB.
assign shift_vector[0] = {1'b1,in[SIG_WIDTH-1:0], {EXP_WIDTH{1'b0}}};
assign lsb_vector[0]   = 1'b0; // Track a sticky LSB.

// Generate a logarithmic array of shifter stages.
genvar i;
generate
	for (i=0; i < STAGES; i=i+1) begin:SHIFT
		shift_right_track_lsbs #(SHIFT_WIDTH, 1 << i) shift_stage(
			shift_count [i],
			shift_vector[i],
			lsb_vector  [i],
		    shift_vector[i+1],
			lsb_vector  [i+1]
		);
	end
endgenerate

// 
assign absolute_int = {1'b0,shift_vector[STAGES]};
assign lsbs       = {absolute_int[1:0], lsb_vector[STAGES]};

// Check if rounding is necessary
assign roundExact = (lsbs[1:0] == 2'b00);

// Determine the rounding offsets
assign roundOffset =
	roundingMode == `round_nearest_even ? (lsbs[1:0] == 2'b11 || lsbs[2:1] == 2'b11) :
	roundingMode == `round_minMag       ? 1'b0 :
	roundingMode == `round_min          ? (sign & ~roundExact) :
	roundingMode == `round_max          ? (~sign & ~roundExact) :
	1'bx;

// For convenience, extract the last shifted value from the shift vectors.
assign absolute_round = absolute_int[SHIFT_WIDTH:1] + roundOffset;
assign signed_int = sign ? -absolute_round : absolute_round;

// If casting to signed, valid if in range, including max neg int.
// If casting a positive float to unsigned, it is valid if in range.
// If casting a negative float to unsigned, check round to zero.
assign isValidExp = (exponent < maxExponent);
assign isRoundToZero = (sign && (isZeroOrOne || isTiny) && signed_int[1:0] == 2'b0);
assign isValidUnsigned =
	(isValidShift && !sign)  ? (absolute_round[INT_WIDTH-1:0] <= maxInteger) :
	(!sign)                  ? isTiny :
	1'b0;

assign isValidSigned =
	(isValidShift && !sign)  ? (absolute_round[INT_WIDTH-1:0] <= maxInteger) :
	(isValidShift && sign)   ? (absolute_round[INT_WIDTH-1:0] <= maxInteger+1) :
	isTiny;

assign isValid =
	(typeOp == `type_uint32) ? ((isValidUnsigned) || isRoundToZero) :
	(typeOp == `type_int32)  ? (isValidSigned || in == maxNegFloat) :
	(typeOp == `type_uint64) ? ((!sign && isValidExp) || isRoundToZero) :
	(typeOp == `type_int64)  ? (isValidExp || in == maxNegFloat) :
	1'bx;

assign out  =
	isTiny              ? {INT_WIDTH{1'b0}} :
	(~isValid && ~sign) ? maxInteger :
	(~isValid &&  sign) ? minInteger :
	signed_int[INT_WIDTH-1:0];

assign exceptionFlags = {~isValid, 4'b0};

endmodule

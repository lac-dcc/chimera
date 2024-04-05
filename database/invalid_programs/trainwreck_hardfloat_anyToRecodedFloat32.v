`include "fpu_recoded.vh"
`include "macros.vh"

//
// anyToRecodedFloat32( in, out );
// Author: Brian Richards, 10/14/2010
// Based on float32ToRecodedFloat32 from John Hauser
//

module anyToRecodedFloat32( in, roundingMode, typeOp, out, exceptionFlags);
    parameter INT_WIDTH = 64;
    parameter SHIFT_WIDTH = INT_WIDTH + 1; // Save one fraction bit.
    parameter STAGES = `ceilLog2(SHIFT_WIDTH);
    parameter SIG_WIDTH = 23;
    parameter EXP_WIDTH = 9; // Recoded float has one more exponent bit.
    parameter EXP_OFFSET = 9'h100; // Recoded offset=2048 (IEEE offset=1023)
    parameter FLOAT_WIDTH = SIG_WIDTH + EXP_WIDTH + 1;

    input  [INT_WIDTH-1:0]   in;
    input  [1:0]             roundingMode;
    input  [1:0]             typeOp;
    output [FLOAT_WIDTH-1:0] out;
    output [4:0]             exceptionFlags;

    wire                     sign;
    wire [INT_WIDTH-1:0]     norm_in;
    wire [5:0]               norm_count;
    wire [INT_WIDTH-1:0]     norm_out;

    wire [2:0]               roundBits;
    wire                     roundInexact;
    wire                     roundEvenOffset;
    wire                     roundOffset;

    wire [24:0]              norm_round;
    wire [EXP_WIDTH-1:0]     exponent_offset;
    wire [EXP_WIDTH-1:0]     exponent;

// Generate the absolute value of the input.
assign sign =
    (typeOp == `type_uint32) ? 1'b0 :
    (typeOp == `type_int32)  ? in[31] :
    (typeOp == `type_uint64) ? 1'b0 :
    (typeOp == `type_int64)  ? in[63] :
    1'bx;
assign norm_in =
    (typeOp == `type_uint32) ? {32'b0, in[31:0]} :
    (typeOp == `type_int32)  ? {32'b0, (sign ? -in[31:0] : in[31:0])}:
    (typeOp == `type_uint64) ? in :
    (typeOp == `type_int64)  ? (sign ? -in : in) :
    64'bx;

// Normalize to generate the fractional part.
normalize64 normalizeFract(norm_in, norm_count, norm_out );

// Rounding depends on:
//  norm_out[40]:  The LSB of the significand
//  norm_out[39]:  The MSB of the extra bits to be rounded
//  norm_out[38:0]: Remaining Extra bits
assign roundBits = {norm_out[40:39],(norm_out[38:0] != 39'b0)};

// Check if rounding is necessary.
assign roundInexact = (roundBits[1:0] != 2'b0);

// Determine the rounding increment, based on the rounding mode.
assign roundEvenOffset = (roundBits[1:0] == 2'b11 || roundBits[2:1] == 2'b11);
assign roundOffset =
    roundingMode == `round_nearest_even ?  roundEvenOffset :
    roundingMode == `round_minMag       ?  1'b0 :
    roundingMode == `round_min          ?  sign & roundInexact ? 1'b1 : 1'b0 :
    roundingMode == `round_max          ? ~sign & roundInexact ? 1'b1 : 1'b0 :
    1'bx;

// The rounded normalized significand includes the carry-out, implicit unit
// digit, and 23-bits of final significand (25 bits total).
assign norm_round = ({1'b0, norm_out[63:40]} + roundOffset);

// For the Recoded Float32:
//  norm_count Exponent  Recoded Exponent      IEEE Exponent
//   63, msb=0    2^0      9'b000------      8'b00000000
//   63, msb=1    2^0      9'b100000000      8'b01111111
//   62           2^1      9'b100000001      8'b10000000
//   61           2^2      9'b100000010      8'b10000001
//     ...
//   1            2^62     9'b100111110      8'b10111101
//   0            2^63     9'b100111111      8'b10111110
//

// Construct the exponent from the norm_count, and increment the exponent if
// the rounding overflows (the significand will still be all zeros in this case).
assign exponent_offset = {3'b100,~norm_count} + norm_round[24];
assign exponent =
    (norm_out[63] == 1'b0 && norm_count == 6'd63) ? 9'b0 :
    exponent_offset;

assign out = {sign, exponent, norm_round[22:0]};
assign exceptionFlags = {1'b0, 1'b0, 1'b0, 1'b0, roundInexact};

endmodule

// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


// Converts 32-bit float to signed 32-bit int.

// Rounding Modes (rmode):
// =======================
// 
// 0 = round_nearest_even
// 1 = round_to_zero
// 2 = round_up
// 3 = round_down

module float_to_int(
    input wire [31:0] op,
    input wire [1:0] rmode,
    output wire [31:0] res);

// Physical parts.
wire [7:0] exp_part = op[30:23];
wire [22:0] fract_part = op[22:0];
wire sign = op[31];

// Logical parts.
wire [31:0] significand = { 8'h0, 1'b1, fract_part };
wire signed [7:0] exponent = exp_part - 8'd127;

// Detect special cases.
wire exp_part_all_on = &exp_part;
wire exp_part_all_off = !(|exp_part);
wire fract_part_all_off = !(|fract_part);

wire is_inf = exp_part_all_on & fract_part_all_off;
wire is_qnan = exp_part_all_on & fract_part[22];
wire is_snan = exp_part_all_on & !fract_part[22] & |fract_part[21:0];
wire is_zero = exp_part_all_off & fract_part_all_off;

wire [22:0] fractional_part /* verilog public */ =
            (exponent < -22) ? 23'd0 :
            (exponent < 0) ? (significand >> -exponent) :
            (exponent < 23) ? (significand << exponent) :
            23'd0;

wire lsbs_are_nonzero /* verilog public */ = |fractional_part;
wire lsbsmsb_is_nonzero /* verilog public */ = fractional_part[22];

// 0 = round_nearest_even
// 1 = round_to_zero
// 2 = round_up
// 3 = round_down
// RTZ: as exists - disregard least significant bits
// RDN: if negative and least significant bits != 0, shifted += 1
// RUP: if positive and least significant bits != 0, shifted += 1
// RNE: if most significant bit of the least significant bits is 1, shifted += 1

wire rounding_add /* verilog public */ =
    ((rmode == 0) && lsbsmsb_is_nonzero) ||
    ((rmode == 2) && !sign & lsbs_are_nonzero) ||
    ((rmode == 3) && sign & lsbs_are_nonzero);

// Partially processed.
wire [31:0] shifted = (exponent < 23
            ? significand >> (23 - exponent)
            : significand << (exponent - 23)) + rounding_add;

wire overflow = exponent >= 31; // Would shift into the sign bit.

assign res = is_zero ? 32'h0
        : is_inf | is_qnan | is_snan | overflow ? 32'h80000000
        : sign ? -shifted
        : shifted;

endmodule


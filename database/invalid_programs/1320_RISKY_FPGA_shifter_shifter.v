// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../muxes/mux_2.v"

module shifter #(
  parameter BITS = 32
) (
  input [1:0] alufn,
  input [BITS-1:0] a,
  input [$clog2(BITS)-1:0] b,
  output [BITS-1:0] out
);

wire pad;
wire [BITS-1:0] shl_out [$clog2(BITS)-1:0];
wire [BITS-1:0] shr_out [$clog2(BITS)-1:0];

genvar i;

// mux for pad
mux_2 pad_mux (
  .a(1'b0),
  .b(a[BITS-1]),
  .s(alufn[1]),
  .out(pad)
);

// Generate SHL
x_bit_shifter #(.BITS(BITS), .SHIFT(16)) shl0 ( 
  .a(a), 
  .pad(1'b0), 
  .shift(b[4]),
  .out(shl_out[4])
);
x_bit_shifter #(.BITS(BITS), .SHIFT(8)) shl1 (
  .a(shl_out[4]),
  .pad(1'b0),
  .shift(b[3]),
  .out(shl_out[3])
);
x_bit_shifter #(.BITS(BITS), .SHIFT(4)) shl2 (
  .a(shl_out[3]),
  .pad(1'b0),
  .shift(b[2]),
  .out(shl_out[2])
);
x_bit_shifter #(.BITS(BITS), .SHIFT(2)) shl3 (
  .a(shl_out[2]),
  .pad(1'b0),
  .shift(b[1]),
  .out(shl_out[1])
);
x_bit_shifter #(.BITS(BITS), .SHIFT(1)) shl4 (
  .a(shl_out[1]),
  .pad(1'b0),
  .shift(b[0]),
  .out(shl_out[0])
);

// Generate SHR / SRA
x_bit_shr #(.BITS(BITS), .SHIFT(16)) shr0 (
  .a(a),
  .pad(pad),
  .shift(b[4]),
  .out(shr_out[4])
);
x_bit_shr #(.BITS(BITS), .SHIFT(8)) shr1 (
  .a(shr_out[4]),
  .pad(pad),
  .shift(b[3]),
  .out(shr_out[3])
);
x_bit_shr #(.BITS(BITS), .SHIFT(4)) shr2 (
  .a(shr_out[3]),
  .pad(pad),
  .shift(b[2]),
  .out(shr_out[2])
);
x_bit_shr #(.BITS(BITS), .SHIFT(2)) shr3 (
  .a(shr_out[2]),
  .pad(pad),
  .shift(b[1]),
  .out(shr_out[1])
);
x_bit_shr #(.BITS(BITS), .SHIFT(1)) shr4 (
  .a(shr_out[1]),
  .pad(pad),
  .shift(b[0]),
  .out(shr_out[0])
);

assign out = alufn[0] ? shr_out[0] : shl_out[0];




endmodule

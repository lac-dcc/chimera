module lutN #(
    parameter N = 1,
    parameter init = 1
) (
    input [N-1:0] in,
    output out
);
  assign out = init[in];
endmodule

module LUT4_8192 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h2000),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_8 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0008),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_64 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0040),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_512 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0200),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_4096 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h1000),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_4 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0004),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_32768 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h8000),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_32 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0020),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_256 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0100),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_2048 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0800),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_2 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0002),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_16384 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h4000),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_16 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0010),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_128 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0080),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_1024 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0400),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module LUT4_1 (
    input I0,
    input I1,
    input I2,
    input I3,
    output O
);
wire coreir_lut4_inst0_out;
wire [3:0] coreir_lut4_inst0_in;
assign coreir_lut4_inst0_in = {I3,I2,I1,I0};
lutN #(
    .init(16'h0001),
    .N(4)
) coreir_lut4_inst0 (
    .in(coreir_lut4_inst0_in),
    .out(coreir_lut4_inst0_out)
);
assign O = coreir_lut4_inst0_out;
endmodule

module Decoder4 (
    input [3:0] I,
    output [15:0] O
);
wire LUT4_1024_inst0_O;
wire LUT4_128_inst0_O;
wire LUT4_16384_inst0_O;
wire LUT4_16_inst0_O;
wire LUT4_1_inst0_O;
wire LUT4_2048_inst0_O;
wire LUT4_256_inst0_O;
wire LUT4_2_inst0_O;
wire LUT4_32768_inst0_O;
wire LUT4_32_inst0_O;
wire LUT4_4096_inst0_O;
wire LUT4_4_inst0_O;
wire LUT4_512_inst0_O;
wire LUT4_64_inst0_O;
wire LUT4_8192_inst0_O;
wire LUT4_8_inst0_O;
LUT4_1024 LUT4_1024_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_1024_inst0_O)
);
LUT4_128 LUT4_128_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_128_inst0_O)
);
LUT4_16384 LUT4_16384_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_16384_inst0_O)
);
LUT4_16 LUT4_16_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_16_inst0_O)
);
LUT4_1 LUT4_1_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_1_inst0_O)
);
LUT4_2048 LUT4_2048_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_2048_inst0_O)
);
LUT4_256 LUT4_256_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_256_inst0_O)
);
LUT4_2 LUT4_2_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_2_inst0_O)
);
LUT4_32768 LUT4_32768_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_32768_inst0_O)
);
LUT4_32 LUT4_32_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_32_inst0_O)
);
LUT4_4096 LUT4_4096_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_4096_inst0_O)
);
LUT4_4 LUT4_4_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_4_inst0_O)
);
LUT4_512 LUT4_512_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_512_inst0_O)
);
LUT4_64 LUT4_64_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_64_inst0_O)
);
LUT4_8192 LUT4_8192_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_8192_inst0_O)
);
LUT4_8 LUT4_8_inst0 (
    .I0(I[0]),
    .I1(I[1]),
    .I2(I[2]),
    .I3(I[3]),
    .O(LUT4_8_inst0_O)
);
assign O = {LUT4_32768_inst0_O,LUT4_16384_inst0_O,LUT4_8192_inst0_O,LUT4_4096_inst0_O,LUT4_2048_inst0_O,LUT4_1024_inst0_O,LUT4_512_inst0_O,LUT4_256_inst0_O,LUT4_128_inst0_O,LUT4_64_inst0_O,LUT4_32_inst0_O,LUT4_16_inst0_O,LUT4_8_inst0_O,LUT4_4_inst0_O,LUT4_2_inst0_O,LUT4_1_inst0_O};
endmodule


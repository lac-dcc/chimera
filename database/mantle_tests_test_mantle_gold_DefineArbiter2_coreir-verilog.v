module coreir_const #(
    parameter width = 1,
    parameter value = 1
) (
    output [width-1:0] out
);
  assign out = value;
endmodule

module coreir_add #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 + in1;
endmodule

module lutN #(
    parameter N = 1,
    parameter init = 1
) (
    input [N-1:0] in,
    output out
);
  assign out = init[in];
endmodule

module LUT2_2 (
    input I0,
    input I1,
    output O
);
wire coreir_lut2_inst0_out;
wire [1:0] coreir_lut2_inst0_in;
assign coreir_lut2_inst0_in = {I1,I0};
lutN #(
    .init(4'h2),
    .N(2)
) coreir_lut2_inst0 (
    .in(coreir_lut2_inst0_in),
    .out(coreir_lut2_inst0_out)
);
assign O = coreir_lut2_inst0_out;
endmodule

module Arbiter2 (
    input [1:0] I,
    output [1:0] O
);
wire LUT2_2_inst0_O;
wire LUT2_2_inst1_O;
wire [1:0] const_3_2_out;
wire [1:0] coreir_add2_inst0_out;
LUT2_2 LUT2_2_inst0 (
    .I0(I[0]),
    .I1(coreir_add2_inst0_out[0]),
    .O(LUT2_2_inst0_O)
);
LUT2_2 LUT2_2_inst1 (
    .I0(I[1]),
    .I1(coreir_add2_inst0_out[1]),
    .O(LUT2_2_inst1_O)
);
coreir_const #(
    .value(2'h3),
    .width(2)
) const_3_2 (
    .out(const_3_2_out)
);
coreir_add #(
    .width(2)
) coreir_add2_inst0 (
    .in0(I),
    .in1(const_3_2_out),
    .out(coreir_add2_inst0_out)
);
assign O = {LUT2_2_inst1_O,LUT2_2_inst0_O};
endmodule


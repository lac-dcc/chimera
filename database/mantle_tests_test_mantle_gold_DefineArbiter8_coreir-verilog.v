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

module Arbiter8 (
    input [7:0] I,
    output [7:0] O
);
wire LUT2_2_inst0_O;
wire LUT2_2_inst1_O;
wire LUT2_2_inst2_O;
wire LUT2_2_inst3_O;
wire LUT2_2_inst4_O;
wire LUT2_2_inst5_O;
wire LUT2_2_inst6_O;
wire LUT2_2_inst7_O;
wire [7:0] const_255_8_out;
wire [7:0] coreir_add8_inst0_out;
LUT2_2 LUT2_2_inst0 (
    .I0(I[0]),
    .I1(coreir_add8_inst0_out[0]),
    .O(LUT2_2_inst0_O)
);
LUT2_2 LUT2_2_inst1 (
    .I0(I[1]),
    .I1(coreir_add8_inst0_out[1]),
    .O(LUT2_2_inst1_O)
);
LUT2_2 LUT2_2_inst2 (
    .I0(I[2]),
    .I1(coreir_add8_inst0_out[2]),
    .O(LUT2_2_inst2_O)
);
LUT2_2 LUT2_2_inst3 (
    .I0(I[3]),
    .I1(coreir_add8_inst0_out[3]),
    .O(LUT2_2_inst3_O)
);
LUT2_2 LUT2_2_inst4 (
    .I0(I[4]),
    .I1(coreir_add8_inst0_out[4]),
    .O(LUT2_2_inst4_O)
);
LUT2_2 LUT2_2_inst5 (
    .I0(I[5]),
    .I1(coreir_add8_inst0_out[5]),
    .O(LUT2_2_inst5_O)
);
LUT2_2 LUT2_2_inst6 (
    .I0(I[6]),
    .I1(coreir_add8_inst0_out[6]),
    .O(LUT2_2_inst6_O)
);
LUT2_2 LUT2_2_inst7 (
    .I0(I[7]),
    .I1(coreir_add8_inst0_out[7]),
    .O(LUT2_2_inst7_O)
);
coreir_const #(
    .value(8'hff),
    .width(8)
) const_255_8 (
    .out(const_255_8_out)
);
coreir_add #(
    .width(8)
) coreir_add8_inst0 (
    .in0(I),
    .in1(const_255_8_out),
    .out(coreir_add8_inst0_out)
);
assign O = {LUT2_2_inst7_O,LUT2_2_inst6_O,LUT2_2_inst5_O,LUT2_2_inst4_O,LUT2_2_inst3_O,LUT2_2_inst2_O,LUT2_2_inst1_O,LUT2_2_inst0_O};
endmodule


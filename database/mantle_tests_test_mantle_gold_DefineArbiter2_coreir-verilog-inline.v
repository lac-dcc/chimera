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
wire [1:0] coreir_lut2_inst0_in;
assign coreir_lut2_inst0_in = {I1,I0};
lutN #(
    .init(4'h2),
    .N(2)
) coreir_lut2_inst0 (
    .in(coreir_lut2_inst0_in),
    .out(O)
);
endmodule

module Arbiter2 (
    input [1:0] I,
    output [1:0] O
);
wire LUT2_2_inst0_O;
wire LUT2_2_inst1_O;
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
assign coreir_add2_inst0_out = 2'(I + 2'h3);
assign O = {LUT2_2_inst1_O,LUT2_2_inst0_O};
endmodule


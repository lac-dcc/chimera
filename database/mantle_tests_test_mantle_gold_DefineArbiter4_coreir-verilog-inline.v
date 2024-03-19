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

module Arbiter4 (
    input [3:0] I,
    output [3:0] O
);
wire LUT2_2_inst0_O;
wire LUT2_2_inst1_O;
wire LUT2_2_inst2_O;
wire LUT2_2_inst3_O;
wire [3:0] coreir_add4_inst0_out;
LUT2_2 LUT2_2_inst0 (
    .I0(I[0]),
    .I1(coreir_add4_inst0_out[0]),
    .O(LUT2_2_inst0_O)
);
LUT2_2 LUT2_2_inst1 (
    .I0(I[1]),
    .I1(coreir_add4_inst0_out[1]),
    .O(LUT2_2_inst1_O)
);
LUT2_2 LUT2_2_inst2 (
    .I0(I[2]),
    .I1(coreir_add4_inst0_out[2]),
    .O(LUT2_2_inst2_O)
);
LUT2_2 LUT2_2_inst3 (
    .I0(I[3]),
    .I1(coreir_add4_inst0_out[3]),
    .O(LUT2_2_inst3_O)
);
assign coreir_add4_inst0_out = 4'(I + 4'hf);
assign O = {LUT2_2_inst3_O,LUT2_2_inst2_O,LUT2_2_inst1_O,LUT2_2_inst0_O};
endmodule


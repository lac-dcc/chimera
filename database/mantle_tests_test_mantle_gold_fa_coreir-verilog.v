module coreir_orr #(
    parameter width = 1
) (
    input [width-1:0] in,
    output out
);
  assign out = |in;
endmodule

module corebit_xor (
    input in0,
    input in1,
    output out
);
  assign out = in0 ^ in1;
endmodule

module fold_xor3None (
    input I0,
    input I1,
    input I2,
    output O
);
wire xor_inst0_out;
wire xor_inst1_out;
corebit_xor xor_inst0 (
    .in0(I0),
    .in1(I1),
    .out(xor_inst0_out)
);
corebit_xor xor_inst1 (
    .in0(xor_inst0_out),
    .in1(I2),
    .out(xor_inst1_out)
);
assign O = xor_inst1_out;
endmodule

module corebit_and (
    input in0,
    input in1,
    output out
);
  assign out = in0 & in1;
endmodule

module Or3xNone (
    input I0,
    input I1,
    input I2,
    output O
);
wire orr_inst0_out;
wire [2:0] orr_inst0_in;
assign orr_inst0_in = {I2,I1,I0};
coreir_orr #(
    .width(3)
) orr_inst0 (
    .in(orr_inst0_in),
    .out(orr_inst0_out)
);
assign O = orr_inst0_out;
endmodule

module FullAdder (
    input I0,
    input I1,
    input CIN,
    output O,
    output COUT
);
wire Or3xNone_inst0_O;
wire and_inst0_out;
wire and_inst1_out;
wire and_inst2_out;
wire fold_xor3None_inst0_O;
Or3xNone Or3xNone_inst0 (
    .I0(and_inst0_out),
    .I1(and_inst1_out),
    .I2(and_inst2_out),
    .O(Or3xNone_inst0_O)
);
corebit_and and_inst0 (
    .in0(I0),
    .in1(I1),
    .out(and_inst0_out)
);
corebit_and and_inst1 (
    .in0(I1),
    .in1(CIN),
    .out(and_inst1_out)
);
corebit_and and_inst2 (
    .in0(I0),
    .in1(CIN),
    .out(and_inst2_out)
);
fold_xor3None fold_xor3None_inst0 (
    .I0(I0),
    .I1(I1),
    .I2(CIN),
    .O(fold_xor3None_inst0_O)
);
assign O = fold_xor3None_inst0_O;
assign COUT = Or3xNone_inst0_O;
endmodule


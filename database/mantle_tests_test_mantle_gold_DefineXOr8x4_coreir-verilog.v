module coreir_xor #(
    parameter width = 1
) (
    input [width-1:0] in0,
    input [width-1:0] in1,
    output [width-1:0] out
);
  assign out = in0 ^ in1;
endmodule

module fold_xor84 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    input [3:0] I4,
    input [3:0] I5,
    input [3:0] I6,
    input [3:0] I7,
    output [3:0] O
);
wire [3:0] xor4_inst0_out;
wire [3:0] xor4_inst1_out;
wire [3:0] xor4_inst2_out;
wire [3:0] xor4_inst3_out;
wire [3:0] xor4_inst4_out;
wire [3:0] xor4_inst5_out;
wire [3:0] xor4_inst6_out;
coreir_xor #(
    .width(4)
) xor4_inst0 (
    .in0(I0),
    .in1(I1),
    .out(xor4_inst0_out)
);
coreir_xor #(
    .width(4)
) xor4_inst1 (
    .in0(xor4_inst0_out),
    .in1(I2),
    .out(xor4_inst1_out)
);
coreir_xor #(
    .width(4)
) xor4_inst2 (
    .in0(xor4_inst1_out),
    .in1(I3),
    .out(xor4_inst2_out)
);
coreir_xor #(
    .width(4)
) xor4_inst3 (
    .in0(xor4_inst2_out),
    .in1(I4),
    .out(xor4_inst3_out)
);
coreir_xor #(
    .width(4)
) xor4_inst4 (
    .in0(xor4_inst3_out),
    .in1(I5),
    .out(xor4_inst4_out)
);
coreir_xor #(
    .width(4)
) xor4_inst5 (
    .in0(xor4_inst4_out),
    .in1(I6),
    .out(xor4_inst5_out)
);
coreir_xor #(
    .width(4)
) xor4_inst6 (
    .in0(xor4_inst5_out),
    .in1(I7),
    .out(xor4_inst6_out)
);
assign O = xor4_inst6_out;
endmodule

